#!/bin/bash

if [[ -z "$1" ]]; then
	echo "Requires at least a git repository URL as argument"
	exit 1
fi

if [[ ! "$1" =~ ^(http|https|git)(:\/\/|@)([^\/:]+)[\/:]([^\/:]+)\/(.+).git$ ]]; then
	echo "First argument must be a git repository URL"
	exit 1
fi

git clone "$1" /root/src
# if failed to clone, exit
if [[ $? -ne 0 ]]; then
	echo "Failed to clone repository"
	exit 1
fi

cd /root/src
/root/francinette/tester.sh "${@:2}"
