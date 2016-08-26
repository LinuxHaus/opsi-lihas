WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = driver-backuptool-lihas
VERSION              = 1.0
OPSI_PACKAGE_VERSION = 5
DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URLS        = http://download.pcwelt.de/area_release/files/4E/4B/4E4B1F177BBA3A70B39FF4FC7BF7E5B0/double_driver_4.1.0_portable.zip
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URLS),$(subst $(dir $(url)),,$(url)))
DOWNLOAD_TARGETS     = $(addprefix $(DOWNLOAD_DIR)/,$(DOWNLOAD_FILES))

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download unpack build install

$(DOWNLOAD_TARGETS):
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) "$(DOWNLOAD_URLS)"

download: $(DOWNLOAD_TARGETS) 

unpack:
	unzip -q -L -o -j -d "$(DOWNLOAD_DIR)/unpacked" "$(DOWNLOAD_DIR)/*.zip"
	(cd $(DOWNLOAD_DIR) && rm *.zip)

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i -p ask $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf $(DOWNLOAD_DIR)
	rm -f $(TARGET) $(TARGET).uploaded
