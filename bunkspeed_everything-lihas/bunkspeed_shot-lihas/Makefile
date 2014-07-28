PACKAGE_NAME         = bunkspeed_shot-lihas
VERSION              = 2014
OPSI_PACKAGE_VERSION = 1

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: checkpresence build install

checkpresence: ./CLIENT_DATA/files/BunkspeedShot.msi

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf ./CLIENT_DATA/files
	rm -f $(TARGET) $(TARGET).uploaded
