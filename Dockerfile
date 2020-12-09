FROM amd64/ubuntu:groovy

RUN apt update
RUN apt install -y --no-install-recommends \
        git \
        wget \
        python \
        python3 \
        python3-pip \
        ubuntu-keyring \
        qemu-user-static \
        binfmt-support \
        debootstrap \
        coreutils \
        parted \
        gdisk \
        bzip2 \
        kpartx \
        lbzip2 \
        sudo \
        e2fsprogs \
        dosfstools \
        qemu-utils

RUN python3 -m pip install ansible

ENTRYPOINT ["bash", "target/build.sh"]
