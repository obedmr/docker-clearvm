#!/bin/bash

if [ -z "$1" ]; then
    IMAGE_MOUNT=""
else
    IMAGE_MOUNT="-v `pwd`/$1:/base_image/clear-gz.img"
fi

SSH_PORT=`python3 -c "import random; print(random.randint(2000,3000))"`

docker run -d -e "RANCHER_VM=true" --cap-add NET_ADMIN \
       -v /var/lib/rancher/vm:/vm --device /dev/kvm:/dev/kvm \
        $IMAGE_MOUNT \
       -p $SSH_PORT:22 \
       --device /dev/net/tun:/dev/net/tun obedmr/clearvm \
       -smp cpus=4,cores=2 -cpu host -bios /OVMF.fd

