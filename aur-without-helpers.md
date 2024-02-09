# How to manage packages from the AUR without helper programs

## Install a package
Go to `https://aur.archlinux.org` and find the package name.

Download the package build sources:
```sh
cd $HOME/.aur_packages
git clone package_build_repo.git ./package_name
mkpkg -sic
```

## Update a package
```sh
cd $HOME/.aur_packages
git pull package_build_repo.git
mkpkg -sic
```

## Remove a package
```sh
sudo pacman -R package_name
rm -vrf $HOME/.aur_packages/package_name
```

## Update all AUR packages at once
NOTE: WARNING: always read ALL changes before updating

List packages to update:
```sh
I=$(checkupdates)
# TODO: list package names and changes with echo ?
```

Update packages:
```sh
cd $HOME/.aur_packages
for i in $I; do
  git pull $i.git
  cd ./$i
  mkpkg -sic
  cd ../
done
```

<!-- TODO: write a bash script that works as an AUR helper (name: aur) with flags like -S, -R, -Rs; use also echo, sed and awk -->
