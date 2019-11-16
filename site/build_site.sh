#!/bin/bash

set -eou pipefail

function check_utils {

	#
	# https://stackoverflow.com/a/677212
	#

	for util in "${@}"
	do
		command -v ${util} >/dev/null 2>&1 || { echo >&2 "The utility ${util} is not installed."; exit 1; }
	done
}

function generate_sphinx_input {
	rm -fr build

	cd ../docs

	git clean -dfx .

	./update_examples.sh && ./update_permissions.sh

	cd ../site

	for product_name in `find ../docs -maxdepth 1 -mindepth 1 -printf "%f\n" -type d`
	do
		for version_name in `find ../docs/${product_name} -maxdepth 1 -mindepth 1 -printf "%f\n" -type d`
		do
			mkdir -p build/input/${product_name}-${version_name}/docs

			cp -R docs/* build/input/${product_name}-${version_name}

			cp -R ../docs/${product_name}/${version_name}/en/* build/input/${product_name}-${version_name}

			if [ ! -f "build/input/${product_name}-${version_name}/contents.rst" ]
			then
				mv build/input/${product_name}-${version_name}/contents.rst build/input/${product_name}-${version_name}
			fi
		done
	done

	rsync -a homepage/* build/input/homepage --exclude={'*.json','node_modules'}
}

function generate_static_html {
	for dir_name in `find build/input -maxdepth 1 -mindepth 1 -printf "%f\n" -type d`
	do

		#
		# Use Sphinx to generate static HTML.
		#

		sphinx-build -M html build/input/${dir_name} build/output/${dir_name}

		mv build/output/${dir_name}/html/* build/output/${dir_name}

		#
		# Make ZIP files.
		#

		for zip_dir_name in `find build/input/${dir_name} -name *.zip -type d`
		do
			pushd ${zip_dir_name}

			local zip_file_name=$(basename ${zip_dir_name})

			zip -r ${zip_file_name} .

			local output_dir_name=$(dirname ${zip_dir_name})

			output_dir_name=$(dirname ${output_dir_name})
			output_dir_name=${output_dir_name/input/output}

			popd

			mv ${zip_dir_name}/${zip_file_name} ${output_dir_name}
		done

		#
		# Fix broken links.
		#

		for html_file_name in `find build/output/${dir_name} -name *.html -type f`
		do
			sed -i 's/.md"/.html"/g' ${html_file_name}
			sed -i 's/.md#/.html#/g' ${html_file_name}
			sed -i 's/README.html"/index.html"/g' ${html_file_name}
			sed -i 's/README.html#/index.html#/g' ${html_file_name}
		done

		#
		# Rename README.html to index.html.
		#

		for readme_file_name in `find build/output/${dir_name} -name *README.html -type f`
		do
			mv ${readme_file_name} $(dirname ${readme_file_name})/index.html
		done

		#
		# Update search references for README.html to index.html.
		#

		sed -i 's/README"/index"/g' build/output/${dir_name}/searchindex.js
	done

	mv build/output/homepage/* build/output

	rmdir build/output/homepage
}

function main {

	#
	# sudo dnf install python3-sphinx
	#

	python3 -m venv venv

	source venv/bin/activate

	check_utils pip3 sphinx-build zip

	pip_install recommonmark sphinx-intl sphinx-markdown-tables sphinx-notfound-page

	generate_sphinx_input

	generate_static_html

	upload_to_server
}

function pip_install {
	for package_name in "$@"
	do
		if [[ -z `pip3 list --disable-pip-version-check --format=columns | grep ${package_name}` ]]
		then
			pip3 install --disable-pip-version-check ${package_name}
		fi
	done
}

function upload_to_server {

	#
	# TODO
	#

	echo upload_to_server
}

main ${@}