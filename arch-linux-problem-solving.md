### How to fix Avatar: Frontiers of Pandora on Heroic Games Launcher (Epic) not working because of incompatible DirectX version
?

### How to solve the problem where paru appears to do nothing (no stdout messages) after being evoked
?

### How to solve "error: failed to synchronize package databases (unable to lock database)"
Remove the pacman lock file:
```sh
sudo rm /var/lib/pacman/db.lck
```

Then reboot.

### How to fix Roboquest (installed on heroic games launcher from GOG.com) not working because of missing Microsoft visual C++ libraries
Use winetricks to install the Microsoft visual C++ 2015-2019 runtime:
```sh
WINEPREFIX=/home/raffaele/.games/prefixes/Roboquest winetricks vcrun2019
```

### How to fix plank not starting after disabling lightdm and using startx to boot X
add the following to `~/.bashrc`:
```
export XDG_SESSION_DESKTOP=bspwm
export XDG_SESSION_TYPE=x11 plank
```

### How to fix DBeaver not starting because of incorrect default java version
change default java version:
```sh
sudo archlinux-java set java-11-openjdk
```

### How to fix a broken X server that doesn't start (NVIDIA GPU)
Boot into an arch-linux live usb-drive

Perform an arch-chroot:
```sh
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt
arch-chroot /mnt
```

Remove /etc/X11/xorg.conf:
```sh
sudo rm -v /etc/X11/xorg.conf
```

Recreate /etc/X11/xorg.conf:
```sh
nvidia-xconfig
```

### How to solve "invalid or corrupted signature PGP" problem
Update arch linux keyring:
```sh
sudo pacman -Sy archlinux-keyring
```

### How to solve "failure of update" problem
Remove the auto-configured file (specified in the error log):
```sh
sudo rm path-to-file
```

### How to solve repository sync problem (?)
Remove cache files:
```sh
sudo paccache -r
```

### How to force-remove a package
```sh
sudo pacman -Rdd package
```

### How to get MakeMKV to detect my Pioneer BDR-XD07TS bluray drive:
```sh
su
echo sg > /etc/modules-load.d/sg.conf
exit
sudo modprobe sg
```

### How to grant Tauon Music Box (installed from flathub) permission to import music from ~/Music
```sh
flatpak override --user com.github.taiko2k.tauonmb --filesystem=~/Music
```

### How to solve screen tearing problem (NVIDIA)
```sh
sudo nvidia-settings
```

go to X Server Display Configuration

go to Advanced

enable ForceCompositionPipeline

enable ForceFullCompositionPipeline

click Save to X Configuration File and enter /etc/X11/xorg.conf

### How to change the owner and group of a directory
```sh
sudo chown raffaele:raffaele /run/media/raffaele/250GB
```

### How to add a locale
example: it_IT.UTF-8 :
```sh
sudo vim /etc/locale.gen
```

decomment it_IT.UTF-8

save

generate new locale:
```sh
sudo locale-gen
```

### How to backup and load Cinnamon DE settings
Backup:
```sh
dconf dump /org/cinnamon/ > cinnamon_desktop_backup
```

Load:
```sh
dconf load /org/cinnamon/ < cinnamon_desktop_backup
```

### How to find keyboard-key names from X events
```sh
xev
```

Then press key and look for the "keycode"

### How to find wifi connections with Networkmanager CLI
```sh
nmcli device wifi list
```

### How to solve "Paru is broken after update: error while loading shared libraries: libssl.so.1.1: cannot open shared object file: No such file or directory"
```sh
sudo pacman -Syu openssl-1.1
```
