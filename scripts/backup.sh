#!/usr/bin/env bash
##############################################################################
# Desc: Backup script to destination folder
##############################################################################

# Check
if [ $# -ne 1 ]; then
    echo "give target directory: $0 /full/path/where/to/copy/data"
    exit 1
fi

# What to backup
src_dirs="\
$HOME/.config/i3 \
$HOME/.ssh \
$HOME/.xinitrc \
$HOME/.Xresources \
$HOME/.bashrc \
$HOME/.bash_aliases \
$HOME/.vimrc \
$HOME/.vim/templates \
$HOME/.gnupg \
$HOME/.pki \
$HOME/.password-store \
$HOME/.local/bin \
$HOME/Documents \
$HOME/Music \
$HOME/Pictures \
/etc/udev/rules.d/ \
"

# Where to copy 
day=$(date +%Y%m%d)
hostname=$(hostname -s)
username=$(id -u -n)
dst_dir="$1/$hostname/$username/$day"

if [ ! -d $dst_dir ]; then
    echo "ℹ️  - Create destination directory"
    mkdir -p $dst_dir
fi

for target in $src_dirs;
do
    if [ -d $target ]; then
        mkdir -p $dst_dir$target && cp -r "$target" "$_/.."
    else
        cp $target $dst_dir
    fi
done

# Display destination
tree -al $dst_dir