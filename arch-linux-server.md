# Arch Linux Server Guide

<!-- TODO: add SSH setup -->
<!-- TODO: add ufw setup -->
<!-- TODO: add git setup -->
<!-- TODO: add tmux setup -->
<!-- TODO: add neovim super-lite custom setup -->
<!-- TODO: RAID setup with mdadm -->
<!-- TODO: add docker setup, lazydocker as dashboard -->
<!-- TODO: add minecraft server setup -->

## Remote Access

### Syncthing headless setup

Install [Syncthing](https://wiki.archlinux.org/title/Syncthing):

`sudo pacman -Syu syncthing`

Enable access from other machines:

`sed -i 's/<address>127.0.0.1:8384</address>/<address>0.0.0.0:8384</address>/g' ~/.local/state/syncthing/config.xml`

Then access the Syncthing GUI from your pc with `https://0.0.0.0:8384`

## Network Security

### SSH

...

## Storage

### RAID 1

## Services

### Docker

...

### Native

#### Minecraft

...

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

