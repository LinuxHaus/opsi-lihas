WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = swx2016-prereq-lihas
VERSION              = 2016
OPSI_PACKAGE_VERSION = 1

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: build install

$(TARGET): 
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -f $(TARGET) $(TARGET).uploaded
