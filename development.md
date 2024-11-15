# Development

## Table of Contents

- [Software Development](#software-development)
  - [Base](#base)
  - [Android](#android-javakotlin)
  - [C/C++](#cc)
- [Hardware Development](#hardware-development)
- [Product Design](#product-design)
- [OCR](#ocr)

## Software Development

### Base

`sudo pacman -Syu git git-lfs tmux docker docker-compose jq sed awk`

`paru -S when-changed-git`

### Android (Java/Kotlin)

<!-- Sources -->
<!-- https://wiki.archlinux.org/title/Android# -->
<!-- https://stackoverflow.com/questions/75249860/how-to-develop-an-android-application-without-android-studio -->
<!-- https://www.revelo.com/blog/how-to-build-an-android-development-environment-without-android-studio -->
<!-- https://developer.okta.com/blog/2018/08/10/basic-android-without-an-ide -->
<!-- https://www.kuon.ch/post/2020-01-12-android-app/ -->

Setup the Android platform tools:

`paru -Syu android-sdk android-sdk-build-tools android-sdk-cmdline-tools-latest android-platform android-sdk-platform-tools`

Setup the emulator:

`?`

### C/C++

```sh
sudo pacman -Syu gcc make cmake ninja
```

### C# / F#

`sudo pacman -S dotnet-sdk aspnet-runtime nuget`

`dotnet tool install -g fsautocomplete`

`dotnet tool install -g csharpier`

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

Install the Spring Boot CLI app:
`paru -S spring-boot-cli`

### Python

```sh
sudo pacman -Syu python python-pipx python-venv
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

`sudo pacman -Syu lilypond frescobaldi`

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

### Ruby

`paru -S rvm`

### OCaml

<!-- https://ocaml.org/docs/installing-ocaml -->
<!-- https://ocaml.org/docs/opam-switch-introduction -->

Setup OCaml:

```sh
sudo pacman -S opam
opam init -y
echo "test -r '/home/raffaele/.opam/opam-init/init.sh' && . '/home/raffaele/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true" >> ~/.bashrc
```

Setup platform tools:
```sh
opam install ocaml-lsp-server odoc ocamlformat utop
opam install user-setup
```

### Common Lisp

Setup Common Lisp:

`sudo pacman -S sbcl quicklisp`

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
sudo pacman -Syu octave
```

### PostgreSQL

Install the following:
```sh
sudo pacman -Syu postgresql
sudo pacman -Syu dbeaver
```

Use docker for dev deployment.

### TTF/OTF fonts dev

```sh
sudo pacman -Syu birdfont gucharmap fontforge
```

### Minecraft mods

```sh
sudo pacman -Syu jdk8-openjdk jdk-openjdk
paru -Syu blockbench-bin nbtexplorer fernflower-git
```

### Godot game development

```sh
sudo pacman -Syu godot
paru -Syu godot3-bin godot-voxel
```

### Arch packages

```sh
sudo pacman -Syu dev-tools namcap
```

### QMK

`sudo pacman --needed --noconfirm -S git python-pip libffi`

`python3 -m pip install --user qmk`

`qmk setup`

### Flashing ROMs

```sh
sudo pacman -Syu flashrom
```

## Hardware Development

```sh
sudo pacman -Syu kicad
```

## Product Design

```sh
sudo pacman -Syu freecad
```

```sh
sudo pacman -Syu openscad
```

## OCR

```sh
sudo pacman -Syu tesseract tesseract-data-eng tesseract-data-ita
```
