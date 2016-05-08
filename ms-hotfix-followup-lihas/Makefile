
PACKAGE_NAME         = ms-hotfix-followup-lihas
VERSION              = 1.0
OPSI_PACKAGE_VERSION = 4

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = http://msdn.microsoft.com/en-us/library/windows/desktop/aa387102%28v=vs.85%29.aspx 

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download patch build install

download:
	mkdir -p $(DOWNLOAD_DIR)
	lynx -dump $(DOWNLOAD_URL) | grep -A118 "Set updateSession" >$(DOWNLOAD_DIR)/WUA_SearchDownloadInstall.vbs

patch: $(DOWNLOAD_DIR)/WUA_SearchDownloadInstall.vbs
	patch $(DOWNLOAD_DIR)/WUA_SearchDownloadInstall.vbs WUA_SearchDownloadInstall.vbs.diff

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i -p ask $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf $(DOWNLOAD_DIR)
	rm -f $(TARGET) $(TARGET).uploaded
