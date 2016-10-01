WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = mysql-odbc-connector-lihas
VERSION              = latestorlegacy
OPSI_PACKAGE_VERSION = 1
DOWNLOAD_DIR         = ./CLIENT_DATA/files
DOWNLOAD_URLS        = https://dev.mysql.com/get/Downloads/Connector-ODBC/5.1/mysql-connector-odbc-5.1.13-win32.msi \
                       https://dev.mysql.com/get/Downloads/Connector-ODBC/5.1/mysql-connector-odbc-5.1.13-winx64.msi \
					   https://dev.mysql.com/get/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-5.3.6-win32.msi \
					   https://dev.mysql.com/get/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-5.3.6-winx64.msi
DOWNLOAD_FILES       = $(foreach url,$(DOWNLOAD_URLS),$(subst $(dir $(url)),,$(url)))
DOWNLOAD_TARGETS     = $(addprefix $(DOWNLOAD_DIR)/,$(DOWNLOAD_FILES))

TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: download patch build install

$(DOWNLOAD_TARGETS):
	mkdir -p ./$(DOWNLOAD_DIR)
	wget $(WGET_COMMON_OPTIONS) -P $(DOWNLOAD_DIR) $(DOWNLOAD_URLS)
	chmod 755 -R ./$(DOWNLOAD_DIR)/*

download: $(DOWNLOAD_TARGETS) 

OPSI/control: OPSI/control.template
	VERSIONVALUES=$$(echo "values: [$$(ls -1 $(DOWNLOAD_DIR) | sed -e 's/^mysql-connector-odbc-\(.*\)\-win.*.msi$$/\1/' -e '/^Latest$$/d' | sort -nru | sed -e 's/^\(.*\)$$/"\1", /' | tr -d '\n')\"Latest\"]") ; \
	sed -e "/^values: .*, \"Latest\"]$$/d" OPSI/control.template > OPSI/control ; \
	sed -i -e "/^default: \[\"Latest\"\]$$/i$$VERSIONVALUES" OPSI/control

CLIENT_DATA/setup.ins: CLIENT_DATA/setup.ins.template
	LATESTVERSION=$$(ls -1 $(DOWNLOAD_DIR) | sed -e 's/^mysql-connector-odbc-\(.*\)\-win.*.msi$$/\1/' | sort -nu | tail -1 ) ; \
	sed -e "/^Set \$$LatestVersion\$$.*/cSet \$$LatestVersion\$$ = \"$$LATESTVERSION\"" CLIENT_DATA/setup.ins.template >CLIENT_DATA/setup.ins

patch: OPSI/control CLIENT_DATA/setup.ins

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -p ask -i $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -rf CLIENT_DATA/files
	rm -f OPSI/control CLIENT_DATA/setup.ins
	rm -f $(TARGET) $(TARGET).uploaded
