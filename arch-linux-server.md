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
