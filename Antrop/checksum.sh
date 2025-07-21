#!/bin/bash

# Check if a filename is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Get the filename from the argument
FILENAME=$1

# Check if the file exists
if [ ! -f "$FILENAME" ]; then
    echo "File not found: $FILENAME"
    exit 1
fi

# Calculate and display the checksum
CHECKSUM=$(sha256sum "$FILENAME" | awk '{ print $1 }')
echo "SHA-256 checksum of $FILENAME: $CHECKSUM" 
