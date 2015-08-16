PACKAGE_NAME         = swx2015
VERSION              = 2.0
DIRLIST              = swx2015-basis-lihas swx2015-edrawings-lihas swx2015-explorer-lihas swx2015-german-lihas swx2015-prereq-lihas swx2015-std-ger-lihas ../swx-vba-1031-lihas ../swx-vba-1033-lihas ../swx-vba-lihas ../swx-vsta-lihas


all: checkpresence unzip prime build install

checkpresence: md5sums.txt files/SW2015SP21_IM_ohne_SN.zip
	md5deep -r -n -l -X md5sums.txt files/*

unzip:	files/SW2015SP21_IM_ohne_SN.zip
	unzip -o -d files files/SW2015SP21_IM_ohne_SN.zip

prime:
	mkdir -p swx2015-basis-lihas/CLIENT_DATA/files swx2015-edrawings-lihas/CLIENT_DATA/files swx2015-explorer-lihas/CLIENT_DATA/files swx2015-german-lihas/CLIENT_DATA/files ../swx-vsta-lihas/CLIENT_DATA/files ../swx-vba-lihas/CLIENT_DATA/files/ ../swx-vba-1033-lihas/CLIENT_DATA/files/ ../swx-vba-1031-lihas/CLIENT_DATA/files/
	cp -alf files/SW2015SP21_IM_ohne_SN/64bit/SOLIDWORKS/* swx2015-basis-lihas/CLIENT_DATA/files/
	cp -alf files/SW2015SP21_IM_ohne_SN/64bit/Toolbox swx2015-basis-lihas/CLIENT_DATA/files/
	cp -alf files/SW2015SP21_IM_ohne_SN/64bit/eDrawings/* swx2015-edrawings-lihas/CLIENT_DATA/files/
	cp -alf files/SW2015SP21_IM_ohne_SN/64bit/SOLIDWORKS\ Explorer/* swx2015-explorer-lihas/CLIENT_DATA/files/
	cp -alf files/SW2015SP21_IM_ohne_SN/64bit/SOLIDWORKS\ German/* swx2015-german-lihas/CLIENT_DATA/files/
	cp -alf files/SW2015SP21_IM_ohne_SN/64bit/Microsoft_VSTA/vsta_aide.msi ../swx-vsta-lihas/CLIENT_DATA/files/vsta_aide.msi
	cp -alf files/SW2015SP21_IM_ohne_SN/64bit/Microsoft_VBA/vba71.msi ../swx-vba-lihas/CLIENT_DATA/files/vba71.msi
	cp -alf files/SW2015SP21_IM_ohne_SN/64bit/Microsoft_VBA_1031/vba71_1031.msi ../swx-vba-1031-lihas/CLIENT_DATA/files/vba71_1031.msi
	cp -alf files/SW2015SP21_IM_ohne_SN/64bit/Microsoft_VBA_1033/vba71_1033.msi ../swx-vba-1033-lihas/CLIENT_DATA/files/vba71_1033.msi

build: 
	for i in $(DIRLIST); do [ -d $$i ] && (make -C $$i build); done

install: 
	for i in $(DIRLIST); do [ -d $$i ] && (make -C $$i install); done

clean:
	rm -rf files/SW2015SP21_IM_ohne_SN/*
	for i in $(DIRLIST); do [ -d $$i ] && (make -C $$i clean); done
