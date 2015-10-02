WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = ajaxplorer-pydio-moz-tb-lihas
VERSION              = 1.4.0
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = https://addons.cdn.mozilla.net/user-media/addons/_attachments/421776/ajaxplorer_for_filelink-1.4.0-tb.xpi
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URL),$(subst $(dir $(url)),,$(url)))

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download unpack findname movetoname build install

download:
	mkdir -p $(DOWNLOAD_DIR)
	mkdir -p $(DOWNLOAD_DIR)/target
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URL)

unpack: $(DOWNLOAD_TARGETS)
	mkdir -p $(DOWNLOAD_DIR)/unpacked
	7z x -o"$(DOWNLOAD_DIR)/unpacked" "$(DOWNLOAD_DIR)/$(DOWNLOAD_FILES)"
	(cd $(DOWNLOAD_DIR) && rm $(DOWNLOAD_FILES))

findname: $(DOWNLOAD_DIR)/unpacked/install.rdf
	xmlstarlet sel -N rdf=http://www.w3.org/1999/02/22-rdf-syntax-ns# -N em=http://www.mozilla.org/2004/em-rdf# -t -v "//rdf:Description[@about='urn:mozilla:install-manifest']/em:id" $(DOWNLOAD_DIR)/unpacked/install.rdf >$(DOWNLOAD_DIR)/pluginname

movetoname: 
	rsync -aPv $(DOWNLOAD_DIR)/unpacked/ $(DOWNLOAD_DIR)/target/$(shell cat $(DOWNLOAD_DIR)/pluginname)

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
