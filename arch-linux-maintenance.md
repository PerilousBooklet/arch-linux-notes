## How to read logs
the place where all logs are stored:
```sh
ls /var/log
```

read pacman log:
```sh
less /var/log/pacman.log
```

read system logs(all time):
```sh
journalctl
```

read system logs(last boot):
```sh
journalctl -b
```

read system logs(last boot, more recent first):
```sh
journalctl -b -r
```

read system logs(last boot, more recent first, for a specific systemd unit: es. NetworkManager.service):
```sh
journalctl -b -r -u NetworkManager.service
```

read system logs(last boot, more recent first, for a specific systemd unit: es. NetworkManager.service, following it in real time):
```sh
journalctl -b -f -u NetworkManager.service
```

read system logs for a specific special process ?:
```sh
journalctl /usr/bin/process-name
```

## How to solve package dependency conflicts

- gather data about the conflicting packages to understand what they are, what they do and how they do it
- try to see which dependency you can keep and which you can uninstall
(very rare type of problem)

## Check and clean pacman cache

check:
```sh
du -sh /var/cache/pacman/pkg
```

clean:
(to clean all uninstalled package versions in the cache)
```sh
sudo pacman -Sc
```

(to clean all package versions in the cache)
```sh
sudo pacman -Scc
```

## Check and clean system logs
check:
```sh
sudo du -sh /var/log/
```

or

```sh
sudo du -h /var/log/*
```

clean:
```sh
sudo journalctl --vacuum-time=7d
```

or

```sh
sudo journalctl --vacuum-size=1G
```

## Check and clean timeshift snapshots
?

## Check and clean application data
Install bleachbit:
```sh
sudo pacman -S bleachbit
```
