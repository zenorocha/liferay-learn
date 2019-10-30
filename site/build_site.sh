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

	for product_name in `find ../docs -maxdepth 1 -mindepth 1 -printf "%f\n" -type d`
	do
		for version_name in `find ../docs/${product_name} -maxdepth 1 -mindepth 1 -printf "%f\n" -type d`
		do
			mkdir -p build/input/${product_name}-${version_name}/docs

			cp -R docs/* build/input/${product_name}-${version_name}

			cp -R ../docs/${product_name}/${version_name}/en/* build/input/${product_name}-${version_name}/docs

			#
			# TODO Generate ZIP files and update links.
			#

		done
	done

	# 
	# TODO Homepage: generate ZIP file and update links
	#
	rsync -a homepage/* build/input/homepage --exclude={'*.json','node_modules'}
}

function generate_static_html {
	for dir_name in `find build/input -maxdepth 1 -mindepth 1 -printf "%f\n" -type d`
	do
		sphinx-build-3 -M html build/input/${dir_name} build/output/${dir_name}
	done

	sphinx-build -M html build/input/homepage build/output/homepage
}

function main {

	#
	# sudo dnf install python3-sphinx
	#

	check_utils pip3 sphinx-build-3

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
			sudo pip3 install --disable-pip-version-check ${package_name}
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