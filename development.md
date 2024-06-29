# Development

## Software Development

### Version Control System
`sudo pacman -Syu git git-lfs`

### C/C++
```sh
sudo pacman -Syu gcc make cmake ninja
```

### Java
Install the latest Java Development Kit:
```sh
sudo pacman -Syu jdk-openjdk
```

Set default system-wide java version:
```sh
sudo archlinux-java set java-20-openjdk # for java 20
```

Check installed java versions:
```sh
archlinux-java status
```

### Python
```sh
sudo pacman -Syu python python-pipx
```

### Lua
```sh
sudo pacman -Syu lua
```

### LaTex
```sh
sudo pacman -Syu texlive-most texlive-lang texstudio
```

### Lilypond

`?`

### R
```sh
sudo pacman -Syu r gcc-fortran
paru -Syu rstudio-desktop-bin
```

### HTML/CSS/Javascript/PHP
```sh
?
```

### Dart

`sudo pacman -Syu dart`

### Flutter

https://docs.flutter.dev/get-started/install/linux/desktop?tab=download

Setup the Android dev environment without `android-studio`:

```sh
paru -Syu android-sdk android-sdk-build-tools android-sdk-cmdline-tools-latest android-platform android-sdk-platform-tools
```

...

### Ruby

https://wiki.archlinux.org/title/Ruby
https://wiki.archlinux.org/title/RVM

### OCaml
`sudo pacman -Syu ocaml opam`
`opam init`
`opam install dune`

### Arduino
```sh
paru -Syu arduino-ide-bin
```

### OpenSCAD
```sh
sudo pacman -Syu openscad
```

### Haskell
```sh
sudo pacman -Syu ghc cabal-install
```

### Matlab
```sh
paru -Syu matlab
```

### PostgreSQL

Install the following:
```sh
sudo pacman -Syu postgresql
sudo pacman -Syu dbeaver
```

Setup the database, follow the instructions at:
https://wiki.archlinux.org/title/PostgreSQL

### TTF/OTF fonts dev
```sh
sudo pacman -Syu birdfont gucharmap fontforge
```

### Minecraft mods
```sh
sudo pacman -Syu jdk8-openjdk jdk-openjdk
paru -Syu blockbench-bin nbtexplorer fernflower-git
```

### Minetest mods
```sh
sudo pacman -Syu minetest
```

### Godot game development
```sh
sudo pacman -Syu godot
paru -Syu godot3-bin godot-voxel
```

### Renpy
```sh
paru -Syu renpy
```

### Arch packages
```sh
sudo pacman -Syu dev-tools namcap
```

### Static websites
Hugo:
```sh
sudo pacman -Syu go hugo
```

Jekyll:
```sh
sudo pacman -Syu ruby rubygems gcc make
gem install jekyll bundler
```

Sphynx:
```sh
?
```

### Flashing ROMs
```sh
sudo pacman -Syu flashrom
```

## Hardware development

```sh
sudo pacman -Syu kicad
```

## Product design

```sh
sudo pacman -Syu freecad
```


```sh
sudo pacman -Syu openscad
```

