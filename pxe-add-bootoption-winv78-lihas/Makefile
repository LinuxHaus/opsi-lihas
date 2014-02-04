WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = pxe-add-bootoption-winv78-lihas
VERSION              = 1.0
OPSI_PACKAGE_VERSION = 1
G4D_VERSION          = 0.4.4
DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URLS        = http://boot.ipxe.org/ipxe.lkrn \
		       http://sourceforge.net/projects/grub4dos/files/GRUB4DOS/grub4dos%20$(G4D_VERSION)/grub4dos-$(G4D_VERSION).zip
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URLS),$(subst $(dir $(url)),,$(url)))
DOWNLOAD_TARGETS     = $(addprefix $(DOWNLOAD_DIR)/,$(DOWNLOAD_FILES))

SOURCE_DIR           = ./CLIENT_DATA/sources
SOURCE_URLS          = https://git.ipxe.org/ipxe.git/snapshot/HEAD.zip \
		       http://sourceforge.net/projects/grub4dos/files/GRUB4DOS/grub4dos%20$(G4D_VERSION)/grub4dos-$(G4D_VERSION)-src.zip
SOURCE_FILES         = $(foreach url,$(SOURCE_URLS),$(subst $(dir $(url)),,$(url)))
SOURCE_TARGETS       = $(addprefix $(SOURCE_DIR)/,$(SOURCE_FILES))

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download unpack build install

$(DOWNLOAD_TARGETS):
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URLS) 

download: $(DOWNLOAD_TARGETS) 

unpack:
	unzip -q -L -o -j -d "$(DOWNLOAD_DIR)/grub4dos" "$(DOWNLOAD_DIR)/grub4dos-$(G4D_VERSION).zip"

$(SOURCE_TARGETS):
	mkdir -p $(SOURCE_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(SOURCE_DIR) $(SOURCE_URLS)

dlsource: $(SOURCE_TARGETS) 

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf $(DOWNLOAD_DIR)
	rm -rf $(SOURCE_DIR)
	rm -f $(TARGET) $(TARGET).uploaded
