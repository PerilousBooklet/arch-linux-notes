# Arch User Repository Setup to begin contributing

## Prepare SSH keys

Open ~/.ssh/config:
```bash
nvim ~/.ssh/config
```

Add the following:
```
Host aur.archlinux.org
  IdentityFile ~/.ssh/aur
  User aur
```

Generate SSH keys:
```bash
cd ~/.ssh/
ssh-keygen -t ed25519 -f ~/.ssh/aur
```

Go to your AUR profile, "My Account" page and add the public key with the appropriate menu.

## Adopt an existing orphaned package

Clone package:
```bash
git clone ssh://aur@aur.archlinux.org/package_name.git
```

## Create a new AUR package from scratch

Clone empty AUR repository, but with your package's desired name:
```bash
git -c init.defaultbranch=master clone ssh://aur@aur.archlinux.org/package-name.git ./package-name
```

Add an AUR remote:
```bash
cd ./package-name
git remote add label ssh://aur@aur.archlinux.org/package-name.git
```

Fetch the remote for AUR initialization:
```bash
git fetch package-name
```

Create PKGBUILD:
```bash
sudo cp -v /usr/share/pacman/PKGBUILD.proto ./PKGBUILD
```

Generate .SRCINFO:
```bash
makepkg --printsrcinfo > .SRCINFO
```

Push first commit:
```bash
git add .
git commit -m "Initial commit."
git push origin master
```

Create package:
```bash
makepkg -si
```

(optional: clean cache with `makepkg --clean`)

## Update package

Update checksums:
```bash
updpkgsums
```
