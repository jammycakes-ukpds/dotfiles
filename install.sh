#! /usr/bin/env bash

# This script should be run to install or update any prerequisites
# that need to be installed as an administrator or sudo user.
# It is intended for use on both desktop PCs and servers.

if ! [ $(id -u) = 0 ]; then
    echo "This script can only be run as root."
    echo "Please run configure.sh to configure your directory."
    exit 255
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/lib/detect.sh"

if [ -f $DIR/$TARGET_OS/install.sh ]; then
    source "$DIR/$TARGET_OS/install.sh"
else
    echo 'No install script has been found for this OS.'
    exit 1
fi

