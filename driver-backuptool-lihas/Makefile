WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = driver-backuptool-lihas
VERSION              = 1.0
OPSI_PACKAGE_VERSION = 4
DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URLS        =  http://ubuntuone.com/p/BY7/?dd.zip
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URLS),$(subst $(dir $(url)),,$(url)))
DOWNLOAD_TARGETS     = $(addprefix $(DOWNLOAD_DIR)/,$(DOWNLOAD_FILES))

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download unpack build install

$(DOWNLOAD_TARGETS):
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) "$(DOWNLOAD_URLS)"

download: $(DOWNLOAD_TARGETS) 

unpack:
	unzip -q -L -o -j -d "$(DOWNLOAD_DIR)/unpacked" "$(DOWNLOAD_DIR)/*.zip"
	(cd $(DOWNLOAD_DIR) && rm *.zip)

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
