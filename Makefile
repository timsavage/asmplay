MCU=atmega328p
PROGRAMMER=usbtiny


all: hex size

hex: dds.hex

up: hex size
	avrdude -c $(PROGRAMMER) -p $(MCU) -U flash:w:dds.hex

fuse:
	avrdude -c $(PROGRAMMER) -p $(MCU) -U lfuse:w:0xf7:m -U hfuse:w:0xdf:m

size: dds.elf
	avr-size --mcu $(MCU) -C $<

clean:
	rm -f *.o
	rm -f *.elf
	rm -f *.hex

dds.hex: dds.elf
	avr-objcopy -j .text -j .data -O ihex $< $@

dds.elf: dds.o
	avr-ld -o $@ $<

dds.o: dds.S
	avr-as -mmcu=$(MCU) -o $@ $<

