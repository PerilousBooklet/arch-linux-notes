# WIP: Streaming

https://wiki.archlinux.org/title/Open_Broadcaster_Software#Virtual_camera_output
https://wiki.archlinux.org/title/V4l2loopback

Install [Discord](https://discord.com/):

`sudo pacman -Syu discord`

Install the proper headers for your Linux kernel (in my case, `linux` and `linux-lts`):

`sudo pacman -Syu linux-headers linux-lts-headers`

Install [OBS Studio](https://obsproject.com/) and the packages for streaming directly into Discord:

`sudo pacman -Syu obs-studio v4l2loopback-utils v4l2loopback-dkms`

setup?:

```sh
sudo modprobe v4l2loopback devices=1 video_nr=2 card_label="OBS Virtual Camera" exclusive_caps=1
sudo chmod 666 /dev/video*
sudo usermod -aG video $USER
```

Reboot.
