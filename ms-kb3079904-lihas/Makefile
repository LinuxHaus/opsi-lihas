WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = ms-kb3079904-lihas
VERSION              = 1
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL1        = http://download.microsoft.com/download/1/5/7/15796587-CDC1-4586-97E9-299409682DC4/Windows6.1-KB3079904-x64.msu
DOWNLOAD_URL2        = http://download.microsoft.com/download/D/1/C/D1C30127-807B-4F55-9C57-77C75E61A208/Windows6.1-KB3079904-x86.msu

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download build install

download:
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URL1) $(DOWNLOAD_URL2)

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
