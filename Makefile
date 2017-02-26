#######################################
# Setup

MCU=atmega328p
PROGRAMMER=usbtiny

PROJECT=dds
SRC=dds.S

ASFLAGS=-mmcu=$(MCU) -I ./include
LDFLAGS=

#######################################
# Vars

OUT_ELF=$(PROJECT).elf
OUT_HEX=$(PROJECT).hex
OBJS=$(SRC:.S=.o)

#######################################
# Rules

all: hex size

hex: $(OUT_HEX)

up: hex size
	avrdude -c $(PROGRAMMER) -p $(MCU) -U flash:w:$(OUT_HEX)

fuse:
	avrdude -c $(PROGRAMMER) -p $(MCU) -U lfuse:w:0xf7:m -U hfuse:w:0xdf:m

size: $(OUT_ELF)
	avr-size --mcu $(MCU) -C $<

clean:
	rm -f *.o
	rm -f *.elf
	rm -f *.hex

$(OUT_HEX): $(OUT_ELF)
	avr-objcopy -j .text -j .data -O ihex $< $@

$(OUT_ELF): $(OBJS)
	avr-ld $(LDFLAGS) -o $@ $<

$(OBJS): $(SRC)
	avr-as $(ASFLAGS) -o $@ $<

