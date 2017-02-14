MCU=atmega328p
PROGRAMMER=usbtiny


all: hex size

hex: eek.hex

up: hex size
	avrdude -c $(PROGRAMMER) -p $(MCU) -U flash:w:eek.hex

size: eek.elf
	avr-size --mcu $(MCU) -C $<

clean:
	rm *.o
	rm *.elf
	rm *.hex

eek.hex: eek.elf
	avr-objcopy -j .text -j .data -O ihex $< $@

eek.elf: eek.o
	avr-ld -o $@ $<

eek.o: eek.S
	avr-as -mmcu=$(MCU) -o $@ $<

