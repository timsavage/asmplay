;=======================================================================
; MCU Specs
;=======================================================================

.equ RAMEND, 0x08FF	; End of SRAM


;=======================================================================
; Registers
;=======================================================================

.equ DDRD, 0x2A		; Port D Data Direction Register
.equ _DDRD, (DDRD-0x20)
.equ PORTD, 0x2B	; Port D Data Register
.equ _PORTD, (PORTD-0x20)

.equ MCUCR, 0x55	; MCU Control Register
.equ BODS, 6		; BOD Sleep
.equ BODSE, 5		; BOD Sleep Enable
.equ PUD, 4			; Pull-up Disable
.equ IVSEL, 1		; Interrupt Vector Select
.equ IVCE, 0		; Interrupt Vector Change Enable

.equ SPL, 0x5D		; Stack Pointer Register Low byte
.equ _SPL, (SPL-0x20)
.equ SPH, 0x5E		; Stack Pointer Register High byte
.equ _SPH, (SPH-0x20)

.equ TWBR, 0xB8		; TWI Bit Rate Register
.equ TWSR, 0xB9		; TWI Status Register
.equ TWAR, 0xBA		; TWI (Slave) Address Register
.equ TWDR, 0xBB		; TWI Data Register

.equ TWCR, 0xBC		; TWI Control Register
.equ TWINT, 7		; TWI Interupt flag
.equ TWEA, 6		; TWI Enable Acknowledge
.equ TWSTA, 5		; TWI START Condition
.equ TWSTO, 4		; TWI STOP Condition
.equ TWWC, 3		; TWI Write Collision Flag
.equ TWEN, 2		; TWI Enable
.equ TWIE, 0		; TWI Interrupt Enable


;=======================================================================
; Interrupt Vectors
;=======================================================================
.equ RESET_addr, 0x0000			; External Pin, Power-on Reset, Brown-out Reset and Watchdog System Reset
.equ INT0_addr, 0x0002			; External Interrupt Request 0
.equ INT1_addr, 0x0004			; External Interrupt Request 0
.equ PCINT0_addr, 0x0006		; Pin Change Interrupt Request 0
.equ PCINT1_addr, 0x0008		; Pin Change Interrupt Request 1
.equ PCINT2_addr, 0x000A		; Pin Change Interrupt Request 2
.equ WDT_addr, 0x000C			; Watchdog Time-out Interrupt
.equ TIMER2_COMPA_addr, 0x000E	; Timer/Counter2 Compare Match A
.equ TIMER2_COMPB_addr, 0x0010	; Timer/Coutner2 Compare Match B
.equ TIMER2_OVF_addr, 0x0012	; Timer/Counter2 Overflow
.equ TIMER1_CAPT_addr, 0x0014	; Timer/Counter1 Capture Event
.equ TIMER1_COMPA_addr, 0x0016	; Timer/Counter1 Compare Match A
.equ TIMER1_COMPB_addr, 0x0018	; Timer/Coutner1 Compare Match B
.equ TIMER1_OVF_addr, 0x001A	; Timer/Counter1 Overflow
.equ TIMER0_COMPA_addr, 0x001C  ; Timer/Counter0 Compare Match A
.equ TIMER0_COMPB_addr, 0x001E	; Timer/Coutner0 Compare Match B
.equ TIMER0_OVF_addr, 0x0020	; Timer/Counter0 Overflow
.equ SPI_STC_addr, 0x0022		; SPI Serial Transfer Complete
.equ USART_RX_addr, 0x0024		; USART Rx Complete
.equ USART_UDRE_addr, 0x0026	; USART Data Register Empty
.equ USART_TX_addr, 0x0028		; USART Tx Complete
.equ ADC_addr, 0x002A			; ADC Conversion Complete
.equ EE_READY_addr, 0x002C		; EEPROM Ready
.equ ANALOG_COMP_addr, 0x002E	; Analog Comparator
.equ TWI_addr, 0x0030			; 2-wire Serial Interface (I2C)
.equ SPM_READY_addr, 0x0032		; Store Program Memory Ready
