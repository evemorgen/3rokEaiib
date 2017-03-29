#include <stdio.h>
#include <stdlib.h>
#include "diag/Trace.h"

#include "Timer.h"
#include "BlinkLed.h"

#define BLINK_PORT_NUMBER         (6)
#define BLINK_PIN_NUMBER_GREEN    (13)
#define BLINK_PIN_NUMBER_RED      (14)
#define BLINK_ACTIVE_LOW          (false)

BlinkLed blinkLeds[2] =
  {
    { BLINK_PORT_NUMBER, BLINK_PIN_NUMBER_GREEN, BLINK_ACTIVE_LOW },
    { BLINK_PORT_NUMBER, BLINK_PIN_NUMBER_RED, BLINK_ACTIVE_LOW },
  };

//BlinkLed green_led = {BLINK_PORT_NUMBER, BLINK_PIN_NUMBER_GREEN, BLINK_ACTIVE_LOW};
BlinkLed green_led = {BLINK_PORT_NUMBER, BLINK_PIN_NUMBER_RED, BLINK_ACTIVE_LOW};

int main(int argc, char* argv[])
{
  Timer timer;
  timer.start ();

  green_led.powerUp();
  while(1)
  {
	  green_led.turnOn();
	  timer.sleep (Timer::FREQUENCY_HZ);
	  green_led.turnOff();
	  timer.sleep (Timer::FREQUENCY_HZ);
  }
  return 0;
}
