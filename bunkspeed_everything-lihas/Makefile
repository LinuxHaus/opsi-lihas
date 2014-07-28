WGET_COMMON_OPTIONS  = -q -N

DOWNLOAD_DIR         = ./files
DOWNLOAD_URLS        = http://installs.bunkspeed.com/2014/BunkspeedShot.zip
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URLS),$(subst $(dir $(url)),,$(url)))
DOWNLOAD_TARGETS     = $(addprefix $(DOWNLOAD_DIR)/,$(DOWNLOAD_FILES))
BUNKSPEED_SHOT_DIR   = ./bunkspeed_shot-lihas/
BUNKSPEED_PRERQ_DIR  = ./bunkspeed_prereq-lihas/

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: checkpresence download unpack move2dest deltemp build 

checkpresence: /usr/bin/unzip

$(DOWNLOAD_TARGETS):
	mkdir -p ./$(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URLS) 

download: $(DOWNLOAD_TARGETS) 

unpack: $(DOWNLOAD_TARGETS)
	mkdir -p $(DOWNLOAD_DIR)/unpacked
	unzip "$(DOWNLOAD_DIR)/$(DOWNLOAD_FILES)" BunkspeedShot.msi BunkspeedPrerequisites/BunkspeedPrerequisites3.msi -d "$(DOWNLOAD_DIR)/unpacked"
	(cd $(DOWNLOAD_DIR) && rm $(DOWNLOAD_FILES))

move2dest: $(DOWNLOAD_DIR)/unpacked/BunkspeedShot.msi $(DOWNLOAD_DIR)/unpacked/BunkspeedPrerequisites/BunkspeedPrerequisites3.msi
	mkdir -p $(BUNKSPEED_SHOT_DIR)/CLIENT_DATA/files/
	mv $(DOWNLOAD_DIR)/unpacked/BunkspeedShot.msi $(BUNKSPEED_SHOT_DIR)/CLIENT_DATA/files/
	mkdir -p $(BUNKSPEED_PRERQ_DIR)/CLIENT_DATA/files/
	mv $(DOWNLOAD_DIR)/unpacked/BunkspeedPrerequisites/BunkspeedPrerequisites3.msi $(BUNKSPEED_PRERQ_DIR)/CLIENT_DATA/files/

deltemp: $(DOWNLOAD_DIR)/unpacked
	rm -rf $(DOWNLOAD_DIR)
	
build:
	for i in *; do [ -d $$i ] && (make -C $$i); done

clean:
	rm -rf $(DOWNLOAD_DIR)
	for i in *; do [ -d $$i ] && (make -C $$i clean); done
