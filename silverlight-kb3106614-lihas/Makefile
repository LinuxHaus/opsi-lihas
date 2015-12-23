WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = silverlight-kb3106614-lihas
VERSION              = 5.1.41105.00
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = https://download.microsoft.com/download/8/5/8/858377D7-5FDE-410D-B2FA-411B8078D227/41105/41105.00/Silverlight_x64.exe

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
