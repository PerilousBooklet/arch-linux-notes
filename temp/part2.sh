#!/bin/bash

## 1 - Change root into the new system
arch-chroot /mnt

## 2 - Setup locale (system language)
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

## 3 - Confirm keyboard layout
echo KEYMAP=us > /etc/vconsole.conf

## 4 - Set the time zone
ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime

## 5 - Run hwclock to generate /etc/adjtime
hwclock --systohc

## 6 - Setup network configuration
echo "arch-desktop" > /etc/hostname
echo < EOF
127.0.0.1 localhost
::1 localhost
127.0.1.1 arch-desktop
EOF > /etc/hosts

## 7 - Set up networking tools
pacman -S net-tools dhcpcd
systemctl enable dhcpcd
dhcpcd netctl
pacman -S iwd wpa_supplicant wireless_tools dialog iw
systemctl enable iwd

## 8 - Set the root password
dialog --no-cancel --passwordbox "Enter the root password:" 15 60 2> root_pswd.txt
passwd $(cat root_pswd.txt)
rm ./root_pswd.txt

## 9 - Configure user settings
dialog --no-cancel --passwordbox "Enter the user password:" 15 60 2> user_pswd.txt
useradd -m "raffaele" -p "$(cat ./user_pswd.txt)" -G wheel -s /bin/bash 
rm ./user_pswd.txt

## 10 - setup the unified kernel images

## 11 - Setup the cpu microcode
pacman -S amd-ucode
grub-mkconfig -o /boot/grub/grub.cfg

## 12 - Install some packages for network management
pacman -S alsa-utils networkmanager
systemctl enable NetworkManager
systemctl disable dhcpcd

## 13 - Install display server
pacman -S xorg xorg-xinit arandr

## 14 - Configure graphics drivers
sed -i 's/#[multilib]/[multilib]/g' > /etc/pacman.conf
sed -i 's/"#Include = /etc/pacman.d/mirrorlist"/"Include = /etc/pacman.d/mirrorlist"/g' > /etc/pacman.conf
# AMD
pacman -S mesa xf86-video-amdgpu libva-mesa-driver mesa-vdpau vulkan-radeon amdvlk radeontop corectrl nvtop

## 15 - Install audio server
pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-docs wireplumber wireplumber-doc qpwgraph pamixer pavucontrol
