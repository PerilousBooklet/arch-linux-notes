# Development

## Table of Contents

- [Software Development](#software-development)
  - [Base](#base)
  - [Android](#android-javakotlin)
  - [Arch Linux](#arch-linux)
  - [Arduino](#arduino)
  - [C/C++](#cc)
  - [C#/C#](#c-f)
  - [Common Lisp](#common-lisp)
  - [Flashing ROMs](#flashing-roms)
  - [Fonts](#fonts)
  - [Godot](#godot)
  - [Haskell](#haskell)
  - [Java](#java)
  - [LaTeX](#latex)
  - [Lilypond](#lilypond)
  - [Lua](#lua)
  - [Matlab](#matlab)
  - [Minecraft](#minecraft)
  - [OCaml](#ocaml)
  - [OpenSCAD](#openscad)
  - [Python](#python)
  - [R](#r)
  - [SQL](#sql)
  - [Ruby](#ruby)
  - [Web](#web)

## Software Development

Base tools:

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

### Arch Linux

```sh
sudo pacman -Syu dev-tools namcap
```

### Arduino

`paru -Syu arduino-ide-bin`

### C/C++

`sudo pacman -Syu gcc make cmake ninja`

### C# / F#

```sh
sudo pacman -S dotnet-sdk aspnet-runtime nuget
dotnet tool install -g fsautocomplete
dotnet tool install -g csharpier
```

### Common Lisp

`sudo pacman -S sbcl quicklisp`

### Flashing ROMs

`sudo pacman -Syu flashrom`

### Fonts

`sudo pacman -Syu fontforge birdfont gucharmap`

### Godot

```sh
sudo pacman -Syu godot
paru -Syu godot3-bin godot-voxel
```

### Haskell

`sudo pacman -Syu ghc cabal-install`

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

### LaTex

```sh
sudo pacman -Syu texlive-most texlive-lang texstudio
```

### Lilypond

`sudo pacman -Syu lilypond frescobaldi`

### Lua

```sh
sudo pacman -Syu lua
```

### Matlab

`sudo pacman -Syu octave`

### Minecraft

```sh
sudo pacman -Syu jdk8-openjdk jdk-openjdk
paru -Syu blockbench-bin nbtexplorer fernflower-git
```

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

### OpenSCAD

`sudo pacman -Syu openscad`

### Python

```sh
sudo pacman -Syu python python-pipx python-venv
```

### R

```sh
sudo pacman -Syu r gcc-fortran
paru -Syu rstudio-desktop-bin
```

### Ruby

`paru -S rvm`

### SQL

`sudo pacman -Syu sqlite postgresql dbeaver`

### Web

<!-- html/css/js/php -->
`?`

