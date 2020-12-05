build:
	docker build -t pisdr_v2 .

run:
	sudo docker run -e PISDR_ARCH=$(arch) -v /dev:/dev --privileged -v $(shell pwd):/target pisdr_v2

login:
	sudo chroot $(rootfs) /bin/bash -i

clean:
	sudo rm -fr build export
