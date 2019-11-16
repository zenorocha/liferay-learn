#!/bin/bash

for dir_name in `find commerce/2.x/en/developer-guide/tutorial -maxdepth 2 -name *.zip -type d`
do
	cp -fr commerce/2.x/en/developer-guide/tutorial/_template/* ${dir_name}

	#pushd ${dir_name}

	#./gradlew classes formatSource

	#popd
done