WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = silverlight-kb2977218-lihas
VERSION              = 5.1.30514.0
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = https://download.microsoft.com/download/F/8/C/F8C0EACB-92D0-4722-9B18-965DD2A681E9/30514.00/Silverlight_x64.exe

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
