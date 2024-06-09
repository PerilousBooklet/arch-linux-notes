# Development

## Software Development

### Version Control System
`sudo pacman -Syu git git-lfs`

### C/C++
```sh
sudo pacman -S gcc make cmake ninja
```

### Java
Install the latest Java Development Kit:
```sh
sudo pacman -S jdk-openjdk
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
sudo pacman -S python python-pipx
```

### Lua
```sh
sudo pacman -S lua
```

### LaTex
```sh
sudo pacman -S texlive-most texlive-lang texstudio
```

### Lilypond

`?`

### R
```sh
sudo pacman -S r gcc-fortran
paru -S rstudio-desktop-bin
```

### HTML/CSS/Javascript/PHP
```sh
?
```

### Dart

`sudo pacman -S dart`

### Flutter

https://docs.flutter.dev/get-started/install/linux/desktop?tab=download

Setup the Android dev environment without `android-studio`:
```sh
paru -S android-emulator android-sdk android-platform android-x86-64-system-image
```

### Ruby

https://wiki.archlinux.org/title/Ruby
https://wiki.archlinux.org/title/RVM

### OCaml
`sudo pacman -S ocaml opam`
`opam init`
`opam install dune`

### Arduino
```sh
paru -S arduino-ide-bin
```

### OpenSCAD
```sh
sudo pacman -S openscad
```

### Haskell
```sh
sudo pacman -S ghc cabal-install
```

### Matlab
```sh
paru -S matlab
```

### PostgreSQL

Install the following:
```sh
sudo pacman -S postgresql
sudo pacman -S dbeaver
```

Setup the database, follow the instructions at:
https://wiki.archlinux.org/title/PostgreSQL

### TTF/OTF fonts dev
```sh
sudo pacman -S birdfont gucharmap fontforge
```

### Minecraft mods
```sh
sudo pacman -S jdk8-openjdk jdk-openjdk
paru -S blockbench-bin nbtexplorer fernflower-git
```

### Minetest mods
```sh
sudo pacman -S minetest
```

### Godot game development
```sh
sudo pacman -S godot
paru -S godot3-bin godot-voxel
```

### Renpy
```sh
paru -S renpy
```

### Arch packages
```sh
sudo pacman -S dev-tools namcap
```

### Static websites
Hugo:
```sh
sudo pacman -S go hugo
```

Jekyll:
```sh
sudo pacman -S ruby rubygems gcc make
gem install jekyll bundler
```

Sphynx:
```sh
?
```

### Flashing ROMs
```sh
sudo pacman -S flashrom
```

## Hardware development

```sh
sudo pacman -S kicad
```

## Product design

```sh
sudo pacman -S freecad
```


```sh
sudo pacman -S openscad
```

