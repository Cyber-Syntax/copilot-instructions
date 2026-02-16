#!/bin/bash

# Script to remove all .bak files recursively from the current directory and subdirectories

find . -name "*.bak" -type f -delete

echo "All .bak files have been removed."
