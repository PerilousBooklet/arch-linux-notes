#!/usr/bin/bash

# Fonts
pacman --noconfirm -S cantarell-fonts
pacman --noconfirm -S ttf-sourcecodepro-nerd
pacman --noconfirm -S noto-fonts-cjk noto-fonts-emoji noto-fonts

# Productivity

## Arch tools
pacman --noconfirm -S --needed pkgstats devtools namcap archiso meld
paru -S debtap

## Web browser
pacman --noconfirm -S firefox

## EMail Desktop Client
pacman --noconfirm -S thunderbird

## Matrix Client
pacman --noconfirm -S element-desktop

## Zulip desktop client
paru --noconfirm -S zulip-desktop

## Password manager
pacman --noconfirm -S keepassxc

## Personal finance manager
#pacman --noconfirm -S gnucash gnucash-docs

## File manager
pacman --noconfirm -S thunar thunar-volman
paru --noconfirm -S papirus-folders
papirus-folder --color blue --theme Papirus-Dark
echo "TerminalEmulator=alacritty" > ~/.config/xfce4/helpers.rc

## Office suite
pacman --noconfirm -S libreoffice-fresh 
paru --noconfirm -S papirus-libreoffice-theme

## PDF management
pacman --noconfirm -S evince
pacman --noconfirm -S qpdf bcprov java-commons-lang

## Image viewer
pacman --noconfirm -S gthumb

## Color info
pacman --noconfirm -S gpick

## Music player
pacman --noconfirm -S cmus

## Video player
pacman --noconfirm -S mpv

## Screenshots
pacman --noconfirm -S flameshot

## Hand-written notes
pacman --noconfirm -S xournalpp

## Privacy-focused Youtube client
paru --noconfirm -S freetube-bin

## Graphics
pacman --noconfirm -S gimp inkscape krita
paru --noconfirm -S material-maker-bin
pacman --noconfirm -S blender f3d

## Audio/Video
paru --noconfirm -S tenacity picard
paru --noconfirm -S olive
paru --noconfirm -S natron-bin
paru --noconfirm -S makemkv makemkv-libaacs
pacman --noconfirm -S handbrake
paru --noconfirm -S obs-studio-tytan652 cef-minimal-obs-bin

## Research papers management
pacman --noconfirm -S zotero

## Dictionary
pacman --noconfirm -S dictd

## Backup archives management
pacman --noconfirm -S kiwix-desktop kiwix-tools libkiwix

## Manga/Anime downloader utilities
mkdir -vp $HOME/build
git clone https://github.com/KevCui/animepahe-dl.git ~/build/animepahe-dl
paru --noconfirm -S mangal

# Development

## Text editor / IDE
paru --noconfirm -S lite-xl
pacman --noconfirm -S fontconfig
pacman --noconfirm neovim ripgrep
#pacman --noconfirm intellij-idea-community-edition
#paru --noconfirm -S vscodium
#pacman --noconfirm -S code

## Source control management
#paru -S github-desktop-bin

## C/C++
pacman --noconfirm -S gcc make cmake

## Java
pacman --noconfirm -S jdk-openjdk
#paru --noconfirm -S eclipse-java

## R
#paru --noconfirm -S rstudio-desktop-bin

## Assembly MIPS-2000
#paru --noconfirm -S qtspim

## Minecraft mods
pacman --noconfirm -S jdk8-openjdk jdk11-openjdk jdk17-openjdk
paru --noconfirm -S blockbench-bin

## Arduino
#paru --noconfirm -S arduino-ide-bin

## PCB
#pacman --noconfirm -S kicad

## CAD
pacman --noconfirm -S freecad openscad
paru --noconfirm -S spacenavd

## TeX
pacman --noconfirm -S texlive-most texlive-lang
#pacman --noconfirm -S texstudio

## Lua
pacman --noconfirm -S lua

## Web
pacman --noconfirm -S nodejs

## Game dev
pacman --noconfirm -S godot

# Games

## Open source
#pacman --noconfirm -S 0ad
pacman --noconfirm -S minetest
#pacman --noconfirm -S supertuxkart
#pacman --noconfirm -S xonotic
#paru --noconfirm -S airshipper

## Minecraft
paru --noconfirm -S prismlauncher

## PS3 emulation
paru --noconfirm -S rpcs3-bin rpcs3-udev

## GOG/EpicGames/AmazonGames launcher
paru --noconfirm -S heroic-games-launcher-bin

## Steam
pacman --noconfirm -S steam libappindicator-gtk2 lib32-libappindicator-gtk2

# System Utilities
pacman --noconfirm -S ncdu eza

# Window manager setup utility apps

## Web browser
#pacman --noconfirm -S qutebrowser nyxt

## Password manager
#pacman --noconfirm -S pass

## File manager
pacman --noconfirm -S ranger poppler w3m

## PDF document viewer
pacman --noconfirm -S mupdf

## Screenshot
pacman --noconfirm -S scrot flameshot
