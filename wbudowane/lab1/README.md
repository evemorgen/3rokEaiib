

## Systemy wbudowane
#### lab1 - przygotowanie środowiska

Na zajęciach preferowane jest używanie Eclips'a ale mnie osobiście do siebie nie przekonał. Postanowiłem po staroświecku używać stałego zestawu czyli Vim + make

Przydatne linki na początek:
1. [Dobry tutorial dla win/mac według którego mi udało się wystartować](https://abboudscorner.wordpress.com/2014/10/05/set-up-a-barebones-stm32f4-development-environment-windows-mac/) <br>
2. [Datasheet zestawu którego używam](http://www.st.com/content/ccc/resource/technical/document/user_manual/70/fe/4a/3f/e7/e1/4f/7d/DM00039084.pdf/files/DM00039084.pdf/jcr:content/translations/en.DM00039084.pdf) <br>
3. [Repo z przygotowanym hello world i make'iem](https://github.com/TDAbboud/STM32F4_Templates) <br>

Skrypt którym udało mi się wszystko zainstalować:
```
brew tap nitsky/stm32
brew update
brew install arm-none-eabi-gcc

mkdir src && cd src
git clone git://github.com/texane/stlink.git
cd stlink
make

sudo mkdir /usr/local/opt/stlink
sudo cp build/Release/st-flash /usr/local/opt/stlink/
sudo cp build/Release/src/gdbserver/st-util /usr/local/opt/stlink/
sudo bash -c "echo /usr/local/opt/stlink >> /etc/paths"
```

Dla sprawdzenia czy wszystko zainstalowało się ok:
```
[~] arm-none-eabi-gcc --version

arm-none-eabi-gcc (GNU Tools for ARM Embedded Processors) 4.9.3 20150529 ...

# przed podłączeniem płytki
[~] st-util
st-util 1.3.1-4-g9d08810
2017-03-10T22:42:36 WARN src/usb.c: Couldnt find any ST-Link/V2 devices
# po podłączeniu płytki
[~] st-util
st-util 1.3.1-4-g9d08810
2017-03-10T22:43:31 INFO src/usb.c: -- exit_dfu_mode
2017-03-10T22:43:31 INFO src/common.c: Loading device parameters....
2017-03-10T22:43:31 INFO src/common.c: Device connected is: F4 device, id 0x10016413
2017-03-10T22:43:31 INFO src/common.c: SRAM size: 0x30000 bytes (192 KiB), Flash: 0x100000 bytes (1024 KiB) in pages of 16384 bytes
2017-03-10T22:43:31 INFO src/gdbserver/gdb-server.c: Chip ID is 00000413, Core ID is  2ba01477.
2017-03-10T22:43:31 INFO src/gdbserver/gdb-server.c: Listening at *:4242...
# LED na st-linku powinien być zielony :)
```

Czas na hello world: <br>
1. klonujemy repo z linka powyżej
2. budujemy hexa
```
cd STM32F4_Templates/Barebones_MacOSX

[Barebones_MacOSX] make
mkdir -p /Users/evemorgen/Desktop/STM32F4_Templates/Barebones_MacOSX/build
/Applications/Xcode.app/Contents/Developer/usr/bin/make -C lib FLOAT_TYPE=soft BINPATH= DEVICE_DEF=STM32F40_41xxx BASEDIR=/Users/evemorgen/Desktop/STM32F4_Templates/Barebones_MacOSX
/Applications/Xcode.app/Contents/Developer/usr/bin/make -C STM32F4xx_StdPeriph_Driver FLOAT_TYPE=soft BINPA ...

[Barebones_MacOSX] make flash
st-flash write build/blinky.bin 0x08000000
st-flash 1.3.1-4-g9d08810
...
2017-03-10T22:49:11 INFO src/common.c: Flash written and verified! jolly good!
```
3. Po restarcie czarnym guziorem,  czerwony led powinien zacząć blinkować.
I to by było na tyle jak na lab1
