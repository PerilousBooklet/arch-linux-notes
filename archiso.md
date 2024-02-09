# ArchISO

## Installation
```bash
sudo pacman -S archiso
```

## Prepare a custom profile
To adapt or customize one of `archiso`'s shipped profiles, copy it from `/usr/share/archiso/configs/profile-name/` to a writable directory with a name of your choice:
```bash
cp -r /usr/share/archiso/configs/releng/ ~/dev/arch/archiso
```

## Profile structure
The profile structure is documented in `/usr/share/doc/archiso/README.profile.rst`

## Select packages
Edit `packages.x86_64` to select which packages are to be installed on the live system image, listing packages line by line. 

## Custom local repository
To add packages not located in standard Arch repositories (e.g. custom packages or packages from AUR/ABS), set up a custom local repository and add your custom packages to it.

Then add your repository to `~/dev/archiso/pacman.conf` as follows:
```
[customrepo]
SigLevel = Optional TrustAll
Server = file:///path/to/customrepo
```

Note:
- The ordering within pacman.conf matters.
  To give top priority to your custom repository, place it above the other repository entries.
- This pacman.conf is only used for building the image.
  It will not be used in the live environment.
  To do this, see #Adding repositories to the image.

## Add files to the image
The `airootfs` directory is used as the starting point for the root directory `/` of the live system on the image.
All its contents will be copied over to the working directory before packages are installed.

Place any custom files and/or directories in the desired location under `airootfs/`.
For example, if you have a set of iptables scripts on your current system you want to be used on you live image, copy them over as such:
```bash
cp -r /etc/iptables archiso/airootfs/etc
```

Tip: To add a file to the install user's home directory, place it in `archiso/airootfs/root/`.
     To add a file to all other users home directories, place it in `archiso/airootfs/etc/skel/`.

By default, permissions will be 644 for files and 755 for directories.
All of them will be owned by the root user.
