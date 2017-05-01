#include <stdio.h>
#include <stdlib.h>
#include "diag/Trace.h"
#include "stm32f4xx_hal.h"
#include "Timer.h"


void init_button(void)
{
	__GPIOA_CLK_ENABLE();
	trace_printf("PA0 clock turned on\n");
	GPIO_InitTypeDef GPIO_InitStruct;
	GPIO_InitStruct.Pin = GPIO_PIN_0;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_MEDIUM;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
	trace_printf("PA0 GPIO PIN init complete\n");
	trace_printf("Waiting for button to be pressed\n");
}


void init_pc2(void)
{
	__GPIOC_CLK_ENABLE();
	GPIO_InitTypeDef GPIO_InitStruct;
	GPIO_InitStruct.Pin = GPIO_PIN_2;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_HIGH;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);
}

void PC2up(void) {
  HAL_GPIO_WritePin(GPIOC, GPIO_PIN_2, GPIO_PIN_SET);
}

void PC2down(void) {
  HAL_GPIO_WritePin(GPIOC, GPIO_PIN_2, GPIO_PIN_RESET);
}

int main(int argc, char* argv[])
{
  trace_printf("Hello from stm32f429\n");
  init_button();
  init_pc2();
  Timer timer;
  timer.start();
  trace_printf("My freq is %d", timer.FREQUENCY_HZ);


  int i = 0;
  while (1) {

	  PC2up();
	  timer.sleep(5);
	  PC2down();
	  timer.sleep(5);

	  //to rozwali okres 10ms ale czego się nie robi dla pushbuttonów
      if (HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_0) == GPIO_PIN_SET)
      {
    	  i++;
    	  trace_printf("Button pressed for %d time.\n", i);
      }
  }

  return 0;
}
