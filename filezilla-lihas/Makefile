WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = filezilla-lihas
VERSION              = 3.17.0.1
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = http://sourceforge.net/projects/filezilla/files/FileZilla_Client/$(VERSION)/FileZilla_$(VERSION)_win64-setup.exe

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download build install

download:
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URL)

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
