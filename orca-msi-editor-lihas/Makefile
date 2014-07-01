WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = orca-msi-editor-lihas
VERSION              = 3.1.4000.1830
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = http://www.technipages.com/downloads/OrcaMSI.zip

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download unpack build install

download:
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URL)

unpack:
	unzip -q -L -o -j -d "$(DOWNLOAD_DIR)/unpacked" "$(DOWNLOAD_DIR)/*.zip"
	(cd $(DOWNLOAD_DIR) && rm *.zip)

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
