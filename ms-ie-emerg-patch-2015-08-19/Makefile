PACKAGE_NAME         = ms-ie-emerg-patch-2015-08-19
VERSION              = 1
DIRLIST		     =  ms-ie-kb3078071-lihas  ms-ie-kb3087985-lihas

all: download build install

download: 
	for i in $(DIRLIST); do [ -d $$i ] && (make -C $$i download); done

build: 
	for i in $(DIRLIST); do [ -d $$i ] && (make -C $$i build); done

install: 
	for i in $(DIRLIST); do [ -d $$i ] && (make -C $$i install); done

clean:
	for i in $(DIRLIST); do [ -d $$i ] && (make -C $$i clean); done
