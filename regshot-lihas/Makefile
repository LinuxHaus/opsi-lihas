WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = regshot-lihas
VERSION              = 1.9.0
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = http://downloads.sourceforge.net/project/regshot/regshot/1.9.0/Regshot-1.9.0.7z

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download unpack build install

download:
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URL)

unpack: $(DOWNLOAD_DIR)/Regshot-1.9.0.7z
	mkdir -p $(DOWNLOAD_DIR)/unpacked
	7z x -o"$(DOWNLOAD_DIR)/unpacked" "$(DOWNLOAD_DIR)/Regshot-1.9.0.7z"
	rm $(DOWNLOAD_DIR)/Regshot-1.9.0.7z


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
