WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = veracrypt-full-lihas
VERSION              = 1.16
OPSI_PACKAGE_VERSION = 1

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: checkpresence build install

checkpresence: md5sumsx86.txt md5sumsx64.txt 
	md5deep -r -n -l -X md5sumsx86.txt CLIENT_DATA/files/* || md5deep -r -n -l -X md5sumsx64.txt CLIENT_DATA/files/*

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i -p ask $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -f $(TARGET) $(TARGET).uploaded
