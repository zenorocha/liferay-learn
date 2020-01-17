#!/bin/bash

product=$1
fwoe=$2
file="${2}.md"
dir1=$3
dir2=$4

if [ "$1" == "--help" ] || [ "$1" == "--usage" ]
then
	echo "Moves markdown file and fixes all links to and from other markdown files. Only use for files with unique names."
	echo
	echo "Usage: ./refactor_file.sh <product> <file-name> <current-dir> <target-dir>"
	echo
	echo "Example: ./refactor_file.sh dxp-cloud introduction-to-x.md build-and-deploy getting-started"

	exit 1
fi

prefix=""

if [ "$1" == "test" ]
then
	prefix="test/"
fi

if [ "$1" == "commerce" ]
then
	prefix="commerce/2.x/en/"
fi

if [ "$1" == "dxp-cloud" ]
then
	prefix="dxp-cloud/latest/en/"
fi

if [ "$1" == "dxp" ]
then
	prefix="dxp/7.x/en/"
fi

prefixwos=${prefix%"/"}

if [ "${dir1: -1}" != "/" ]
then
	dir1="${dir1}/"
fi

if [ "${dir2: -1}" != "/" ]
then
	dir2="${dir2}/"
fi

if test ! -f "${prefix}${dir1}${file}"
then
	echo "File not found in specified location! (Are you sure it's a .md file?)"

	exit 1
fi

rootpath="$(pwd)/${prefixwos}"

# collect locations of files that the file is pointing to before it's moved;
# do this by creating parallel arrays of the links and the locations of their corresponding files;
# files that don't exist or cannot be found have empty arrays in files entry and can be skipped later

links=($(grep -o "([^)]*.md)" "${prefix}${dir1}${file}"))

files=()

for link in "${links[@]}"
do
	# trim surrounding parentheses
	link="${link//(}"
	link="${link//)}"

	linkname=$(basename "$link")
	relativedir=$(dirname "$link")

	findfiles=$(find "$prefix" -name "$linkname")
	locations=($findfiles)

	# if more than one file location is found (so probably a README.md), then relative path will have to be used to identify the correct one
	if [ "${#locations[@]}" -gt 1 ]
	then
		if $(test -f "${prefix}${dir1}${link}")
		then
			# if the file is found at the relative path, trim it and add it to array

			trimmedpath=$(realpath "${prefix}${dir1}${link}")
			trimmedpath=${trimmedpath#"$rootpath"}
			trimmedpath=${trimmedpath#/}

			files+=( "$trimmedpath" )
		else
			# even if nothing is found, add at least an empty element to array to keep it parallel

			files+=( "" )
		fi
	else
		# file is only at one location, so just trim prefix and add it to array

		files+=( "${locations[0]#${prefix}}")
	fi
done

# move the file, and any associated images with it

if test ! -f "${prefix}${dir2}"
then
	mkdir -p "${prefix}${dir2}"
fi

mv "${prefix}${dir1}${file}" "${prefix}${dir2}${file}"

if test -d "${prefix}${dir1}${fwoe}"
then
	mv "${prefix}${dir1}${fwoe}" "${prefix}${dir2}${fwoe}"
fi

# fixing links in other files

for f in $(find "$prefix" -type f -iname '*.md')
do
	fname=$(basename "$f")
	fdir=$(dirname "$f")

	fdir=${fdir#"$prefixwos"}
	fdir=${fdir#"/"}

	if [ "$fname" == "$file" ]
	then
		continue
	fi

	correctedpath=""
	pathprefix=""
	pathtodir2="$dir2"
	matchingsofar="true"

	IFS='/' read -ra ADDR <<< "$fdir"

	# building corrected relative path, folder by folder

	for d in "${ADDR[@]}"
	do
		if [ "$matchingsofar" == "true" ] && [[ $pathtodir2 == "$d"* ]]
		then
			pathtodir2=${pathtodir2#"$d"}
			pathtodir2=${pathtodir2#/}
		else
			matchingsofar="false"

			correctedpath="${correctedpath}../"
		fi
	done

	if [ "$correctedpath" == "" ]
	then
		correctedpath="./"
	fi

	correctedpath="${correctedpath}${pathtodir2}"

	sed -i "s~([^)]*/${file})~(${correctedpath}${file})~g" "$f"
done

# fixing links just within the moved file itself

for ((i=0;i<"${#links[@]}";i++))
do
	if [ "${files[$i]}" == "" ]
	then
		# maybe add warning message for when a link is skipped because no file was found?
		continue
	fi

	l="${links[$i]//(}"
	l="${l//)}"
	f="${files[$i]}"

	fname=$(basename "$f")
	fdir=$(dirname "$f")

	relativepath=""
	pathprefix=""
	pathtof="$fdir"
	matchingsofar="true"

	IFS='/' read -ra ADDR <<< "$dir2"

	# building corrected relative path, folder by folder

	for d in "${ADDR[@]}"
	do
		if [ "$matchingsofar" == "true" ] && [[ $pathtof == "$d"* ]]
		then
			pathtof=${pathtof#"$d"}
			pathtof=${pathtof#/}
		else
			matchingsofar="false"

			relativepath="${relativepath}../"
		fi
	done

	if [ "$relativepath" == "" ]
	then
		relativepath="./"
	fi

	relativepath="${relativepath}${pathtof}"

	if [ "${relativepath: -1}" != "/" ]
	then
		relativepath="${relativepath}/"
	fi

	sed -i "s~${links[$i]}~(${relativepath}${fname})~g" "${prefix}${dir2}${file}"
done

echo "${file} refactored to ${dir2}. Please update the corresponding .rst files."