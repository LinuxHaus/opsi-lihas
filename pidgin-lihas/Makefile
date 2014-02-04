WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = pidgin-lihas
VERSION              = 2.10.9
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URLS        = http://heanet.dl.sourceforge.net/project/pidgin/Pidgin/$(VERSION)/pidgin-$(VERSION)-offline.exe
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URLS),$(subst $(dir $(url)),,$(url)))
DOWNLOAD_TARGETS     = $(addprefix $(DOWNLOAD_DIR)/,$(DOWNLOAD_FILES))

SOURCE_DIR           = ./CLIENT_DATA/sources
SOURCE_URLS          = http://sourceforge.net/projects/pidgin/files/Pidgin/$(VERSION)/pidgin-$(VERSION).tar.bz2
SOURCE_FILES         = $(foreach url,$(SOURCE_URLS),$(subst $(dir $(url)),,$(url)))
SOURCE_TARGETS       = $(addprefix $(SOURCE_DIR)/,$(SOURCE_FILES))

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download unpack build install

$(DOWNLOAD_TARGETS):
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URLS) 

download: $(DOWNLOAD_TARGETS) 

unpack:

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
