
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
cd ESP8266_NONOS_SDK/examples/IoT_Demo
./runme-flasherase
./runme-flashme
```
