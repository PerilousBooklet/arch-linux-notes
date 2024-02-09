# How to manage backups on Arch Linux

## Borg
Install:
```bash
sudo pacman -S borg
```

Initialize repository:
```bash
borg init --encryption=repokey "/run/media/raffaele/Samsung 860 1TB"
```

Backup repo key:
```bash
borg key export "/run/media/raffaele/Samsung 860 1TB" ~/documents/borg-repokey
```

Make a backup:
```bash
borg create --list "/run/media/raffaele/Samsung 860 1TB"::archive-{hostname}-{now} .
```

