WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = phonesuite-lihas
VERSION              = 3.0.028beta11
OPSI_PACKAGE_VERSION = 1

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: checkpresence patch build install

checkpresence: md5sums.txt CLIENT_DATA/files CLIENT_DATA/files/bin/Uninstall/uninstall.ini CLIENT_DATA/files/setup.ini CLIENT_DATA/files/Lizenzen.txt
	md5deep -r -n -l -X md5sums.txt CLIENT_DATA/files/*
patch:
	sed -i -e'/SuppressAllDialogs/cSuppressAllDialogs=1' CLIENT_DATA/files/bin/Uninstall/uninstall.ini CLIENT_DATA/files/setup.ini

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -f $(TARGET) $(TARGET).uploaded
