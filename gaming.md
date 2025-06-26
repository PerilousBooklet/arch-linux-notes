# How to setup games on Arch Linux

> [!NOTE]
> I only use Arch Linux packages, hence the absence of installation instructions for other packaging formats.

## Steam

```sh
sudo pacman -Syu steam libappindicator-gtk2 lib32-libappindicator-gtk2
paru -S steamcmd
```

## WIP: Console-like setup

> [!WARNING]
> You need [wayland](https://archlinux.org/packages/extra/x86_64/wayland/)

`STEAM_MULTIPLE_XWAYLANDS=1 gamescope W 2560 -H 1440 -r 144 -e --xwayland-count 2 --adaptive-sync - steam -gamepadui -steamdeck`

## All Other Launchers

```sh
sudo pacman -Syu --needed lutris wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader vkd3d mangohud goverlay
paru -Syu protonup-qt protontricks
```

## Minecraft

```sh
sudo pacman -Syu prismlauncher
paru -Syu nbtexplorer-bin
```

## RPCS3

```sh
paru -Syu rpcs3-bin rpcs3-udev
```

## TTRPG

`paru -S maptool-bin tokentool-bin`
