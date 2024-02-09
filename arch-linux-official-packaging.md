# How to create an arch linux package the right way

---

## Install devtools

```bash
sudo pacman -Syu devtools
```

## Prepare a clean chroot

Create a directory in which the chroot will reside:

```bash
mkdir ~/chroot
```

Define the CHROOT environment variable:

```bash
echo "CHROOT=$HOME/chroot" >> ~/.bashrc
```

Create the chroot (the sub directory root is required because the $CHROOT directory will get other sub directories for clean working copies):

```bash
mkarchroot $CHROOT/root base-devel
```

Edit ~/.makepkg.conf to set the packager name and any makeflags:

```bash

```

Adjust the mirrorlist in $CHROOT/root/etc/pacman.d/mirrorlist:

```bash

```

Enable the testing repositories in $CHROOT/root/etc/pacman.conf:

```bash

```

## How to prepare the chroot before building a package

Make sure the base chroot ($CHROOT/root) is up to date: 

```bash
arch-nspawn $CHROOT/root pacman -Syu
```

## How to build a package inside a chroot

Build the package by calling __*makechrootpkg*__ in the directory containing its PKGBUILD:

```bash
makechrootpkg -c -r $CHROOT package_name
```
