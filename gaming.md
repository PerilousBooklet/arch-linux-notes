# How to setup games on Arch Linux
(Note: I only use arch packages, hence the absence of flatpak/appimage installation instructions)

## Steam
```sh
sudo pacman -S steam libappindicator-gtk2 lib32-libappindicator-gtk2
```

## GOG/Epic Games
```sh
paru -S heroic-games-launcher-bin
```

## Lutris/Wine
```sh
sudo pacman -S lutris
sudo pacman -S --needed wine-staging \
                        giflib \
                        lib32-giflib \
                        libpng \
                        lib32-libpng \
                        libldap \
                        lib32-libldap \
                        gnutls \
                        lib32-gnutls \
                        mpg123 \
                        lib32-mpg123 \
                        openal \
                        lib32-openal \
                        v4l-utils \
                        lib32-v4l-utils \
                        libpulse \
                        lib32-libpulse \
                        libgpg-error \
                        lib32-libgpg-error \
                        alsa-plugins \
                        lib32-alsa-plugins \
                        alsa-lib \
                        lib32-alsa-lib \
                        libjpeg-turbo \
                        lib32-libjpeg-turbo \
                        sqlite \
                        lib32-sqlite \
                        libxcomposite \
                        lib32-libxcomposite \
                        libxinerama \
                        lib32-libgcrypt \
                        libgcrypt \
                        lib32-libxinerama \
                        ncurses \
                        lib32-ncurses \
                        ocl-icd \
                        lib32-ocl-icd \
                        libxslt \
                        lib32-libxslt \
                        libva \
                        lib32-libva \
                        gtk3 \
                        lib32-gtk3 \
                        gst-plugins-base-libs \
                        lib32-gst-plugins-base-libs \
                        vulkan-icd-loader \
                        lib32-vulkan-icd-loader
paru -S protonup-qt protontricks
sudo pacman -S mangohud
paru -S goverlay-bin
```

## Minecraft
```sh
paru -S prismlauncher-qt5-bin nbtexplorer-bin
```

## RPCS3
```sh
paru -S rpcs3-bin rpcs3-udev
```

## Open Source Games
```sh
sudo pacman -S 0ad
sudo pacman -S minetest
sudo pacman -S supertuxkart 
sudo pacman -S xonotic
sudo pacman -S openttd openttd-opengfx openttd-opensfx
paru -S airshipper # Veloren
paru -S flightgear
paru -S zero-k
sudo pacman -S springlobby # Spring: 1944
```
