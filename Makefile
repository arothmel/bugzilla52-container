# Makefile for Bugzilla 5.2 container build (AlmaLinux 8)

IMAGE_NAME=bugzilla52:alma8
TAR_NAME=bugzilla52-alma8.tar
BUGZILLA_TAR_URL=https://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla/bugzilla-5.2.tar.gz
BUGZILLA_TAR=bugzilla-5.2.tar.gz
BUGZILLA_DIR=bugzilla-5.2

all: build

fetch:
	wget -N $(BUGZILLA_TAR_URL)
	tar -xzf $(BUGZILLA_TAR)

build: fetch
	podman build -t $(IMAGE_NAME) .

save:
	podman save -o $(TAR_NAME) $(IMAGE_NAME)

clean:
	rm -rf $(BUGZILLA_TAR) $(BUGZILLA_DIR) $(TAR_NAME)

