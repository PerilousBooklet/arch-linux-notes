#!/bin/bash

## 1 - Introduction
dialog --defaultno --title "Arch Linux TUI Installer" --yesno \
"How to interact with the installer: \n\n\
Space (select option) \n\n\
Enter (accept selected option) \n\n\
Arrows (move selector) \n\n\
Do you want to continue?" 15 60 || exit

## Choice: is ths a desktop or a laptop?
dialog --backtitle "Is this a desktop or a laptop pc?" \
  --radiolist "Select pc type:" 20 40 10 \
        1 desktop off \
        2 laptop off

## 2 - Setup keyboard layout
# get list of available keyboard layouts
# radiolist (single choice)
loadkeys us

## 3 - Check UEFI
check_uefi=$(cat /sys/firmware/efi/fw_platform_size)
if [[ $check_uefi = "" ]]; then
  echo -e "This computer doesn't support UEFI!"
fi

## 4 - Check Internet connection

## 5 - If there is a WIFI card, choose wether or not to configure the wifi connection
# get list of wifi connections
# radiolist
# choose to enable wifi connection or not

## 6 - Syncronize system clock with the Network Time Protocol
timedatectl set-ntp true

## 7 - Partitioning
# get list of mass storage devices
# choose partitioning setup (BIOS + MBR, UEFI + MBR, UEFI + GPT)
# radiolist (the os will be installed on a single mass storage device)

## 8 - Setup repository mirrors
# get list of countries where there are available mirrors
# choose country
# radiolist
reflector --verbose --download-timeout 10 --latest 10 --protocol https --completion-percent 100 --country Germany --sort rate --save /etc/pacman.d/mirrorlist

## 9 - Install base packages
pacstrap /mnt base base-devel linux linux-lts linux-firmware man-db man-pages texinfo vim xterm alacritty

## 10 - Generate file system tab
genfstab -U /mnt >> /mnt/etc/fstab
