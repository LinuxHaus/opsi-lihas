WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = dotnet-langpack-deu-lihas
VERSION              = 4.5.2
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = http://download.microsoft.com/download/E/4/E/E4EB40BB-2428-4278-B897-2961E970CF23/NDP452-KB2901907-x86-x64-AllOS-DEU.exe

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
