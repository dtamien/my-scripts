#!/bin/bash

list_files_and_contents() {
    find . -type f | while read -r file; do
        echo "========================================"
        echo "File: $file"
        echo "========================================"
        cat "$file" 2>/dev/null || echo "Error reading file: $file"
        echo
    done
}

list_files_and_contents
