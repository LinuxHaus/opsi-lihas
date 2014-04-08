all: clean build
clean:
	for i in *; do [ -d $$i ] && (make -C $$i clean); done
build:
	for i in *; do [ -d $$i ] && (make -C $$i); done
