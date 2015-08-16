WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = bonjour-lihas
VERSION              = 1
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URLS        = https://support.apple.com/downloads/DL999/de_DE/BonjourPSSetup.exe
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URLS),$(subst $(dir $(url)),,$(url)))
DOWNLOAD_TARGETS     = $(addprefix $(DOWNLOAD_DIR)/,$(DOWNLOAD_FILES))

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: checkpresence download unpack build install

checkpresence: /usr/lib/p7zip/Codecs/Rar29.so ./CLIENT_DATA/license.key

$(DOWNLOAD_TARGETS):
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URLS) 

download: $(DOWNLOAD_TARGETS) 

unpack: $(DOWNLOAD_TARGETS)
	mkdir -p $(DOWNLOAD_DIR)/unpacked
	7z x -o"$(DOWNLOAD_DIR)/unpacked" "$(DOWNLOAD_DIR)/$(DOWNLOAD_FILES)"
	(cd $(DOWNLOAD_DIR) && rm $(DOWNLOAD_FILES))

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
