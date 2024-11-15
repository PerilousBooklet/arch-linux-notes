#!/usr/bin/bash

# https://wiki.archlinux.org/title/Wayland
# https://wiki.archlinux.org/title/River
# https://leon_plickat.srht.site/writing/river-setup-guide/article.html/#lets-get-started

# https://manpages.debian.org/testing/wlr-randr/wlr-randr.1.en.html?source=post_page-----530ef23fc5eb--------------------------------

# Installing packages
pacman --noconfirm -S wayland # display server
                      wlr-randr \ # display config
                      wev \ # "?"
                      wl-clipboard \ # clipboard manager
                      river \ # window manager
                      fuzzel \ # launcher
                      swaybg \ # background image
                      waylock \ # screen lock
                      grim slurp \ # screenshot
                      imv \ # minimal image viewer
                      mpv \ # minimal audio-video player
                      ranger # minimal file manager

paru --noconfirm -S 
                    light \ # Screen backlight rightness
                    eww-wayland \ # widget; status bar, notifications, ...
                    wlr-randr # virtual screen configuration

# Configuring packages
cp -v /usr/share/river/example/init ~/.config/river/init

