WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = rdp-enable-openfw-lihas
VERSION              = 1.0
OPSI_PACKAGE_VERSION = 7

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
