#!/bin/bash

# Shell script to search for a pattern inside a bunch of
# files with the same extension (or extensions) and move
# them to a temporary directory.

# Idea is that you want to search for a particular pattern
# (e.g., "error1") in all .log files or similar. And you'd
# like to save those files that contain the pattern and 
# discard the others.

# This script simply echoes what it would do, rather than 
# actually doing it, as it's intended as a "jumping off" 
# point for other scripts.

# $1 = pattern to grep for
# $2 = extension (or list of extensions, separated by commas)
# $3 = dirname to create

# first argument is required
if test -z "$1"; then
    echo "usage: $0 pattern [extension][,extension] [dirname]"
    exit 0
fi

# set default values for 2nd and 3rd arg if not supplied
ext=${2:-txt}
dir=${3:-temp}

# creat directory to save files
echo mkdir $dir

# Use grep to find all files matching pattern then iterate
# through them to save so we can then rm * the rest.

for this_ext in $(tr ',' ' ' <<< $ext); do
    echo working on extension $this_ext
    for file in $(grep -l $1 *.$this_ext); do
        echo mv $file $dir
    done
done
