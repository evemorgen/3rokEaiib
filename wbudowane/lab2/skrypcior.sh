st-util&
((echo "target remote localhost:4242\n\nload"; cat) | arm-none-eabi-gdb $1)&
pkill st-link
