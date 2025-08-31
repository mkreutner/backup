#!/usr/bin/env bash
##############################################################################
# Desc: Restore script form source folder to destination folder
##############################################################################

# Check
if [ $# -ne 2 ]; then
    echo "Please, give FROM and TO directories: $0 /full/path/FROM/without/trailing/slash /full/path/TO/without/trailing/slash"
    exit 1
fi