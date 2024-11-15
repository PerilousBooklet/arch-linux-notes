#!/bin/bash

## 1 - Setup an AUR Helper
pacman -S git
mkdir -vp ~/build/paru
git clone https://aur.archlinux.org/paru.git ~/build/paru
cd ~/build/paru
makpkg -si

## 2 - Spice up pacman
sed -i 's/#Color/Color/g' /etc/pacman.conf
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
echo -e "ILoveCandy" >> /etc/pacman.conf

## 3 - Setup the login Manager
# /

## 4 - Privileges and Authentication Management
pacman -S polkit lxsession
touch ~/.xprofile
echo "lxsession &" > ~/.xprofile

## 5 - Choose the display server (X11 or Wayland)
dialog --no-cancel --title "Display Server" --menu "Choose your preferred display server." 15 60 10 \
1 "X" \
2 "Wayland" \
2>choice-display-server.txt
choice_display_server="echo $(cat choice_display_server.txt)"
case $choice_display_server in
  1)
    pacman -S xorg xorg-xinit arandr
    # change de choice file
    ;;
  
  2)
    pacman -S wayland wlr-randr
    # change de choice file
    ;;
  
  *)
    # ?
    ;;
esac

## 6 - Choose a desktop environment or window manager
# choose between Cinnamon and BSPWM for X / Cinnamon and River
choice_desktop_environment=""

## 7 - GTK and QT configuration

## 8 - Ryzen 5 1600 sudden-crash/freeze work-around

## 9 - Laptop configuration (optional)
