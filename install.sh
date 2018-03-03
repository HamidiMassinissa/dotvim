#!/bin/bash

powerline_font_path="./misc/powerline/font"

if [ ! -e $powerline_font_path ]; then
    echo "$powerline_font_path does not exist!"
    exit -1
fi

echo "Installing powerline fonts"

# get one of the available font paths
font_path=$(xset q | grep fonts | sed 's/[:,].*//')
echo "Selected font path for installation: $font_path"

echo "Moving .otf file ..."
if [ -f $powerline_font_path/PowerlineSymbols.otf ]; then
    cp $powerline_font_path/PowerlineSymbols.otf $font_path
    if [ ! $? -eq 0 ]; then
        exit $? 
    fi
else
    echo "$powerline_font_path/PowerlineSymbols.otf does not exist"
    exit -1
fi

# Update font cache for the path the font was moved to
# (root priveleges may be needed to update cache for
# the system-wide paths)
echo "Updating font cache ..."
fc-cache -vf $font_path


# Install the fontconfig file. For newer versions of
# fontconfig the config path is ~/.config/fontconfig/conf.d/,
# for older versions it’s ~/.fonts.conf.d/
echo "Installing the fontconfig file ..."
if [ -f $powerline_font_path/10-powerline-symbols.conf ]; then
    cp $powerline_font_path/10-powerline-symbols.conf \
        ~/.config/fontconfig/conf.d/
    if [ ! $? -eq 0 ]; then
        exit $? 
    fi
else
    echo "$powerline_font_path/10-powerline-symbols.conf does not exist"
    exit -1
fi
