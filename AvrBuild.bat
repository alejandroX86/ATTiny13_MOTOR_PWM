@ECHO OFF
"C:\Archivos de programa\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "D:\ATTiny13_MOTOR_PWM\labels.tmp" -fI -W+ie -C V2 -o "D:\ATTiny13_MOTOR_PWM\MOTO_PWM.hex" -d "D:\ATTiny13_MOTOR_PWM\MOTO_PWM.obj" -e "D:\ATTiny13_MOTOR_PWM\MOTO_PWM.eep" -m "D:\ATTiny13_MOTOR_PWM\MOTO_PWM.map" "D:\ATTiny13_MOTOR_PWM\MOTO_PWM.asm"
