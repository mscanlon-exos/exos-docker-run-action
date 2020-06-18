#!/usr/bin/env bash

if [ ! -z $INPUT_USERNAME ];
then echo $INPUT_USERNAME | docker login $INPUT_REGISTRY -u $INPUT_PASSWORD --password-stdin
fi

echo "$INPUT_RUN" | sed -e 's/\\n/;/g' > semicolon_delimited_script

exec docker run $INPUT_OPTIONS $INPUT_IMAGE /bin/$INPUT_SHELL -c "`cat semicolon_delimited_script`"
