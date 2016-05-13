WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = medion-amda00-dev-driver-lihas
VERSION              = 1.0
OPSI_PACKAGE_VERSION = 2

DOWNLOAD_DIR         = ./CLIENT_DATA/files/
DOWNLOAD_URLS        = http://dlcdnet.asus.com/pub/ASUS/mb/socket1150/Z97-WS/Driver/AMDA00_V1010.zip
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URLS),$(subst $(dir $(url)),,$(url)))
DOWNLOAD_TARGETS     = $(addprefix $(DOWNLOAD_DIR)/,$(DOWNLOAD_FILES))

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download unpack build install

$(DOWNLOAD_TARGETS):
	mkdir -p "$(DOWNLOAD_DIR)"
	wget $(WGET_COMMON_OPTIONS) -P "$(DOWNLOAD_DIR)" $(DOWNLOAD_URLS) 

download: $(DOWNLOAD_TARGETS) 

unpack: $(DOWNLOAD_TARGETS)
	mkdir -p "$(DOWNLOAD_DIR)/unpacked/"
	7z x -o"$(DOWNLOAD_DIR)/unpacked/" "$(DOWNLOAD_DIR)/$(DOWNLOAD_FILES)"
	(cd "$(DOWNLOAD_DIR)" && rm $(DOWNLOAD_FILES))

$(TARGET):
	mkdir -p "$(DOWNLOAD_DIR)/Pentino_H-Series A_MT_B85-1/x86"
	mkdir -p "$(DOWNLOAD_DIR)/Pentino_H-Series A_MT_B85-1/x64"
	rsync -aPvH "$(DOWNLOAD_DIR)/unpacked/AMDA00/x86/"* "$(DOWNLOAD_DIR)/Pentino_H-Series A_MT_B85-1/x86"
	rsync -aPvH "$(DOWNLOAD_DIR)/unpacked/AMDA00/x64/"* "$(DOWNLOAD_DIR)/Pentino_H-Series A_MT_B85-1/x64"
	rm -rf "$(DOWNLOAD_DIR)/unpacked/AMDA00"
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf "$(DOWNLOAD_DIR)"
	rm -f $(TARGET) $(TARGET).uploaded
