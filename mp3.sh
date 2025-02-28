#!/bin/bash

# Automatically change directory to Downloads, where the downloaded file flows to
cd ~/Downloads

read -p "Enter MP3 file name: " file

# Exits if file does not exist
if [ ! -f "$file" ]; then
	echo "Error: File not found"
	exit 1
fi

# Reads metadata from input
read -p "Enter Title: " title
read -p "Enter Artist: " artist albumartist
read -p "Enter Album: " album
read -p "Enter Genre: " genre
read -p "Enter Year: " year

# Tags the file
id3v2 -t "$title" -a "$artist" -T "$albumartist" -A "$album" -g "$genre" -y "$year" "$file"

echo "Metadata updated successfully!"

# Lists metadata for confirmation
id3v2 -l "$file"
