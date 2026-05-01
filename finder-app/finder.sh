#!/bin/sh
# Tester script for assignment 1 and assignment 2
# Author: Siddhant Jajoo

set -e
set -u

filesdir=""
searchstr=""
username=$(cat conf/username.txt)

if [ $# -lt 2 ]
then
	echo "This script takes two input arguments. Not enough arguments provided."
	exit 1
else
	filesdir=$1
	searchstr=$2
fi

if [ -d "$filesdir" ]; then
    echo "${filesdir} is a directory" >&2
fi

X=$(find $filesdir -type f | wc -l)
Y=$(grep -r ${searchstr} $filesdir | wc -l)

MATCHSTR="The number of files are ${X} and the number of matching lines are ${Y}"

echo $MATCHSTR
