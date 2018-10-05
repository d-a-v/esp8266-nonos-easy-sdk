
# nonos-easy-sdk

The purpose of this project is to provide an all-in-one build and test
environment for the espressif's esp8266 esp-nonos-sdk firmware, especially
with its v3.

The final goal is simply to be able to blink the internal led, and display
"Hello world" on the serial port (115200/8n1).

That, in the most easy way by just setting the led gpio, the flash size, and
the 'make flash' command.

* The compiler is built from the esp-open-sdk project
* The flasher is espressif's official esptool.py
* The firmware is esp-nonos-sdk v3

# Current status

*non-OTA mode (no boot) only*

*builds nonos-sdk examples only*

# use it

clone this repository, then type
```
make
```

Everything should download, build (including all SDK examples).

In every example directory, flash scripts will be provided.
Use the generated `tools-env.sh`:

```
make
. tools-env.sh
cd builds/IoT_Demo
./runme-flasherase
./runme-flashme
```

build directory:
```
 35136 Oct  5 21:56 0x0
  4096 Oct  5 21:56 0x003FB000
   128 Oct  5 21:56 0x003FC000
  4096 Oct  5 21:56 0x003FE000
232780 Oct  5 21:56 0x10000
469540 Oct  5 21:56 IoT_Demo.elf
   189 Oct  5 21:56 map.txt
    23 Oct  5 21:56 runme-flasherase
   101 Oct  5 21:56 runme-flashme
```

map.txt:
```
blank: 0x003FB000 & 0x003FE000
esp_init_data_default_v08.bin: 0x003FC000
eagle.flash.bin: 0x0
eagle.irom0text.bin: 0x10000
according to 4.1.2 in 2a-esp8266-sdk_getting_started_guide_en.pdf
```
