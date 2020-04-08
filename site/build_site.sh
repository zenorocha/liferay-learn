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

function parse_args_generate_input {

	rm -fr build

	cd ../docs

	./update_examples.sh && ./update_permissions.sh

	cd ../site

    product_name=$1
    version_name=$2
    commerce_default_version="2.x"
    dxp_default_version="7.x"
    dxp_cloud_default_version="latest"

    case $product_name in
        "commerce")      
            if [[ $version_name=="default" ]]; then
              version_name=${commerce_default_version}
            fi
            echo "Building $product_name $version_name"
            sleep 2
            generate_sphinx_input 
        ;;
        "dxp")
            if [[ $version_name=="default" ]]; then
              version_name=${dxp_default_version}
            fi
            echo "Building $product_name $version_name"
            sleep 2
            generate_sphinx_input 
        ;; 
        "dxp-cloud")
            if [[ $version_name=="default" ]]; then
              version_name=${dxp_cloud_default_version}
            fi
            echo "Building $product_name $version_name"
            sleep 2
            generate_sphinx_input 
        ;;
        "all")      
        # The for loops are the same for prod and all. I could combine them into one case and just check for "prod"
        # to run the git clean and the upload_to_server; would be shorter but maybe messier
        # must use the loops to find all products and versions 
            echo "Building All Products and Versions"
            sleep 2
            # must use the loops to find everything 
            for product_name in `find ../docs -maxdepth 1 -mindepth 1 -printf "%f\n" -type d`; do
                for version_name in `find ../docs/${product_name} -maxdepth 1 -mindepth 1 -printf "%f\n" -type d`; do
                    echo "Currently Building $product_name $version_name"
                    sleep 2
                    generate_sphinx_input
                done
            done
        ;;
        "prod")
        # git clean and must use the loops to find all products and versions 
        # git clean -dfx .
            echo "Building All Products and Versions for Production"
            sleep 2
            for product_name in `find ../docs -maxdepth 1 -mindepth 1 -printf "%f\n" -type d`; do
                for version_name in `find ../docs/${product_name} -maxdepth 1 -mindepth 1 -printf "%f\n" -type d`; do
                    echo "Currently Building: $product_name $version_name"
                    sleep 2
                    generate_sphinx_input
                done
            done
            # TODO: upload_to_server should somehow only be called for the "prod" case, after html is generated.
        ;;
        *)
        #handle invalid args: because I'm passing defaults (all default), this only gets called if an unhandled case gets passed
                echo "You must enter at least one argument: product_name"
                echo "Product name options: all | prod | commerce | dxp | dxp-cloud" 
                exit 1
        ;;
    esac

	rsync -a homepage/* build/input/homepage --exclude={'*.json','node_modules'}
}

function generate_sphinx_input {
            mkdir -p build/input/${product_name}-${version_name}/docs

			cp -R docs/* build/input/${product_name}-${version_name}

			cp -R ../docs/${product_name}/${version_name}/en/* build/input/${product_name}-${version_name}

			if [ ! -f "build/input/${product_name}-${version_name}/contents.rst" ]
			then
				mv build/input/${product_name}-${version_name}/contents.rst build/input/${product_name}-${version_name}
			fi
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

	pip_install recommonmark sphinx-intl sphinx-copybutton sphinx-markdown-tables sphinx-notfound-page

	parse_args_generate_input ${1:-all} ${2:-default}

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
	# TODO: Should only be called when the "prod" arg is passes
	#

	echo upload_to_server
}

main
