# Development

<!-- https://wiki.archlinux.org/title/Security#Mandatory_access_control) -->
<!-- https://labs.consol.de/development/linux/operating-systems/2018/06/18/arch-linux-for-devs.html) -->
<!-- https://www.codementor.io/@g00b/arch-linux-install-guide-for-developers-1uvn3bs1h7) -->
<!-- https://dev.to/svettwer/arch-linux-for-devs-26dm) -->
<!-- https://bbs.archlinux.org/viewtopic.php?id=98817) -->
<!-- https://www.nikbrendler.com/on-arch-linux/) -->
<!-- https://www.reddit.com/r/archlinux/comments/jtptml/is_arch_good_for_developers_in_general/) -->
<!-- https://www.reddit.com/r/archlinux/comments/1007tf6/is_it_a_good_idea_using_arch_linux_java_dev/) -->
<!-- https://www.reddit.com/r/archlinux/comments/11sbaa8/matlab_toolbox/) -->
<!-- https://www.reddit.com/r/archlinux/comments/13rgj3v/arch_as_work_distro/) -->

## Table of Contents

- [How to Setup an Isolated Development Environment](#how-to-setup-an-isolated-development-environment)
- [Software Development](#software-development)
  - [Android](#android-javakotlin)
  - [Arch Linux](#arch-linux)
  - [Arduino](#arduino)
  - [C/C++](#cc)
  - [C + Raylib](#c-+-raylib)
  - [C#/F#](#c-f)
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

## How to setup an isolated development environment

WIP: ...

We're going to use `systemd-nspawn` and an example for an isolated Ruby development environment: 

Create a directory to hold the container: `mkdir -v ./.env`

Use pacstrap to install a basic Arch system into the container: `pacstrap -K -c ./.env base base-devel tar gzip diffutils git curl`

Enter the container and set root password: 

`systemd-nspawn -D ./.env`

`passwd`

`logout`

Boot into the container: 

`systemd-nspawn -b -D ~/.env`

and login as `root`.

> [!TIP]
> The container can be powered off with `poweroff`.

> [!TIP]
> To terminate the session from within the container, hold `Ctrl` and rapidly press `]` three times.

Get and run the official Ruby installer: 

> [!NOTE]
> This install is single-user.

`curl -L get.rvm.io > rvm-install.sh`

`bash < ./rvm-install.sh`

Reload the shell: `source ~/.bash_profile`

> [!NOTE]
> The preferred way to reload would be to close the current shell/terminal and open a new one.

Install required version of Ruby: `?`

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

### C + Raylib

Install required packages: `sudo pacman -S alsa-lib mesa libx11 libxrandr libxi libxcursor libxinerama`



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

### LaTeX

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
