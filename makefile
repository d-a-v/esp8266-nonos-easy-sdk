
# this is the first version, only for 4MBytes chips

all: submodules gcc env examples

submodules: ESP8266_NONOS_SDK/License esp-open-sdk/README.md esptool/LICENSE

ESP8266_NONOS_SDK/License esp-open-sdk/README.md esptool/LICENSE:
	git submodule update --init --recursive

gcc: esp-open-sdk/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc

esp-open-sdk/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc:
	$(MAKE) -C esp-open-sdk

env:
	#@cd examples; for i in Makefile lib driver_lib/driver driver_lib/include bin; do ln -sf ../ESP8266_NONOS_SDK/$$i .; done
	@echo "PATH=$$(pwd)/esp-open-sdk/xtensa-lx106-elf/bin:$(pwd)/esptool:\$${PATH}; export PATH" > tools-env.sh

clean examples:
	$(MAKE) -f makefile.examples-nonboot $@
	@echo "GENERATED:"
	@ls -l ESP8266_NONOS_SDK/examples/*/runme*
