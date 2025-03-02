# Arch Linux Server Guide

<!-- TODO: add SSH setup -->
<!-- TODO: add ufw setup -->
<!-- TODO: add git setup -->
<!-- TODO: add tmux setup -->
<!-- TODO: add basic neovim setup -->
<!-- TODO: add docker setup, lazydocker as dashboard -->
<!-- TODO: add minecraft server setup -->

## Remote Access

### Syncthing headless setup

Install [Syncthing](https://wiki.archlinux.org/title/Syncthing): `sudo pacman -Syu syncthing`

Enable and start the syncthing daemon: `sudo systemctl enable --now syncthing@username.service`

Enable access from other machines:

```sh
sed -i 's|<address>127.0.0.1:8384</address>|<address>0.0.0.0:8384</address>|g' "~/.local/state/syncthing/config.xml"
```

Then access the Syncthing GUI from your pc with `https://0.0.0.0:8384/` (replace 0.0.0.0 with the server ip)

## Network Security

### SSH

> [!NOTE]
> Use `nmap -sP x.x.x.0/24` to scan the LAN for the server's IP (replace `x.x.x.0` with LAN IP address).

#### With password

> [!NOTE]
> Before starting, note down the server's IP address and remember the server's username and password

1. Change the SSH port: `sed -i 's/#Port 22/Port 2237/g' /etc/ssh/sshd_config`
2. Prohibit root login: add `PermitRootLogin no` to `/etc/ssh/sshd_config`.
3. Enable and start the SSH daemon: `sudo systemctl enable --now sshd`

#### With keys

Generate an SSH key (each user has its own): `ssh-keygen -t rsa -f ~/.ssh/keyname`

Choose an appropriate key name.

Choose an appropriate security password.

Write down the security password into the password database.

Copy the generated keys to the server (replace `x.x.x.x` with IP address): `ssh-copy-id -i ~/.ssh/keyname.pub -p 2237 username@x.x.x.x`

> [!NOTE]
> Optional but strongly advised: https://wiki.archlinux.org/title/OpenSSH#Force_public_key_authentication

## Storage

### RAID 1

<!-- https://wiki.archlinux.org/title/RAID#Installation -->
<!-- https://wiki.archlinux.org/title/RAID#Configure_mkinitcpio -->

<!-- https://en.wikipedia.org/wiki/Comparison_of_file_systems#Limits -->
<!-- https://en.wikipedia.org/wiki/Comparison_of_file_systems#Features -->

<!-- https://wiki.archlinux.org/title/RAID#Monitoring -->
<!-- https://wiki.archlinux.org/title/RAID#RAID_Maintenance -->

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
-  Create device specific folders inside `/pool`:
- `sudo mkdir -vp /pool/{backups-desktop,backups-minis12pro}`

## Services

TODO: Docker configuration

## Security

### Firewall

Install and activate `ufw`:

```sh
sudo pacman -Syu ufw iptables
sudo systemctl enable --now ufw.service
```

Set basic firewall rules:

```sh
sudo ufw default deny incoming

sudo ufw default allow outgoing

# SSH
sudo ufw allow 2237/tcp

# Minecraft Server
sudo ufw allow 25565/tcp

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

```sh
sudo pacman -Syu clamav
```

TODO: config

### Intrusion prevention

```sh
sudo pacman -Syu fail2ban
```

TODO: config

### Kernel-space mandatory access control

```sh
sudo pacman -Syu apparmor
```

TODO: config

## Backup

Semi-professional solution:

```sh
sudo pacman -Syu borg
```
