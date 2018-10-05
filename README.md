
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
