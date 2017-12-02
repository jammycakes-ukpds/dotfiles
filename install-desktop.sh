#! /usr/bin/env bash

# This script should be run to install or update any desktop software
# that needs to be installed as an administrator or sudo user.
# It is intended for use on desktop PCs only.

if ! [ $(id -u) = 0 ]; then
    echo "This script can only be run as root."
    echo "Please run configure.sh to configure your directory."
    exit 255
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/lib/detect.sh"

if [ -f $DIR/$TARGET_OS/install-desktop.sh ]; then
    source "$DIR/$TARGET_OS/install-desktop.sh"
else
    echo 'desktop No install script has been found for this OS.'
    exit 1
fi
