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

### Download files from server

`scp -P 2237 -r minecraft@2.229.203.28:/path/to/remote_file_or_folder /path/to/local_file_or_folder`

### Upload files to server

`scp -P 2237 -r /path/to/local_file_or_folder minecraft@2.229.203.28:/path/to/remote_file_or_folder`

## Network Security

## Storage

### RAID 1

### RAID 5

## Services

### Docker

### Native

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
