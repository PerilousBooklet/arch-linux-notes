# Arch User Repository Setup to begin contributing

## Prepare SSH keys

Open ~/.ssh/config:
```sh
nvim ~/.ssh/config
```

Add the following:
```
Host aur.archlinux.org
  IdentityFile ~/.ssh/aur
  User aur
```

Generate SSH keys:
```sh
cd ~/.ssh/
ssh-keygen -t ed25519 -f ~/.ssh/aur
```

Go to your AUR profile, "My Account" page and add the public key with the appropriate menu.

## Adopt an existing orphaned package

Clone package:
```sh
git clone ssh://aur@aur.archlinux.org/package_name.git
```

## Create a new AUR package from scratch

Clone empty AUR repository, but with your package's desired name:
```sh
git -c init.defaultbranch=master clone ssh://aur@aur.archlinux.org/package-name.git ./package-name
```

Add an AUR remote:
```sh
cd ./package-name
git remote add label ssh://aur@aur.archlinux.org/package-name.git
```

Fetch the remote for AUR initialization:
```sh
git fetch package-name
```

Create PKGBUILD:
```sh
sudo cp -v /usr/share/pacman/PKGBUILD.proto ./PKGBUILD
```

Generate .SRCINFO:
```sh
makepkg --printsrcinfo > .SRCINFO
```

Push first commit:
```sh
git add .
git commit -m "Initial commit."
git push origin master
```

Create package:
```sh
makepkg -si
```

(optional: clean cache with `makepkg --clean`)

## Update package

Make the required modifications to the required files.

Update checksums:
```sh
updpkgsums PKGBUILD
```

Add, commit and push the changes to the AUR (example: `godot-voxel-bin`):
```sh
git add .
git commit -m "Updated for Godot x.x.x and Voxel Tools x.x.x"
git push
```
