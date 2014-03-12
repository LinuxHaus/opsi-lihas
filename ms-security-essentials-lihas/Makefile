WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = ms-security-essentials-lihas
VERSION              = 4.4.0304.0
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL_BASE    = http://download.microsoft.com/download/0/2/C/02C8AB73-0774-4975-826F-9E8A0FD7F65D/DEDE

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download unpack build install

download:
	mkdir -p $(DOWNLOAD_DIR)/amd64
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR)/amd64 $(DOWNLOAD_URL_BASE)/amd64/MSEInstall.exe
	mkdir -p $(DOWNLOAD_DIR)/x86
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR)/x86 $(DOWNLOAD_URL_BASE)/x86/MSEInstall.exe

unpack:
	7z x -o$(DOWNLOAD_DIR)/amd64 $(DOWNLOAD_DIR)/amd64/MSEInstall.exe 
	7z x -o$(DOWNLOAD_DIR)/x86 $(DOWNLOAD_DIR)/x86/MSEInstall.exe 

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
