#! /usr/bin/env bash

# ====== Detect the OS ====== #

if lsb_release -a 2> /dev/null | grep Ubuntu > /dev/null; then
    export TARGET_OS=ubuntu
else
    case "$OSTYPE" in
        darwin*)
            export TARGET_OS=osx
            ;;
        linux*)
            export TARGET_OS=linux
            ;;
        *)
            export TARGET_OS=""
            ;;
    esac
fi
