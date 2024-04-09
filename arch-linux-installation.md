# Arch Linux Installation Guide

## Chapter 1 - Prepare the installation

### Setup keyboard layout
List all keyboard layouts:
```sh
ls /usr/share/kbd/keymaps/**/*.map.gz
```

Set keyboard layout:
```sh
loadkeys it
```

### Change console font
List all console fonts:
```sh
ls -l /usr/share/kbd/consolefonts/
```

Set console font:
```sh
setfont Lat2-Terminus16
```

### Check UEFI
```sh
ls /sys/firmware/efi/efivars
```

### Check internet connection
```sh
ip addr show
```

### Configure wi-fi
```sh
iwctl

device list

station device-name scan

station device-name get-networks

station device-name connect network-name

exit
```

### Syncronize system clock with the Network Time Protocol
```sh
timedatectl set-ntp true
```

### UEFI/GPT Partitioning

#### Setup partitions on a single SSD
Check SSD name and remember it (ex. /dev/sda, /dev/nvme0n1):
```sh
fdisk -l
```

Create two partitions:
1. EFI partition: 1024MB
2. Root partition: remaining space

Run the partitioning program:
```sh
cfdisk /dev/sda
```

Follow CAREFULLY the menu instructions.

#### Format partitions

##### ext4
```sh
mkfs.ext4 /dev/sda2

mkfs.fat -F32 /dev/sda1

mount /dev/sda2 /mnt

mkdir -p /mnt/boot/efi

mount /dev/sda1 /mnt/boot/efi
```

##### Logical volumes
?

### Setup repository mirrors
```sh
reflector --verbose --latest 10 --download-timeout 10 --country Germany --protocol https --completion-percent 100 --sort rate --save /etc/pacman.d/mirrorlist
```

### Install base packages
```sh
pacstrap /mnt base base-devel linux linux-lts linux-firmware man-db man-pages texinfo vi vim tmux git xterm alacritty bash-completion
```

### Generate file system tab
```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

Check contents:
```sh
vim /mnt/etc/fstab
```

## Chapter 2 - Configure the installation

### Change root into the new system
```sh
arch-chroot /mnt /bin/bash
```

### Setup locale (system language)
Un-comment your favorite language (es. en_US.UTF-8 UTF-8):
```sh
vim /etc/locale.gen
```

Generate locale configuration:
```sh
locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf

export LANG=en_US.UTF-8
```

### Confirm keyboard layout
```sh
touch /etc/vconsole.conf
echo "KEYMAP=us" > /etc/vconsole.conf
```

### Set the time zone
```sh
ln -s /usr/share/zoneinfo/Europe/Rome /etc/localtime
```

### Run hwclock to generate /etc/adjtime
```sh
hwclock --systohc --utc
```

### Network configuration
Set hostname:
```sh
echo "myhostname" > /etc/hostname
```

Add matching entries to the "hosts" file in the appropriate position (indicated below):
```sh
vim /etc/hosts
```

Write  into /etc/hosts the following:
```
127.0.0.1 localhost
::1 localhost
127.0.1.1 myhostname
```

### Set up networking tools
```sh
sudo pacman -S net-tools

sudo pacman -S dhcpcd

systemctl enable dhcpcd

dhcpcd netctl

sudo pacman -S iwd wpa_supplicant wireless_tools dialog iw

systemctl enable iwd
```

Install and enable NetworkManager:
```sh
sudo -s

sudo pacman -S networkmanager

systemctl enable NetworkManager
```

### Set the root password
```sh
passwd
```

Write password

### User settings
Create user:
```sh
useradd -m -G wheel -s /bin/bash username
```

Set user password
```sh
passwd username
```

Enable ? permissions for user:
```sh
export EDITOR=/usr/bin/vim && visudo
```

Remove comment from the line located right below the following comment: `Uncomment to allow members of group wheel to execute any command`

### Bootloader setup

#### GRUB
(Useful to easily multi-boot different operating systems.)

##### BIOS
```sh
sudo pacman -S grub efibootmgr os-prober

grub-install --target=i386-pc /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg
```

##### UEFI
```sh
sudo pacman -S grub efibootmgr os-prober

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader=GRUB

grub-mkconfig -o /boot/grub/grub.cfg
```

#### Unified Kernel Images
(Preferable when doing server installs)

Create the `/etc/cmdline.d` directory:
```sh
mkdir -v /etc/cmdline.d
```

Create the files that contain the kernel parameters:
(you can write the parameters to a single file or have more files, each corresponding to a set of parameters, for greater readibility)
(the files are used in alphabetical order)
```sh
cp -v /proc/cmdline /etc/cmdline.d/00-root.conf
```

Remove the `BOOT_IMAGE` parameter.

Modify `/etc/mkinitcpio.d/linux.preset`, or the preset that you are using, with the appropriate mount point of the EFI system partition, as follows:
```
# mkinitcpio preset file for the 'linux' package

#ALL_config="/etc/mkinitcpio.conf"
ALL_kver="/boot/vmlinuz-linux"
ALL_microcode=(/boot/*-ucode.img)

PRESETS=('default' 'fallback')

#default_config="/etc/mkinitcpio.conf"
#default_image="/boot/initramfs-linux.img"
default_uki="esp/EFI/Linux/arch-linux.efi"
default_options="--splash=/usr/share/systemd/bootctl/splash-arch.bmp"

#fallback_config="/etc/mkinitcpio.conf"
#fallback_image="/boot/initramfs-linux-fallback.img"
#fallback_uki="esp/EFI/Linux/arch-linux-fallback.efi"
#fallback_options="-S autodetect"
```

(Enable the fallback options if you plan to frequently change the computer's hardware configuration.)

Do it for every installed kernel and change the name reference accordingly.

Create a pacman hook to trigger a rebuild after a microcode upgrade:
```sh
touch /etc/pacman.d/hooks/ucode.hook
```

Write the following into `/etc/pacman.d/hooks/ucode.hook`:
```
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
# Change to appropriate microcode package
Target=amd-ucode
# Change the linux part above and in the Exec line if a different kernel is used
Target=linux

[Action]
Description=Update Microcode module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```
<!-- TODO: Do I need to create 2 different hook files if I have linux and linux-lts installed? -->

<!-- Secure boot setup (optional) -->

<!-- LUKS setup (optional) -->

Regenerate the `initramfs` for all installed kernels:
(In this case `esp` is `/boot/efi`)
```sh
mkdir -p esp/EFI/Linux
mkinitcpio -P
```

Create UEFI boot entries with `efibootmgr`:
```sh
efibootmgr --create --disk /dev/sda --part 1 --label "Arch Linux - linux" --loader '\EFI\Linux\arch-linux.efi' --unicode
efibootmgr --create --disk /dev/sda --part 1 --label "Arch Linux - linux-lts" --loader '\EFI\Linux\arch-linux-lts.efi' --unicode
```
<!-- Add a boot splash image -->

### Systemd-boot

#### UEFI

Install systemd-boot to the ESP:
```sh
bootctl --esp-path=/boot/efi install
```

Configure systemd-boot:

Open `esp/loader/loader.conf` and add `default @saved` to it.

### Microcode software installation
For Intel:
```sh
sudo pacman -S intel-ucode
```

For AMD:
```sh
sudo pacman -S amd-ucode
```

Refresh bootloader configuration to automatically enable microcode updates:
```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

### Install display server
X11:
```sh
sudo pacman -S xorg xorg-xinit arandr
```

Wayland:
```sh
sudo pacman -S wayland
```

### Configure graphics drivers
Enable multilib repository (uncomment):
```sh
vim /etc/pacman.conf
```

Refresh repositories:
```sh
sudo pacman -Syy
```

Install the appropriate graphics drivers and tools (see the arch wiki for package names)

Intel (for integrated GPUs):
```sh
sudo pacman -S mesa lib32-mesa vulkan-intel lib32-vulkan-intel
```

Intel (for dedicated GPUs):
```sh
sudo pacman -S ?
```

AMD (for integrated GPUs):
```sh
sudo pacman -S vulkan-radeon amdvlk
```

AMD (for dedicated GPUs):
```sh
sudo pacman -S mesa xf86-video-amdgpu libva-mesa-driver mesa-vdpau vulkan-radeon amdvlk radeontop corectrl
```

NVIDIA
```sh
sudo pacman -S nvidia nvidia-lts nvidia-settings
```

### Install a Desktop Environment or a Window Manager
Cinnamon:
```sh
sudo pacman -S cinnamon
```

XFCE:
```sh
sudo pacman -S xfce4
```

### Login Manager
LightDM:
```sh
sudo pacman -S lightdm lightdm-gtk-greeter
```

### Install audio server
Pulseaudio:
```sh
sudo pacman -S pulseaudio pulseaudio-alsa pamixer pavucontrol alsa-utils
```

Pipewire:
```sh
sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-docs wireplumber wireplumber-doc qpwgraph alsa-utils
sudo pacman -S pamixer pavucontrol
```

### Exit chroot
```sh
exit
```

### Reboot
```sh
reboot
```

## Chapter 3 - Customize the installation

Optional: if on laptop, use this networkmanager script to connect to wifi:
```sh
#!/bin/sh
nmcli device wifi connect "$1" password "$2"
```

The first variable stands for `wifi` name and the second for the `password`.

To find the wifi name:
```sh
nmcli device wifi list
```

### AUR Helper
paru:
```sh
sudo sudo pacman -S git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

### Spice up pacman and paru

Go to pacman's configuration file:
```sh
vim /etc/pacman.conf
```

uncomment the following:
```
#Color
#ILoveCandy
#ParallelDownloads=5
```

Go to paru's configuration file:
```sh
vim /etc/paru.conf
```

uncomment the following:
```
#NewsOnUpgrade
```

### Privileges and Authentication Management
```sh
sudo pacman -S polkit lxsession
touch ~/.xprofile
echo "lxsession &" > ~/.xprofile
```

### Desktop Environment Setup
cinnamon:
```sh
sudo pacman -S cinnamon papirus-icon-theme
paru -S mint-themes papirus-folders
touch ~/.xinit
echo 'exec cinnamon-session' > ~/.xinit
echo '
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
' > ~/.bash_profile
```

### Window Manager Setup
bspwm(x11):
```sh
sudo pacman -S bspwm sxhkd rofi polybar feh dunst picom i3lock imagemagick scrot python-pywal
```

river(wayland):
```sh
sudo pacman -S river waybar ?
```

### X configuration

#### Desktop
Disable default X lockscreen:
```sh
vim /etc/X11/xorg.conf
```

Write the following at the end of the file:
```sh
Section "ServerFlags"
    Option    "blank time" "0"
    Option    "standby time" "0"
    Option    "suspend time" "0"
    Option    "off time" "0"
EndSection
```

#### Laptop
Enable the touchpad:

Install the synaptics driver:
```sh
sudo pacman -S xf86-input-synaptics
```

Create the configuration file:
```sh
touch /etc/X11/xorg.conf.d/70-synaptics.conf
```

Write the following inside of `/etc/X11/xorg.conf.d/70-synaptics.conf`:
```
# source: https://wiki.archlinux.org/title/Touchpad_Synaptics#Configuration
Section "InputClass"
    Identifier "touchpad"
    Driver "synaptics"
    MatchIsTouchpad "on"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
        Option "TapButton3" "2"
        Option "VertEdgeScroll" "on"
        Option "VertTwoFingerScroll" "on"
        Option "HorizEdgeScroll" "on"
        Option "HorizTwoFingerScroll" "on"
        Option "CircularScrolling" "on"
        Option "CircScrollTrigger" "2"
        Option "EmulateTwoFingerMinZ" "40"
        Option "EmulateTwoFingerMinW" "8"
        Option "CoastingSpeed" "0"
        Option "FingerLow" "30"
        Option "FingerHigh" "50"
        Option "MaxTapTime" "125"
EndSection
```

Power management configuration:
```sh
sudo pacman -S power-profiles-daemon
systemctl enable --now power-profiles-daemon
```

Backlight configuration (Intel only):
```sh
sudo pacman -S xorg-xbacklight
```

### Ryzen 5 1600 sudden-crash/freeze work-around
```sh
paru -S disable-c6-systemd
systemctl enable disable-c6.service
systemctl start disable-c6.service
systemctl status disable-c6.service
```

### GTK and QT Configuration
Set the mouse cursor theme with lxappearance.

Install a package to enable correct rendering of Gruvbox GTK theme for Cinnamon:
```sh
sudo pacman -S gtk-engine-murrine
```

#### X - Force cursor theme in bspwm root window
Go to `~/.config/bspwm/bspwmrc`:
```sh
vim .config/bspwm/bspwmrc
```

Write the following:
```
xsetroot -cursor_name left_ptr
```

#### QT
Install the necessary packages:
```sh
sudo pacman -S qt5-base qt5-doc adwaita-qt5 qt6-base qt6-doc adwaita-qt6 qtcurve kvantum qt5ct
paru -S nordic-theme
```

Setup the configuration files:
```sh
vim .bashrc
```

Add the following:
```sh
export QT_SELECT=5
export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME=qt5ct
```

#### GTK
Install the necessary packages:
```sh
sudo sudo pacman -S gtk3 gnome-themes-extra dconf-editor
```

Setup the configuration files:
```sh
vim .bashrc
```

Install the nordic-theme:
```sh
paru -S nordic-theme
```

Add the following:
```sh
export GTK_THEME=Nordic
```

Set the Nordic theme in the lxappearance menu.

### Setup virtualization
Install qemu with virt-manager:

Install all the packages needed to run KVM:
```sh
sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat
sudo pacman -S ebtables iptables-nft
```

N.B.: iptables-nft is expected to replace iptables.

Install a set of tools used to access and modify virtual machine (VM) disk images:
```sh
sudo pacman -S libguestfs
```

Install a package to support virtualization of TPL 2.0 for Windows 11:
```sh
sudo pacman -S swtpm
```

Start KVM libvirt service:
```sh
systemctl enable libvirtd.service
systemctl start libvirtd.service
```

Show service status:
```sh
systemctl status libvirtd.service
```

We want to use our standard Linux user account to manage KVM:

Open the file /etc/libvirt/libvirtd.conf for editing:
```sh
vim /etc/libvirt/libvirtd.conf
```

Set the UNIX domain socket group ownership to libvirt by uncommenting (around line 81):
```
unix_sock_group = "libvirt"
```

Set the UNIX socket permissions for the R/W socket by uncommenting (around line 104):
```
unix_sock_rw_perms = "0770"
```

Add your user account to libvirt group:
```sh
usermod -aG libvirt raffaele
newgrp libvirt
```

Restart libvirt daemon:
```sh
systemctl restart libvirtd.service
```

Enable UEFI support for KVM virtual machines:
```sh
sudo pacman -S edk2-ovmf
```

### Setup printer
Install CUPS:
```sh
sudo pacman -S cups
```

Enable cups:
```sh
systemctl enable --now cups
```

Add current user to the lp group:
```sh
usermod -aG lp raffaele
```

Install a GUI printer manager:
```sh
sudo pacman -S system-config-printer
```

Install specific printer drivers (for most HP printers):
```sh
sudo pacman -S hplip
```

Install general printer drivers:
```sh
sudo pacman -S gutenprint foomatic-db-gutenprint-ppds
```

Search for the printer's IP address.

Open `system-config-printer`.

Add the Network Printer and insert the printer's IP.

Follow the menu.

### Setup local file sync
Install syncthing:
```sh
sudo pacman -S syncthing
```

Start/enable syncthing:
```sh
systemctl start syncthing.service
systemctl enable syncthing.service
```

Setup device sync from web interface.

### Setup UVC Webcam/Camera
Install video4linux:
```sh
sudo pacman -S v4l-utils
```

Check devices:
```sh
v4l2-ctl --list-devices
```

### Setup Wacom Tablet
Install drivers:
```sh
sudo pacman -S xf86-input-wacom
```

Search for wacom tablet name:
```sh
xsetwacom --list devices
```

Search for the output address needed by xsetwacom:
```sh
xrandr
```

Search for the wacom display; right of the device name there is an address: es. 1920x1080+320+1080
Use that address in the following command, together with the wacom tablet name:

Map device to display:
```sh
xsetwacom --set "Wacom One Pen Display 13 Pen stylus" MapToOutput 1920x1080+...+...
```

### Setup bluetooth
Installing packages:
```sh
sudo pacman -S bluez bluez-plugins bluez-utils blueman
```

Check devices:
```sh
lsmod | grep btusb
```

Check config:
```sh
vim /etc/bluetooth/main.conf
```

Enable bluetooth:
```sh
systemctl enable bluetooth.service
systemctl start bluetooth.service
```

Install support for pulseaudio with bluetooth:
```sh
sudo pacman -S pulseaudio-bluetooth
```

### Setup pinetime companion app
Install companion app:
```sh
paru -S itd-git
```

### Security

#### Malware detection:
```sh
sudo pacman -S clamav
```

#### Firewalls:
iptables:
```sh
?
```

ufw:
```sh
sudo pacman -S ufw
sudo pacman -S iptables
reboot
systemctl enable ufw.service
systemctl start ufw.service
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable
ufw status
```

#### Mandatory access control
firejail (user-space level):
```sh
sudo pacman -S firejail fire-tools
sudo firecfg
firecfg --clean #(?)
```

apparmor (kernel-space level):
```sh
sudo pacman -S apparmor
systemctl enable apparmor.service
aa-enabled
aa-status
```

#### Shared devices
```sh
sudo pacman -S fail2ban
```

### Backup
Basic solution: `rclone`

Advanced solution: `borg`

## Final Reboot
```sh
reboot
```
