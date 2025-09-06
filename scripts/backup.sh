#!/usr/bin/env bash
##############################################################################
# Desc: Backup script to destination folder
##############################################################################

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
archname="${HOME}/backup/${hostname}_${username}_${day}.tgz"
tmpdir="${HOME}/backup/tmp/${hostname}/${username}/${day}"

if [ ! -d $tmpdir ]; then
    echo "ℹ️  - Create temporary directory"
    mkdir -p $tmpdir
fi

for target in $src_dirs;
do
    if [ -d $target ]; then
        mkdir -p ${tmpdir}/${target} && cp -r "${target}" "$_/.."
    else
        cp ${target} ${tmpdir}
    fi
done

# Create archive
tar -czvf $archname $tmpdir

rm -rf $tmpdir
