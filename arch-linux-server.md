# Arch Linux Server Guide

<!-- TODO: add git setup -->
<!-- TODO: add tmux setup -->
<!-- TODO: add basic vim setup -->
<!-- TODO: add docker setup, lazydocker as dashboard -->

TODO: brief intro

## Remote Access

TODO: brief intro

The standard way of connecting to your servers in your homelab and on a VPS is through SSH.

Also, a self-hosted VPN allows your smartphone and laptop to securely access your homelab's services from outside.

### SSH

> [!NOTE]
> Use `nmap -sP x.x.x.0/24` to scan the LAN for the server's IP (replace `x.x.x.0` with LAN IP address).

#### With password

> [!NOTE]
> Before starting, note down the server's IP address and remember the server's username and password

1. Change the SSH port: `sed -i 's/#Port 22/Port 2237/g' /etc/ssh/sshd_config`
2. Prohibit root login: add `PermitRootLogin no` to `/etc/ssh/sshd_config`.
3. Enable and start the SSH daemon: `sudo systemctl enable --now sshd`
4. Connect to the server remotely (replace `x.x.x.x` with IP address): `ssh -p 2237 username@x.x.x.x`

#### With keys

Generate an SSH key (each user has its own): `ssh-keygen -t rsa -f ~/.ssh/keyname`

Choose an appropriate key name.

Choose an appropriate security password.

Write down the security password into the password database.

Copy the generated keys to the server (replace `x.x.x.x` with IP address): `ssh-copy-id -i ~/.ssh/keyname.pub -p 2237 username@x.x.x.x`

Connect with `ssh -i /home/user/.ssh/keyname -p 2237 username@x.x.x.x`

> [!NOTE]
> Optional but strongly advised: https://wiki.archlinux.org/title/OpenSSH#Force_public_key_authentication

### Self-hosted VPN

Wireguard is a simple and fast modern VPN that utilizes state-of-the-art cryptography.

Setting up a VPN is not as straightforward as setting up a conventional service on Docker,
several steps that involve different environments and devices are required:

- Get static home IP (if you can't, use noip.com + auto-update service)
- Setup wireguard container on Docker
- Open port on server firewall
- Open port on home router firewall
- Wireguard android app (client)
- `wireguard-tools` (laptop, manual setup)
- Connect stuff

## Security

TODO: brief intro

### Firewall

TODO: brief intro

Install and activate `ufw`:

```sh
sudo pacman -Syu ufw iptables
sudo systemctl enable --now ufw.service
```

Set basic firewall rules:

```sh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 2237/tcp # the port for SSH
sudo ufw enable
sudo ufw status
```

Set advanced firewall rules:

`sudo vim /etc/sysctl.conf`

Copy the following into `/etc/sysctl.conf`:

```
# IP Spoofing protection
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# Ignore ICMP broadcast requests
net.ipv4.icmp_echo_ignore_broadcasts = 1

# Disable source packet routing
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0 
net.ipv4.conf.default.accept_source_route = 0
net.ipv6.conf.default.accept_source_route = 0

# Ignore send redirects
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0

# Block SYN attacks
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_max_syn_backlog = 2048
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syn_retries = 5

# Log Martians
net.ipv4.conf.all.log_martians = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1

# Ignore ICMP redirects
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0 
net.ipv6.conf.default.accept_redirects = 0

# Ignore Directed pings
net.ipv4.icmp_echo_ignore_all = 1
```

### Malware scanning

TODO: brief intro

```sh
sudo pacman -Syu clamav
```

TODO: config

### Intrusion prevention

TODO: brief intro

```sh
sudo pacman -Syu fail2ban
```

TODO: config

### Kernel-space mandatory access control

TODO: brief intro

```sh
sudo pacman -Syu apparmor
```

TODO: config

## Backup

### rsync

[rsynx]() is a powerful CLI tool to synchronize files and folders.

> [!NOTE]
> This is NOT a full backup tool, it just creates a remote copy and keeps updating it. It doesn't create snapshots.

The following example script creates a copy of the `/home/origin_username` folder on a remote server through SSH:

`~/.local/bin/backup`

```sh
#!/bin/bash
rsync --archive \
      --compress \
      --times \
      --partial \
      --progress \
      --delete \
      --verbose \
      --human-readable \
      --exclude='.cache' \
      --exclude='.gradle' \
      --exclude='.rustup' \
      -e 'ssh -p 2237' --info=progress2 \
      /home/origin_username \
      server_username@x.x.x.x:/path/to/destination/folder
```

### borg

[borg](https://borgbackup.readthedocs.io/en/stable/) is a backup tool that synchronizes and deduplicates data to a remote repository. This remote repository contains snapshots that vary between each otehr only for the new modifications applied since the previous snapshot (hence why it's `deduplicating`).

Initialize a new repository: `borg init --encryption=repokey "/path/to/repo"`

List all backups of a specific repository: `borg list "path_to_repo_directory"`

Extract a folder from a borg backup: `borg extract -v --list "repo_path"::backup_name folder_path`

Delete a repository: `borg delete "/path/to/repo"`

TODO: write example script

### restic + backrest

TODO: ?

## Monitoring

To monitor your servers' state (uptime, resource usage, logs, ...), a monitoring service is indispensable.

[Beszel](https://beszel.dev/) is a simple, minimal and reliable way to keep track of what's happening in your homelab at any point in time.

TODO: docker setup

## Storage

TODO: brief intro

### RAID 1

A `RAID 1` storage setup is useful on a small NAS, to make sure that if one disk dies, the other has a full copy of all the data.

<!-- https://wiki.archlinux.org/title/RAID#Installation -->
<!-- https://wiki.archlinux.org/title/RAID#Configure_mkinitcpio -->

<!-- https://en.wikipedia.org/wiki/Comparison_of_file_systems#Limits -->
<!-- https://en.wikipedia.org/wiki/Comparison_of_file_systems#Features -->

<!-- https://wiki.archlinux.org/title/RAID#Monitoring -->
<!-- https://wiki.archlinux.org/title/RAID#RAID_Maintenance -->

<!-- FIX: DOCS: find a way to remove those excessive `- ...` -->

- Add `mdadm_udev` to the `HOOKS` array of `/etc/mkinitcpio.conf`
- Regenerate the initramfs: `sudo mkinitcpio -P`
- Reboot
- Partition the drives (create one `ext4` partition):
- `sudo cfdisk /dev/sda`
- `sudo cfdisk /dev/sdb`
- Build the array:
- `sudo mdadm --create --verbose --level=1 --metadata=1.2 --raid-devices=2 /dev/md/pool /dev/sda1 /dev/sdb1`
- Update `mdadm` configuration file:
- `su`
- `mdadm --detail --scan >> /etc/mdadm.conf`
- `exit`
- Assemble the array:
- `sudo mdadm --assemble --scan`
- Check the array's state:
- `sudo mdadm --detail /dev/md/pool`
- Calculate `stride` and `stripe` width ([source](https://wiki.archlinux.org/title/RAID#Calculating_the_stride_and_stripe_width)):
- `stride = chunk size / block size = 512KiB / 4KiB = 128KiB`
- `stripe width = number of data disks * stride = 2 * 128 = 256`
- Format the array with a filesystem: 
- `sudo mkfs.ext4 -v -L pool -b 4096 -E stride=128,stripe-width=256 /dev/md/pool`
- Mount the filesystem: 
- `sudo mkdir -v /pool`
- `sudo mount /dev/md/pool /pool`

### RAID 5

TODO: manual setup

## Services

TODO: brief intro

Install Docker with `sudo pacman -Syu docker docker-compose`.

[lazydocker](https://github.com/jesseduffield/lazydocker) lets you visualize and manage all containers running on a server through a simple an pretty TUI.

Install `lazydocker` with `paru -Sua lazydocker`.

### Syncthing

Syncthing is a remarkably simple service that allows sharing data between devices through peer-to-peer connections.

#### Install Manually

Install [Syncthing](https://wiki.archlinux.org/title/Syncthing): `sudo pacman -Syu syncthing`

Enable and start the syncthing daemon: `sudo systemctl enable --now syncthing@username.service`

Enable access from other machines: `sed -i 's|<address>127.0.0.1:8384</address>|<address>0.0.0.0:8384</address>|g' "~/.local/state/syncthing/config.xml"`

Then access the Syncthing GUI from your pc with `https://0.0.0.0:8384/` (replace 0.0.0.0 with the server ip)

#### Install with Docker

https://github.com/syncthing/syncthing/blob/main/README-Docker.md#docker-container-for-syncthing

### Music Streaming

[Navidrome](https://www.navidrome.org/) is a simple and lightweight music streaming server that can be used through its web UI or third-party apps via its Subsonic-compatible API.

https://www.navidrome.org/docs/installation/docker/

### RSS Feed Reader

[Miniflux](https://miniflux.app/index.html) is a simple and no-nonsense RSS Feed Reader.

https://miniflux.app/docs/docker.html#docker-compose

### Movie Streaming

[Dim](https://github.com/Dusk-Labs/dim) is a simple and pretty movie/tv-show streaming service.

https://github.com/Dusk-Labs/dim?tab=readme-ov-file#running-with-docker

### Minecraft Server

TODO: manual setup

TODO: docker-compose setup (server + backup)

> [!NOTE]
> Remember to open the `25565` port in the server's firewall with `sudo ufw allow 25565/tcp` and in the router as well.
