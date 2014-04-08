WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = dragon-medical-network-ed-lihas
VERSION              = 1.0
OPSI_PACKAGE_VERSION = 2

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: checkpresence download unpack build install

checkpresence: md5sums.txt CLIENT_DATA/files
	md5deep -r -n -l -X md5sums.txt CLIENT_DATA/files/*

download:

unpack:

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -f $(TARGET) $(TARGET).uploaded
