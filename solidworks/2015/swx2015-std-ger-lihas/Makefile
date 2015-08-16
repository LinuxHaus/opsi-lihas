WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = swx2015-std-ger-lihas
VERSION              = 2015
OPSI_PACKAGE_VERSION = 2

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
