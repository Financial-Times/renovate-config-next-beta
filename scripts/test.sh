#!/bin/bash

if [[ ! $CI ]]; then
	exit 0
fi

mv renovate.json renovateOrig.json
node scripts/json5-to-json

if cmp -s renovateOrig.json renovate.json;then
	rm renovateOrig.json
	echo "renovate.json has been compliled from renovate.json5"
	exit 0 
else 
	mv renovateOrig.json renovate.json
	echo "renovate.json and renovate.json5 are different, please check that renovate.json is compiled when commiting"
	exit 1
fi
