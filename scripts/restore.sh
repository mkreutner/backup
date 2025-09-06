#!/usr/bin/env bash
##############################################################################
# Desc: Restore script form archive into destination folder
##############################################################################

# Check
if [ $# -ne 1 ]; then
    echo "Please, give me what to restore! "
    echo "Usage: $0 <archive_name>"
    exit 1
fi

# Where to extract
day=$(date +%Y%m%d)
hostname=$(hostname -s)
username=$(id -u -n)
archname="${1}"
tmpdir="${HOME}/backup/tmp/"

if [ ! -d $tmpdir ]; then
    echo "ℹ️  - Create temporary directory"
    mkdir -p $tmpdir
fi

# Restore archive
tar -xzvf ${archname} -C ${tmpdir}
