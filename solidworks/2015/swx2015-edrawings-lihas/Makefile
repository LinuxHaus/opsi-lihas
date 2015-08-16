WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = swx2015-edrawings-lihas
VERSION              = 2015
OPSI_PACKAGE_VERSION = 2

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: checkpresence build install

checkpresence: md5sums.txt CLIENT_DATA/files
	md5deep -r -n -l -X md5sums.txt CLIENT_DATA/files/*

$(TARGET): checkpresence
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -p ask -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf CLIENT_DATA/files/*
	rm -f $(TARGET) $(TARGET).uploaded
