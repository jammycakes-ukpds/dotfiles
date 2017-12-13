#! /usr/bin/env bash

if gsettings list-schemas | grep org.gnome.desktop.background > /dev/null; then
    gsettings set org.gnome.desktop.background picture-uri file://$DIR/home/bgbig2.jpg
    gsettings set org.gnome.desktop.background picture-options zoom
fi

if gsettings list-schemas | grep org.cinnamon.desktop.background > /dev/null; then
    gsettings set org.cinnamon.desktop.background picture-uri file://$DIR/home/bgbig2.jpg
    gsettings set org.cinnamon.desktop.background picture-options zoomn
fi