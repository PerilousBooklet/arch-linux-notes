# Arch Linux Server Guide

<!-- TODO: add SSH setup -->
<!-- TODO: add ufw setup -->
<!-- TODO: add git setup -->
<!-- TODO: add tmux setup -->
<!-- TODO: add neovim super-lite custom setup -->
<!-- TODO: add docker setup, lazydocker as dashboard -->
<!-- TODO: add minecraft server setup -->

## Remote Access

### Syncthing headless setup

Install [Syncthing](https://wiki.archlinux.org/title/Syncthing):

`sudo pacman -Syu syncthing`

Enable access from other machines:

```sh
sed -i 's|<address>127.0.0.1:8384</address>|<address>0.0.0.0:8384</address>|g' "~/.local/state/syncthing/config.xml"
```

Then access the Syncthing GUI from your pc with `https://0.0.0.0:8384`

## Network Security

### SSH

...

## Storage

<!-- https://linuxconfig.org/how-to-setup-raid1-on-linux -->

<!-- https://wiki.archlinux.org/title/RAID#Configure_mkinitcpio -->
<!-- https://wiki.archlinux.org/title/Mkinitcpio#Image_creation_and_activation -->

### RAID 1

Add `mdadm_udev` to the `HOOKS` array in `/etc/mkinitcpio.conf`, after the `block` entry.

Regenerate the initramfs: `mkinitcpio -P`

## 2x1TB SSDs

Get device paths: `lsblk`

Create drive labels:

```sh
sudo parted -s /dev/sda mklabel gpt
sudo parted -s /dev/sdb mklabel gpt
```

Create partitions:

```sh
sudo parted -s /dev/sda mkpart primary 1MiB 100%
sudo parted -s /dev/sdb mkpart primary 1MiB 100%
```

Activate RAID partition property:

```sh
sudo parted -s /dev/sda set 1 raid on
sudo parted -s /dev/sdb set 1 raid on
```

Create RAID:

`sudo mdadm --verbose --create /dev/md0 --level=1 --raid-devices=2 /dev/sda /dev/sdb`

Check raid device details:

`sudo mdadm --detail /dev/md0`

Examine every single device:

`sudo mdadm --examine /dev/sda /dev/sdb`

Create a new mountable partition:

`sudo mkfs.ext4 /dev/md0`

Mount the new partition:

```sh
sudo mkdir -v /pool
sudo mount /dev/md0 /pool
```

To setup auto-mount at boot, create a new entry in `/etc/fstab`, using the raid device's UUID.

Get the raid device's UUID:

`lsblk -o UUID /dev/md0`

<!-- https://linuxconfig.org/how-fstab-works-introduction-to-the-etc-fstab-file-on-linux -->
Example of a device entry in `/etx/fstab`:

```
# RAID Device /dev/md0
UUID=...  /pool  ext4  rw,relatime  0  2
```

Reload systemd:

`sudo systemctl daemon-reload`

## Services

Docker configuration...

Navidrome
Minecraft

## Security

Firewall:

```sh
sudo pacman -Syu ufw
```

Malware scanning:

```sh
sudo pacman -Syu clamav
```

Intrusion prevention:

```sh
sudo pacman -Syu fail2ban
```

User-space mandatory access control:

```sh
sudo pacman -Syu firejail
```

Kernel-space mandatory access control:

```sh
sudo pacman -Syu apparmor
```

## Backup

Semi-professional solution:

```sh
sudo pacman -Syu borg
```

