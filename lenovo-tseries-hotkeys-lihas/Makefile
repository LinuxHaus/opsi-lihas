WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = lenovo-tseries-hotkeys-lihas
VERSION              = 8.80.10
OPSI_PACKAGE_VERSION = 1


TARGET               = $(PACKAGE_NAME)_$(VERSION)-$(OPSI_PACKAGE_VERSION).opsi

all: checkpresence build install

# You need to download https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles/n1avu31w.exe
# and run it on a windows machine. Have it extract the file to C:\DRIVERS\HOTKEY
# then fetch C:\DRIVERS\HOTKEY\setup.exe, copy it to CLIENT_DATA/files
# and make sure it is chmodded "executable" for pcpatch

checkpresence: md5sums.txt CLIENT_DATA/files
	md5deep -r -n -l -X md5sums.txt CLIENT_DATA/files/*

$(TARGET):
	opsi-makeproductfile

build: $(TARGET)

$(TARGET).uploaded:
	opsi-package-manager -i -p ask $(TARGET)
	touch $(TARGET).uploaded

install: $(TARGET).uploaded

clean:
	rm -f $(TARGET) $(TARGET).uploaded
