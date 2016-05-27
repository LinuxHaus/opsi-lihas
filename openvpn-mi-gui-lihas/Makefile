WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = openvpn-mi-gui-lihas
VERSION              = 20160308
OPSI_PACKAGE_VERSION = 3
OPENVPNPACKAGE       = 

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = http://openvpn-mi-gui.inside-security.de/sw/openvpn-mi-gui-20160308-de-w32.exe http://openvpn-mi-gui.inside-security.de/sw/openvpn-mi-gui-20160308-de-w64.exe http://openvpn-mi-gui.inside-security.de/sw/openvpn-mi-gui-20160308-en-w32.exe http://openvpn-mi-gui.inside-security.de/sw/openvpn-mi-gui-20160308-en-w64.exe http://openvpn-mi-gui.inside-security.de/sw/openvpn-mi-gui-20160308-cs-w32.exe http://openvpn-mi-gui.inside-security.de/sw/openvpn-mi-gui-20160308-cs-w64.exe

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download build install

download:
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URL)

$(TARGET):
	test -n "${OPENVPNPACKAGE}"
	sed -i	-e "/requiredProduct:/crequiredProduct: ${OPENVPNPACKAGE}" ./OPSI/control
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf $(DOWNLOAD_DIR)
	rm -f $(TARGET) $(TARGET).uploaded
