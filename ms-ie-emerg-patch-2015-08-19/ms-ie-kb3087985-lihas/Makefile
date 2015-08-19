WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = ms-ie-kb3087985-lihas
VERSION              = 1
OPSI_PACKAGE_VERSION = 1

DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URL         = http://download.microsoft.com/download/4/F/7/4F77D5B9-6A41-4BAB-83CC-346D4FE4697E/IE11-Windows6.1-KB3078071-x64.msu http://download.microsoft.com/download/0/2/4/02420B5F-7811-48B5-AE57-B8DC8D99F607/IE11-Windows6.1-KB3078071-x86.msu http://download.microsoft.com/download/9/8/3/983D12AF-FA57-4AC9-9EB3-2DF1AE798A1F/IE10-Windows6.1-KB3078071-x64.msu http://download.microsoft.com/download/F/4/4/F44FB67D-340F-4A5C-9372-3AFF16AD37F0/IE10-Windows6.1-KB3078071-x86.msu http://download.microsoft.com/download/E/5/D/E5D911A9-EC83-4A74-9049-F6B06117F205/IE9-Windows6.1-KB3078071-x64.msu http://download.microsoft.com/download/8/2/3/8233B3AA-A688-4AFE-9B40-5873123AA0FD/IE9-Windows6.1-KB3078071-x86.msu http://download.microsoft.com/download/3/9/6/396E821F-65CC-40A1-8849-07828E462116/Windows6.1-KB3078071-x64.msu http://download.microsoft.com/download/D/D/F/DDFA7A75-5437-40CA-BAF7-C27DC8AFED4C/Windows6.1-KB3078071-x86.msu

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download build install

download:
	mkdir -p $(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URL)

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf $(DOWNLOAD_DIR)
	rm -f $(TARGET) $(TARGET).uploaded
