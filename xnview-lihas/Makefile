WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = xnview-lihas
VERSION              = 2.36
OPSI_PACKAGE_VERSION = 1
DOWNLOAD_URLS        = http://download3.xnview.com/XnView-win-full.exe

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download build install

download:
	mkdir -p CLIENT_DATA/files
	wget -q -P CLIENT_DATA/files/ $(DOWNLOAD_URLS)

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -p ask -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf CLIENT_DATA/files
	rm -f $(TARGET) $(TARGET).uploaded
