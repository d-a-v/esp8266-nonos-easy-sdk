
# this is the first version, only for 4MBytes chips

# intentionally with a NOT-capital M(akefile)
# because of SDK recursion

all: submodules gcc doc env examples

submodules: ESP8266_NONOS_SDK/License esp-open-sdk/README.md esptool/LICENSE

ESP8266_NONOS_SDK/License esp-open-sdk/README.md esptool/LICENSE:
	git submodule update --init --recursive

gcc: esp-open-sdk/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc

esp-open-sdk/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc:
	$(MAKE) -C esp-open-sdk

env:
	@echo "PATH=$$(pwd)/esp-open-sdk/xtensa-lx106-elf/bin:$$(pwd)/esptool:\$${PATH}; export PATH;" > tools-env.sh

clean examples:
	$(MAKE) -f makefile.examples $@
	@echo "GENERATED:"
	@ls -l builds/*/runme-flashme

doc:
	[ -r 2a-esp8266-sdk_getting_started_guide_en.pdf ] || wget https://www.espressif.com/sites/default/files/documentation/2a-esp8266-sdk_getting_started_guide_en.pdf
