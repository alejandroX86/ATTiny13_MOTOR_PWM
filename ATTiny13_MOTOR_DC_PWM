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

entrada: 
 

 




 eer:

      sbic PINB,1
 
        rjmp eer
 
 
      ;   sei                   ; Interrupts allgemein aktivieren


   sbr r18,0
  
    
 
     
rt:  
   
   sbrc r18,0
  
     rjmp rt


       sei

loop:    

	ldi   R16,0b00100001
	out   ADMUX,R16    

 				            ;
        sbi   ADCSRA,ADSC      ; Start ADC conversion
lb_30:  sbic  ADCSRA,ADSC      ; while (ADCSRA & (1<<ADSC))
	rjmp  lb_30
	
	sei
	in    R16,ADCH         ; Read the result Ignore the last 2 bits in ADCL
        out   OCR0A,R16        ; OCR0A = R16

             
    	mov   R23,R16
     
       
  ;    sbrs r18,0

     
	 ldi   R16,0b10000011
 	out   TCCR0A,R16       ; Fast PWM Mode, Clear on OC0A
	ldi   R16,0b00000100
	out   TCCR0B,R16   
	 
	 
	 
;    rjmp loop             ; eine leere Endlosschleife

   
   
   
        rjmp entrada



 

int0_handler:
    


 


	
push temp1
in temp1,SREG



 
sbis PORTB,3
rjmp kh
sbic PORTB,3
rjmp sd

kh:
sbi PORTB,3  ; Write Port B

 rjmp  tempo


rjmp oo

sd:



cbi PORTB,3  ; Write Port B



 
   
	 ldi   R16,0b10000011
 	out   TCCR0A,R16       ; Fast PWM Mode, Clear on OC0A
	ldi   R16,0b00000100
	out   TCCR0B,R16   
	 
	 




	 
ser    r28
out   OCR0A,R28 


   ldi   R16,0b00000000
 out   TCCR0A,R16       ; Fast PWM Mode, Clear on OC0A
ldi   R16,0b00000000
out   TCCR0B,R16   

cli 

  
	ldi   R16,0b00010100   ; Disable Digital Input on PB2
	out   DIDR0,R16

  cbi PORTB,0



sbr r18,0


rcall RETARDO

 	ldi   R16,0b00010101  ; Disable Digital Input on PB2
	out   DIDR0,R16

 
 ldi temp, 0b00001001
        out DDRB, temp

 cbi PORTB,0
oo:

out SREG,temp1
pop temp1
	
	
	
         reti
 






 tempo:
	
    ldi   R16,0b10000011
 	out   TCCR0A,R16       ; Fast PWM Mode, Clear on OC0A
	ldi   R16,0b00000100
	out   TCCR0B,R16   
  
    clr r16
    out   OCR0A,R16  

	ldi   R16,0b00100010
	out   ADMUX,R16    




        sbi   ADCSRA,ADSC      ; Start ADC conversion
lb_330:  sbic  ADCSRA,ADSC      ; while (ADCSRA & (1<<ADSC))
	

	rjmp  lb_330



	in    R22,ADCH         ; Read the result Ignore the last 2 bits in ADCL
                ; OCR0A = R16
     sei
                ; Turn off LED
	mov   R19,R22

   cbr r18,0
 
  ; rcall PWM




delay0: ldi   R20,125          ; R20 = 25
delay1: ldi   R21,255          ; R21 = 255
delay2: dec   R21              ; Decrease R21
	brne  delay2           ; if (R20 != 0) goto delay2 label
      
    

  rcall PWM
	    dec   R20              ; Decrease R20
        brne  delay1           ; if (R20 != 0) goto delay1 label
	dec   R19              ; Decrease R19
	brne  delay0           ; if (R19 != 0) goto delay0 label
	   
	   
clr  r16
    out   OCR0A,R16  


	                   ; Return to the caller


    ldi   R16,0b00000000
 	out   TCCR0A,R16       ; Fast PWM Mode, Clear on OC0A
	ldi   R16,0b00000000
	out   TCCR0B,R16 



     cbi PORTB,3	

    cbi PORTB,0    

 ;   ser r16
 ;   out   OCR0A,R16  

    
ret





PWM:

	ldi   R16,0b00100001
	out   ADMUX,R16    

 				            ;
        sbi   ADCSRA,ADSC      ; Start ADC conversion
lb_130:  sbic  ADCSRA,ADSC      ; while (ADCSRA & (1<<ADSC))
	rjmp  lb_130
	
	sei
	    in    R16,ADCH         ; Read the result Ignore the last 2 bits in ADCL
        out   OCR0A,R16        ; OCR0A = R16

             
	mov   R23,R16
    

	
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
      



delay_func:

delay20: ldi   R24,25           ; R20 = 25
delay21: ldi   R25,255          ; R21 = 255
delay22: dec   R25              ; Decrease R21
	brne  delay22           ; if (R20 != 0) goto delay2 label
        dec   R24              ; Decrease R20
        brne  delay21           ; if (R20 != 0) goto delay1 label
	dec   R23              ; Decrease R19
	brne  delay20           ; if (R19 != 0) goto delay0 label
	ret                    ; Return to the caller



