DDS Generator
#############

This is a quick proof of concept DDS (Direct Digital Synthesis) signal generator intended to be connected to an R-2R ladder.

The code is implemented entirely in ASM (using GCC). Code is written for an ATMega328p, output to PORTD.

Includes wave tables for Sine, Sawtooth, Reverse Sawtooth, Triangle and Square waves.

Configure the Make file to specify your programmer (default is *usbtiny*). 

Code is currently very much proof of concept, is this far is just loading the wave table into SRAM and not actually outputting a waveform.
