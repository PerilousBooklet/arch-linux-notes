# Arch Linux Server Guide

## Setup
1. ssh
2. mdadm (software RAID)
3. tmux
4. docker
5. lazydocker

## Security
Firewall:
```sh
sudo pacman -S ufw
```

Malware scanning:
```sh
sudo pacman -S clamav
```

Log scan/IP ban:
```sh
sudo pacman -S fail2ban
```

User-space mandatory access control:
```sh
sudo pacman -S firejail
```

Kernel-space mandatory access control:
```sh
sudo pacman -S apparmor
```

## Backup
Semi-professional solution:
```sh
sudo pacman -S borg
```
