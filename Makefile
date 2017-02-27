##############################################################################
# DDS Funktion Genorator - DDS Gen Firmware
#
# Copyright 2017 Tim Savage
##############################################################################

##############################################################################
# Setup

PROJECT=ddsGen

MCU=atmega328p
PROGRAMMER=usbtiny

INCLUDES=./include
SRCS=dds.S

LFUSE=0xf7
HFUSE=0xdf

ASFLAGS=-mmcu=$(MCU) -Wa,-I$(INCLUDES) -Wall
LDFLAGS=


##############################################################################
# Vars

HEX_FILE=$(PROJECT).hex
ELF_FILE=$(PROJECT).elf

OBJS=$(SRCS:.S=.o)


##############################################################################
# Executables

CC=avr-gcc
OBJCOPY=avr-objcopy
OBJDUMP=avr-objdump
SIZE=avr-size
AVRDUDE=avrdude -c $(PROGRAMMER) -p $(MCU)
REMOVE=rm -f


##############################################################################
# Rules

all: hex size

hex: $(HEX_FILE)

up: all
	$(AVRDUDE) -U flash:w:$(HEX_FILE)

fuse:
	$(AVRDUDE) -U lfuse:w:$(LFUSE):m -U hfuse:w:$(HFUSE):m

size: $(ELF_FILE)
	$(SIZE) --mcu $(MCU) -C $<

dump: $(ELF_FILE)
	$(OBJDUMP) -S $< | less

clean:
	$(REMOVE) *.o
	$(REMOVE) *.elf
	$(REMOVE) *.hex

$(HEX_FILE): $(ELF_FILE)
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

$(ELF_FILE): $(OBJS)
	$(CC) $(LDFLAGS) $< -o $@

$(OBJS): $(SRCS)
	$(CC) $(ASFLAGS) -c $< -o $@
	
