# How to safely migrate an Arch Linux installation

> [!WARNING]
> Make sure the `CSM` option in the motherboard's `UEFI` is disabled.

> [!NOTE]
> When using Ventoy, always select the `grub2` option.

## Migrate existing install to new SSD

TODO: brief intro

### Backup the files

...

### Boot into a live Arch Linux system

...

### Partition the new drive

...

### Create the filesystems on the new drive

...

### Mount the old and new partitions

(old drive: `/dev/sda`, new drive: `/dev/nvme0n1`)

`mkdir -vp /mnt/old_root /mnt/new_root /mnt/new_root/boot/efi`

`mount /dev/sda /mnt/old_root`

`mount /dev/nvme0n1p2 /mnt/new_root`

`mount /dev/nvme0n1p1 /mnt/new_root/boot/efi`

### Synchronize the files

TODO: brief explanation

```sh
rsync -qaHAXS /mnt/old_root /mnt/new_root
```

### Regenerate fstab

TODO: brief explanation

`genfstab -U /mnt/new_root >> /mnt/new_root/etc/fstab`

### Regenerate boot partition

TODO: brief explanation

`arch-chroot /mnt/new_root /bin/bash`

#### Reinstal GRUB

TODO: brief explanation

`grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader=GRUB`

`grub-mkconfig -o /boot/grub/grub.cfg`

### Change microcode setting

...

### Change video drivers

...

### Troubleshooting

[Missing EFI vars when reinstalling GRUB inside arch chroot](https://bbs.archlinux.org/viewtopic.php?id=249546)

## Migrate existing install to new motherboard (same SSD layout, same CPU and GPU)

Install the hardware components.

Boot an Arch Linux instance with a USB key.

Chroot into the filesystem.

Regenerate GRUB configuration: `sudo grub-mkconfig -o /mnt/boot/efi`

Regenerate initramfs: `sudo mkinitcpio -P`
