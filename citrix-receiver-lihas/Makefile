WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = citrix-receiver-lihas
VERSION              = latestorlegacy
OPSI_PACKAGE_VERSION = 1
LINKLIST             = https://www.citrix.de/downloads/citrix-receiver/windows/receiver-for-windows-latest.html \
                       https://www.citrix.de/downloads/citrix-receiver/legacy-receiver-for-windows/receiver-for-windows-44.html \
                       https://www.citrix.de/downloads/citrix-receiver/legacy-receiver-for-windows/receiver-for-windows-431.html \
					   https://www.citrix.de/downloads/citrix-receiver/legacy-receiver-for-windows/receiver-for-windows-43.html \
					   https://www.citrix.de/downloads/citrix-receiver/legacy-receiver-for-windows/receiver-for-windows-42100.html \
					   https://www.citrix.de/downloads/citrix-receiver/legacy-receiver-for-windows/receiver-for-windows-42.html

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download patch build install

download:
	mkdir -p CLIENT_DATA/files
	for RECURL in $(LINKLIST) ; \
		do PAGESOURCE=$$(wget -q -O - $$RECURL) ; \
		DLLINK=$$(echo -e "$$PAGESOURCE" | grep '#ctx-dl-eula"' | grep  "CitrixReceiver.*\.exe" | head -1 | perl -pe 's/^.*rel="(.*?)".*$$/https:\1/') ; \
		VERSIONNAME=$$(echo -e "$$PAGESOURCE" | grep '<h1>Receiver .*for Windows' | head -1 | perl -pe 's#^.*<h1>Receiver(.*?)for Windows(.*?)</h1>.*$$#\1\2#' | xargs echo) ; \
		wget -q -O CLIENT_DATA/files/CitrixReceiver$$VERSIONNAME.exe $$DLLINK ; \
		if echo "$$RECURL" | grep -q 'latest\.html$$' ; then \
			rm -f CLIENT_DATA/files/CitrixReceiverLatest.exe ; \
			ln CLIENT_DATA/files/CitrixReceiver$$VERSIONNAME.exe CLIENT_DATA/files/CitrixReceiverLatest.exe ; \
		fi ; \
	done

patch:
	VERSIONVALUES=$$(echo "values: [$$(ls -1 CLIENT_DATA/files/ | sed -e 's/^CitrixReceiver\(.*\)\.exe$$/\1/' -e '/^Latest$$/d' | sort -nr | sed -e 's/^\(.*\)$$/"\1", /' | tr -d '\n')\"Latest\"]") ; \
	sed -i -e "/^values: .*, \"Latest\"]$$/d" OPSI/control ; \
	sed -i -e "/^default: \[\"Latest\"\]$$/i$$VERSIONVALUES" OPSI/control

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -p ask -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf CLIENT_DATA/files
	rm -f $(TARGET) $(TARGET).uploaded
