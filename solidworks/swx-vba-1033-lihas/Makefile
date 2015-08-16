WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = swx-vba-1033-lihas
VERSION              = 7.1
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: build install

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf $(DOWNLOAD_DIR)
	rm -f $(TARGET) $(TARGET).uploaded
