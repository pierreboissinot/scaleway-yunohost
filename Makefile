NAME =			yunohost
VERSION =		latest
VERSION_ALIASES =	
TITLE =			Cozy Cloud
DESCRIPTION =		Cozy Cloud
SOURCE_URL =		https://github.com/scaleway-community/scaleway-yunohost
VENDOR_URL =		http://yunohost.org/
DEFAULT_IMAGE_ARCH =	x86_64

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	latest
IMAGE_NAME =		Yunohost (beta)

# Forward ports
#SHELL_DOCKER_OPTS ?=    -p 80:80 -p 443:443


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk

