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

- [Base Tools](#base-tools)
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

## Base Tools

- openssh
- vi
- vim
- neovim
- man
- man-db
- texinfo
- tealdeer
- git
- docker
- docker-compose
- lazydocker (TUI dashboard for Docker)
- tmux
- mynav (TUI dashboard for TMUX)
- strace

- firefox
- keepassxc
- lite-xl
- dbbrowser
- dbeaver
- httpie-desktop

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

`paru -Syu arduino-language-server`

### Assembly x86_64

`paru -S asm-lsp`

### AWK

`paru -S awk-language-server`

### Bash

`sudo pacman -Syu bash-language-server shellcheck`

### C/C++

`sudo pacman -Syu gcc make cmake clang`

### C# / F#

```sh
sudo pacman -S dotnet-sdk aspnet-runtime nuget
dotnet tool install -g fsautocomplete
dotnet tool install -g csharpier
```

### Clojure

`paru -S clojure-lsp-bin`

### Common Lisp

`sudo pacman -S sbcl quicklisp`

### Crystal

`paru -S crytalline-bin`

### CSS

`sudo pacman -Syu vscode-css-languageserver`

### D

```sh
paru -S serve-d-bin
sudo pacman -Syu dub
```

### Dart

`sudo pacman -Syu dart`

### Flashing ROMs

`sudo pacman -Syu flashrom`

### Elixir

`paru -S elixir-ls`

### Elm

`paru -S elm-language-server elm-format-bin`

### Erlang

WIP: package still not in the AUR

`paru -S erlang_ls`

### Fonts

`sudo pacman -Syu fontforge birdfont gucharmap`

### Fortran

`paru -S fortls`

### Go

`sudo pacman -Syu gopls`

### Groovy

`paru -S groovy-language-server-git`

### Haskell

```sh
sudo pacman -Syu haskell-language-server
sudo pacman -Syu ghc cabal-install
```

### HTML

```sh
sudo pacman -Syu vscode-html-languageserver
paru -S emmet-language-server
```

### Java

Install the latest Java Development Kit:

```sh
sudo pacman -Syu jdk-openjdk
```

Set default system-wide java version:

```sh
sudo archlinux-java set java-25-openjdk
```

Check installed java versions:

```sh
archlinux-java status
```

Install the Spring Boot CLI app:

`paru -S spring-boot-cli`

Install the java LSP server:

`paru -S jdtls`

### JSON

`sudo pacman -Syu vscode-json-languageserver`

### Julia

Open the julia console and install the lsp server:

```
julia
]
add LanguageServer
```

### Kotlin

`paru -S kotlin-language-server`

### LaTeX

```sh
sudo pacman -Syu texlive-most texlive-lang texstudio
```

### Lilypond

`sudo pacman -Syu lilypond frescobaldi`

### Lisp

`sudo pacman -Syu roswell`

### Lua

```sh
sudo pacman -Syu lua
paru -S lua-language-server-git
```

### Markdown

`sudo pacman -Syu marksman`

### Minecraft

```sh
sudo pacman -Syu jdk8-openjdk jdk-openjdk
paru -Syu blockbench-bin nbtexplorer fernflower-git
```

### Nim

```sh
paru -S choosenim-bin
choosenim stable
nimble install nimlsp
```

### OCaml

<!-- https://ocaml.org/docs/installing-ocaml -->
<!-- https://ocaml.org/docs/opam-switch-introduction -->

```sh
sudo pacman -S opam
opam init -y
echo "test -r '/home/raffaele/.opam/opam-init/init.sh' && . '/home/raffaele/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true" >> ~/.bashrc
opam install ocaml-lsp-server odoc ocamlformat utop
opam install user-setup
```

### Odin

`paru -S odinls`

### OpenSCAD

`sudo pacman -Syu openscad`

### Perl

`paru -S perlnavigator`

### PHP

`paru -S nodejs-intelephense`

### Python

```sh
sudo pacman -Syu python python-pipx python-venv python-lsp-server flake8
```

### R

```sh
sudo pacman -Syu r gcc-fortran
paru -S r-languageserver
```

### Ruby

`paru -S rvm`
`gem install ruby-lsp`

### Rust

`sudo pacman -Syu rustup`

### Scala

```sh
paru -S jdk17-openjdk scala scala-docs scala-sources
sudo archlinux-java set java-17-openjdk
paru -S metals
```

### SQL

```sh
sudo pacman -Syu sqlite postgresql dbeaver
paru -S sql-language-server
```

### TailwindCSS

`sudo pacman -Syu tailwindcss-language-server`

### TeX

```sh
sudo pacman -Syu texlive-most
paru -S texlab-bin
sudo pacman -Syu texlive-binextra perl-yaml-tiny perl-file-homedir
```

### TOML

`sudo pacman -S taplo-cli`

### Typescript

`sudo pacman -Syu typescript-language-server`

### Typst

`paru -S typst-lsp-bin`

### Vala

`paru -S vala-language-server`

### V

`paru -S v-analyzer-bin`

### XML

`paru -S lemminx`

### Zig

`sudo pacman -Syu zls`

### YAML

`sudo pacman -Syu yaml-language-server`
