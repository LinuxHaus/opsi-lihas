WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = pxe-overwrite-entire-disk-lihas
VERSION              = 1.0
OPSI_PACKAGE_VERSION = 5
DD_VERSION           = 0.6beta3
DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URLS        = http://boot.ipxe.org/ipxe.usb \
	               http://www.chrysocome.net/downloads/dd-$(DD_VERSION).zip
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URLS),$(subst $(dir $(url)),,$(url)))
DOWNLOAD_TARGETS     = $(addprefix $(DOWNLOAD_DIR)/,$(DOWNLOAD_FILES))

SOURCE_DIR           = ./CLIENT_DATA/sources
SOURCE_URLS          = https://git.ipxe.org/ipxe.git/snapshot/HEAD.zip \
		       http://www.chrysocome.net/downloads/dd-$(DD_VERSION).src.zip
SOURCE_FILES         = $(foreach url,$(SOURCE_URLS),$(subst $(dir $(url)),,$(url)))
SOURCE_TARGETS       = $(addprefix $(SOURCE_DIR)/,$(SOURCE_FILES))

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download unpack build install

$(DOWNLOAD_TARGETS):
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URLS) 

download: $(DOWNLOAD_TARGETS) 

unpack:
	unzip -q -L -o -j -d "$(DOWNLOAD_DIR)/dd" "$(DOWNLOAD_DIR)/dd-$(DD_VERSION).zip"

$(SOURCE_TARGETS):
	mkdir -p $(SOURCE_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(SOURCE_DIR) $(SOURCE_URLS)

dlsource: $(SOURCE_TARGETS) 

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf $(DOWNLOAD_DIR)
	rm -rf $(SOURCE_DIR)
	rm -f $(TARGET) $(TARGET).uploaded
