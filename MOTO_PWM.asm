.include "tn13def.inc"
 
.def temp = r16
.def temp1 =r17 


.org 0x000
         rjmp main            ; Reset Handler
.org INT0addr
         rjmp int0_handler    ; IRQ0 Handler
 
 
 
main:                         ; hier beginnt das Hauptprogramm
 
         ldi temp, LOW(RAMEND)
         out SPL, temp
        
 
 
         ldi temp, 0b00001001
         out DDRB, temp
 
        cbi PORTB,0


         ldi temp, (1<<ISC01)  ; INT0 und INT1 auf fallende Flanke konfigurieren
         out MCUCR, temp
 
         ldi temp, (1<<INT0)  ; INT0 und INT1 aktivieren
         out GIMSK, temp
 
 
        
         ldi temp, (1<<INTF0)  ; INT0 und INT1 aktivieren
         out GIFR, temp
 
    






    ldi   R16,0b10000110
	out   ADCSRA,R16       ; Turn On the ADC, with prescale 64
	ldi   R16,0b00000000
	out   ADCSRB,R16       ; Free running mode
	ldi   R16,0b00100010
	out   ADMUX,R16        ; Internal Reference 1.1 Volt,Left Adjust, Channel: PB2 (ADC1)
	ldi   R16,0b00010100   ; Disable Digital Input on PB2
	out   DIDR0,R16
    sei



 //	 ldi   R16,0b10000011
 //	out   TCCR0A,R16       ; Fast PWM Mode, Clear on OC0A
//	ldi   R16,0b0000010
//	out   TCCR0B,R16  



prueba:

	ldi   R16,0b00100001
	out   ADMUX,R16    

 				            ;
        sbi   ADCSRA,ADSC      ; Start ADC conversion
lb_1302:  sbic  ADCSRA,ADSC      ; while (ADCSRA & (1<<ADSC))
	rjmp  lb_1302
	
	sei
	    in    R16,ADCH         ; Read the result Ignore the last 2 bits in ADCL
        out   OCR0A,R16  




sbis PINB,4
rjmp kh14
sbic PINB,4
rjmp sd14


kh14:


 	 ldi   R16,0b10000011
 	out   TCCR0A,R16       ; Fast PWM Mode, Clear on OC0A
	ldi   R16,0b00000011
	out   TCCR0B,R16   

rjmp prueba


sd14:

  
    ldi   R16,0b00000000
 	out   TCCR0A,R16       ; Fast PWM Mode, Clear on OC0A
	ldi   R16,0b00000000
	out   TCCR0B,R16 

  
  
     rjmp prueba













delay:

delay20: ldi   R24,5           ; R20 = 25
delay21: ldi   R25,15          ; R21 = 255
delay22: dec   R25              ; Decrease R21
	brne  delay22           ; if (R20 != 0) goto delay2 label
        dec   R24              ; Decrease R20
        brne  delay21           ; if (R20 != 0) goto delay1 label
	dec   R23              ; Decrease R19
	brne  delay20           ; if (R19 != 0) goto delay0 label
	ret             



RETARDO:


NOP 
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP 
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP

NOP 
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP 
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP

RET
      







int0_handler:

push temp1
in temp1,SREG


rcall delay
 
sbis PORTB,3
rjmp kh1
sbic PORTB,3
rjmp sd1

kh1:
sbi PORTB,3  ; Write Port B

 
 
 	 ldi   R16,0b10000011
 	out   TCCR0A,R16       ; Fast PWM Mode, Clear on OC0A
	ldi   R16,0b00000011
	out   TCCR0B,R16   
 
 
 ;rcall  tempo


rjmp oo1

sd1:



cbi PORTB,3 




clr  r16
    out   OCR0A,R16  


	                   ; Return to the caller


    ldi   R16,0b00000000
 	out   TCCR0A,R16       ; Fast PWM Mode, Clear on OC0A
	ldi   R16,0b00000000
	out   TCCR0B,R16 






oo1:
out SREG,temp1
pop temp1

reti
