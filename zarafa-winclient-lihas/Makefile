WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = zarafa-winclient-lihas
MAINVERSION          = 7.1
PATCHLEVEL	     = 11
SUBVERSION	     = 46050
WINVERSION	     = 46779
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = http://download.zarafa.com/community/final/$(MAINVERSION)/$(MAINVERSION).$(PATCHLEVEL)-$(SUBVERSION)/windows/zarafaclient-$(MAINVERSION).$(PATCHLEVEL)-$(WINVERSION).msi

TARGET               = $(PACKAGE_NAME)_$(MAINVERSION).$(PATCHLEVEL).$(WINVERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download build install

download:
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URL)
	mv $(DOWNLOAD_DIR)/zarafaclient-$(MAINVERSION).$(PATCHLEVEL)-$(WINVERSION).msi $(DOWNLOAD_DIR)/zarafaclient.msi

$(TARGET):
	sed s/VERSION/$(VERSION).$(PATCHLEVEL).$(WINVERSION)/g OPSI/control.template > OPSI/control
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf $(DOWNLOAD_DIR)
	rm -f $(TARGET) $(TARGET).uploaded
