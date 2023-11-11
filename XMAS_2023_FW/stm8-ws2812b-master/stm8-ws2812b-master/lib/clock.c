#include <clock.h>

void clock_init(void) {
    CLK->CKDIVR = 0; //Ensure the clocks are running at full speed
}