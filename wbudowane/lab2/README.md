# Lab 2.

Jednak zostałem zmuszony do używania eclipsa, powieważ na kolosie będzie oceniana znajomość guziczków z eclipsa. <br>

Minimalny projekt znajduje się w folderze poniżej. <br>

## Jak wrzucać to na płytkę:
1. ```st-util&```
2. ```arm-none-eabi-gdb```
3. ```target remote localhost:4242```
4. ```load uri/to/your/elf```
5. done

## Szlag mnie trafiał że musiałem to robić w kółko, powstał skrypcior:
```
st-util&
((echo "target remote localhost:4242\n\nload"; cat) | arm-none-eabi-gdb $1)&
pkill st-link
```
Usage
```./skrypcior.sh uri/to/your/elf
./skrypcior.sh ./MinimalStm32f429/Debug/MinimalStm32f429.elf
```
