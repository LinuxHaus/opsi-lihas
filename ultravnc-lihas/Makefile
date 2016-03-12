WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = ultravnc-lihas
VERSION              = 1.2.1.0
UVNC_VERSION         = 1210
UVNC_VERSION_LONG    = 1_2_10
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URLS        = http://www.uvnc.eu/download/$(UVNC_VERSION)/UltraVNC_$(UVNC_VERSION_LONG)_X86_Setup.exe \
                       http://www.uvnc.eu/download/$(UVNC_VERSION)/UltraVNC_$(UVNC_VERSION_LONG)_X64_Setup.exe
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URLS),$(subst $(dir $(url)),,$(url)))
DOWNLOAD_TARGETS     = $(addprefix $(DOWNLOAD_DIR)/,$(DOWNLOAD_FILES))

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download build install

$(DOWNLOAD_TARGETS):
	mkdir -p ./$(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URLS)
	chmod 755 -R ./$(DOWNLOAD_DIR)/*

download: $(DOWNLOAD_TARGETS) 

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i -p ask $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf CLIENT_DATA/files
	rm -f $(TARGET) $(TARGET).uploaded
