WGET_COMMON_OPTIONS  = -q -N

PACKAGE_NAME         = solidworks-2014
VERSION              = 1.0
DIRLIST              = solidworks-edrawings-lihas  solidworks-german-lihas  solidworks-std-ger-lihas solidworks-basis-lihas  solidworks-explorer-lihas   solidworks-prereq-lihas  solidworks-vstudioaddins-lihas


all: checkpresence unzip prime build install

checkpresence: md5sums.txt files/SW2014_SP4_x64_IM_ohne_SN.zip
	md5deep -r -n -l -X md5sums.txt files/*

unzip:	files/SW2014_SP4_x64_IM_ohne_SN.zip
	unzip -o -d files files/SW2014_SP4_x64_IM_ohne_SN.zip

prime:
	mkdir -p solidworks-basis-lihas/CLIENT_DATA/files solidworks-edrawings-lihas/CLIENT_DATA/files solidworks-explorer-lihas/CLIENT_DATA/files solidworks-german-lihas/CLIENT_DATA/files solidworks-vstudioaddins-lihas/CLIENT_DATA/files
	cp -alf files/SW2014_SP4_x64_IM_ohne_SN/64bit/SolidWorks/* solidworks-basis-lihas/CLIENT_DATA/files/
	cp -alf files/SW2014_SP4_x64_IM_ohne_SN/64bit/eDrawings/* solidworks-edrawings-lihas/CLIENT_DATA/files/
	cp -alf files/SW2014_SP4_x64_IM_ohne_SN/64bit/SolidWorks\ Explorer/* solidworks-explorer-lihas/CLIENT_DATA/files/
	cp -alf files/SW2014_SP4_x64_IM_ohne_SN/64bit/SolidWorks\ German/* solidworks-german-lihas/CLIENT_DATA/files/
	cp -alf files/SW2014_SP4_x64_IM_ohne_SN/64bit/Microsoft_VSTA/vsta_aide.msi solidworks-vstudioaddins-lihas/CLIENT_DATA/files/vsta_aide.msi

build: 
	for i in $(DIRLIST); do [ -d $$i ] && (make -C $$i build); done

install: 
	for i in $(DIRLIST); do [ -d $$i ] && (make -C $$i install); done

clean:
	rm -rf files/SW2014_SP4_x64_IM_ohne_SN/*
	for i in $(DIRLIST); do [ -d $$i ] && (make -C $$i clean); done
