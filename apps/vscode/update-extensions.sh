#! /usr/bin/env bash

code --list-extensions | sort -f > $(dotfiles)/apps/vscode/extensions.txt