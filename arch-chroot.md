# How to use arch-chroot to fix an existing installation of arch linux
Mount the existing partitions to a temporary file system:
```bash
mnt /dev/sda2 /mnt
mnt /dev/sda1 /mnt/boot/efi
```

Run arch-chroot:
```bash
arch-chroot /mnt
```
