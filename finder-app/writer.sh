#!/bin/bash

writefile="$1"
writestr="$2"

# Validate arguments
if [ $# -lt 2 ]; then
    echo "Error: need 2 arguments: <file path> <string>" >&2
    exit 1
fi

# Create directory path if it doesn't exist
dirpath=$(dirname "$writefile")

if ! mkdir -p "$dirpath"; then
    echo "Error: could not create directory path $dirpath" >&2
    exit 1
fi

# Create/overwrite file with content
if ! echo "$writestr" > "$writefile"; then
    echo "Error: could not create or write file $writefile" >&2
    exit 1
fi

exit 0