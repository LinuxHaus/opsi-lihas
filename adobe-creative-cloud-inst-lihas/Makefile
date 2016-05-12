WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = adobe-creative-cloud-inst-lihas
VERSION              = 3.4.1.181
OPSI_PACKAGE_VERSION = 1

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: build install

$(TARGET): CLIENT_DATA/files/151203_CreativeCloud.msi CLIENT_DATA/files/ASU CLIENT_DATA/files/ASU2 CLIENT_DATA/files/RemoteUpdateManager CLIENT_DATA/files/AdobeCreativeCloudCleanerTool.exe
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -f $(TARGET) $(TARGET).uploaded
