#!/bin/sh

set -e

if [ -z "$1" ]; then
    usage
    exit 1
fi

if [ -e "$1" ]; then
    echo 2>&1 "$1" already exists.
    exit 1
fi

cp -a skeleton "$1"
mv "$1"/NAME "$1"/"$1"
mv "$1"/tests/NAME_tests.py "$1"/tests/"$1"_tests.py
sed -i '' -e s/'My Project'/"$1"/ -e s/NAME/"$1"/ -e s/projectname/"$1"/ "$1"/setup.py

