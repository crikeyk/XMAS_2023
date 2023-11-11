   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 3 void clock_init(void) {
  44                     	switch	.text
  45  0000               _clock_init:
  49                     ; 4     CLK->CKDIVR = 0; //Ensure the clocks are running at full speed
  51  0000 725f50c6      	clr	20678
  52                     ; 5 }
  55  0004 81            	ret
  68                     	xdef	_clock_init
  87                     	end
