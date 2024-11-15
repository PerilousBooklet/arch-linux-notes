#!/bin/bash

## 1 - Intall fundamental packages
pacman -S xterm alacritty tmux tmuxp xclip tealdeer
sed -i 's/Icon=Alacritty/Icon=Terminal/g' /usr/share/applications/Alacritty.desktop
pacman -S reflector pkgstats devtools namcap arch-wiki-docs arch-wiki-lite
paru -S downgrade aurutils
pacman -S arandr zip unzip gunzip p7zip unrar
pacman -S bash-completion
pacman -S lshw nmap
pacman -S rsync rclone wget yt-dlp
pacman -S neofetch htop ncdu tree onefetch
pacman -S lm_sensors hddtemp smartmontools
pacman -S power-profiles-daemon
pacman -S radeontop powertop corectrl
paru -S cpu-x
#pacman -S stow chezmoi
pacman -S bleachbit
pacman -S gpick lxappearance
pacman -S ttf-sourcecodepro-nerd

## 2 Install user packages
./part4-apps.sh
