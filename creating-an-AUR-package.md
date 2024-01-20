# Creating an AUR Package

Maintainer: [Keil Miller Jr](mailto:keilmillerjr@outlook.com)

How to create and manage an AUR package.

The following links should be read:

* [Creating packages](https://wiki.archlinux.org/index.php/Creating_packages)
* [AUR submission guidelines](https://wiki.archlinux.org/index.php/AUR_submission_guidelines)

## Prerequisites

* Part of this section is directly taken from [Authentication](https://wiki.archlinux.org/index.php/AUR_submission_guidelines#Authentication)

```
$ pacman -S base-devel
$ nano ~/.ssh/config
--------------------
Host aur.archlinux.org
  IdentityFile ~/.ssh/aur
  User aur
--------------------
$ ssh-keygen -f ~/.ssh/aur
```

Contents of public key need to be copied to profile in *My Account* page accessible from [aur.archlinux.org](aur.archlinux.org).

## Clone Repo

* Part of this section is directly taken from [Creating package repositories](https://wiki.archlinux.org/index.php/AUR_submission_guidelines#Creating_package_repositories)

> If you are creating a new package from scratch, establish a local Git repository and an AUR remote by cloning the intended pkgbase. If the package does not yet exist, the following warning is expected:

```
$ mkdir ~/abs
$ cd ~/abs
$ git clone ssh://aur@aur.archlinux.org/pkgbase.git

Cloning into 'pkgbase'...
warning: You appear to have cloned an empty repository.
Checking connectivity... done.
```

#### Add remote to existing package

```
$ cd ~/abs/[package]
$ git remote add label ssh://aur@aur.archlinux.org/pkgbase.git
```

#### `.gitignore`

There are only 2 files required for an AUR package, unless you wish to add patches. This `.gitignore` file might help. Ignore everything, and call required files directly.

```
$ cd ~/abs/[package]
$ touch .gitignore
$ nano .gitignore
```

```
*
!.SRCINFO
!PKGBUILD
```

## Create PKGBUILD

PKGBUILD is an "Arch Linux package build description file." It will include package related variables, most oif which are self explanitory.

```
$ cd ~/abs/[package]
$ cp /usr/share/pacman/PKGBUILD.proto PKGBUILD
```

Make appropriate changes to `PKGBUILD`.

## Adding `md5sums` to `PKGBUILD`

> `updpkgsums` will perform an in place update of the checksums in the path specified by [build file], defaulting to PKGBUILD in the current working directory.

This should be done every time the source changes. Your source should change with pkgver.

```
$ updpkgsums
```

## Patching

```
$ cd ~/abs/[package]
$ rm -r src`
$ makepkg --nobuild` # Make package, but do not build source. Will run `prepare()` function, so do not include an unwanted patch.
$ cp -r src src.new`
$ code src.new # Make changes to new source directory
$ diff -Naur src src.new > package.diff
```

## Testing

#### Terminal

```
$ cd ~/abs/[package]
$ makepkg
$ sudo pacman -U [package].pkg.tar.xz # Install
$ pacman -R [pkgname] # Uninstall
```

#### Pamac

* Install: Three Vertical Dot Icon > Install Local Packages > [package] > Open
* Uninstall: Search Icon > [package] > select package > remove

#### Generate `.SRCINFO`
* Part of this section is directly taken from [Creating package repositories](https://wiki.archlinux.org/index.php/.SRCINFO)*

`.SRCINFO` files contain package metadata in a simple, unambiguous format, so that tools such as the AUR's Web back-end or AUR helpers may retrieve a package's metadata without parsing the PKGBUILD directly.

```
$ cd ~/abs/[package]
$ makepkg --printsrcinfo > .SRCINFO
```

## Pushing to AUR repository

Before pushing to AUR repository, make sure the following are updated:

* `PKGBUILD` > `pkgver`
* `PKGBUILD` > `pkgrel`
* `PKGBUILD` > `source`
* `PKGBUILD` > `md5sums`
* Regenerate `.SRCINFO`

```
$ makepkg --printsrcinfo > .SRCINFO
$ git add PKGBUILD .SRCINFO
$ git commit -m "useful commit message"
$ git push
```
