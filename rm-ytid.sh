#!/bin/bash
#   ______   ______   ______                             __
#  /      \ /      \ /      \                           |  \
# |  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ______   ______   ______ | ▓▓   __  _______
# | ▓▓ __\▓▓ ▓▓___\▓▓ ▓▓___\▓▓/      \ |      \ /      \| ▓▓  /  \/       \
# | ▓▓|    \\▓▓    \ \▓▓    \|  ▓▓▓▓▓▓\ \▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ▓▓_/  ▓▓  ▓▓▓▓▓▓▓
# | ▓▓ \▓▓▓▓_\▓▓▓▓▓▓\_\▓▓▓▓▓▓\ ▓▓  | ▓▓/      ▓▓ ▓▓   \▓▓ ▓▓   ▓▓ \▓▓    \
# | ▓▓__| ▓▓  \__| ▓▓  \__| ▓▓ ▓▓__/ ▓▓  ▓▓▓▓▓▓▓ ▓▓     | ▓▓▓▓▓▓\ _\▓▓▓▓▓▓\
#  \▓▓    ▓▓\▓▓    ▓▓\▓▓    ▓▓ ▓▓    ▓▓\▓▓    ▓▓ ▓▓     | ▓▓  \▓▓\       ▓▓
#   \▓▓▓▓▓▓  \▓▓▓▓▓▓  \▓▓▓▓▓▓| ▓▓▓▓▓▓▓  \▓▓▓▓▓▓▓\▓▓      \▓▓   \▓▓\▓▓▓▓▓▓▓
#                            | ▓▓
#                            | ▓▓
#                             \▓▓
#
# Removes the ID from a file downloaded with yt-dlp.
# Written by Gary Sparks @ https://github.com/GSSparks 2023

usage() {
    echo "Usage: $0 [filepath]"
    echo "  - If no filepath is provided, the script will run in the current directory."
    echo "  - If a filepath is provided, the script will operate on that specific file."
}

help() {
    echo "This script removes the ID from a file downloaded with yt-dlp."
    echo "Run this script in the directory containing your yt-dlp media files."
    echo "Or, run it against a single file by adding the filepath."
    echo
    usage
}

if [[ $1 == "-h" || $1 == "--help" ]]; then
    help
    exit 0
fi

if [[ -n $1 ]]; then
    if [[ -f $1 ]]; then
        file="$1"
    else
        echo "Error: Invalid file path."
        usage
        exit 1
    fi
else
    file="*"
fi

IFS=$'\n'
for file in $file; do
    echo "$file" | sed 's/\(.*\)\(.\{14\}\)\.\([^\.]*\)$/\1.\3/'
done
unset IFS

read -p "Are you sure you want to proceed with the renaming? (y/n): " choice
if [[ $choice == "y" ]]; then
    IFS=$'\n'
    for file in $file; do
        new_name=$(echo "$file" | sed 's/\(.*\)\(.\{14\}\)\.\([^\.]*\)$/\1.\3/')
        mv "$file" "$new_name"
    done
    unset IFS
    echo "Renaming completed."
else
    echo "Renaming aborted."
fi
