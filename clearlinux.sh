#!/bin/bash
set -x

echo "Download latest ClearLinux Live Image"
latest=`curl -k https://download.clearlinux.org/latest`
curl -O https://download.clearlinux.org/image/clear-$latest-live.img.xz
unxz clear-$latest-live.img.xz
mkdir /base_image
qemu-img convert -O qcow2 -c clear-$latest-live.img /base_image/clear-gz.img
rm *.img

echo "Download OVMF firmware file"
curl -O https://download.clearlinux.org/image/OVMF.fd
mv OVMF.fd /

echo "Done"
