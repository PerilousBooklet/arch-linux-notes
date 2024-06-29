# How to setup games on Arch Linux
(Note: I only use arch packages, hence the absence of other packageing formats installation instructions)

## Open Source Games
```sh
sudo pacman -Syu 0ad xonotic supertuxkart minetest warzone2100 openttd openttd-gfx openttd-sfx wesnoth springlobby shattered-pixel-dungeon astromenace endless-sky endless-sky-high-dpi pioneer
paru -Syu mindustry-bin airshipper
```

## Minecraft
```sh
paru -Syu prismlauncher-qt5-bin nbtexplorer-bin
```

## RPCS3
```sh
paru -Syu rpcs3-bin rpcs3-udev
```

## GOG/Epic/Amazon Prime
```sh
paru -Syu heroic-games-launcher-bin
```

## Lutris/Wine
```sh
sudo pacman -Syu --needed lutris wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader vkd3d mangohud goverlay
paru -Syu protonup-qt protontricks
```

## Steam
```sh
sudo pacman -Syu steam libappindicator-gtk2 lib32-libappindicator-gtk2
```
