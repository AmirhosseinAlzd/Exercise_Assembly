	AREA RESET ,DATA,READONLY
    DCD 0x10008000    ;
    DCD Reset_Handler ; 
		
    AREA MYCODE , CODE , READONLY
		
ENTRY
Reset_Handler
	;    mov r0,#8
	ldr r1, =MyNameInROM
	ldr r4, =MyNameInRAM


TestNextByte
    ldrb r2 ,[r1] ; read first data from flash
    cmp r2,#0      
    beq   loop
    add r1,#1      ;increment pointer
	cmp r2,#32     ;for check blank char
	beq Noexchange
	subs r2,#32    ; convert a --> A  
Noexchange
    strb r2,[r4]   ;write data to ram
   

    add r4,#1      ;add RAM pointer with 1
    b TestNextByte
loop
    b loop
MyNameInROM DCB "amirhossein alizadeh",0
      AREA MYData , DATA , READWRITE
      COMMON MyNameInRAM ,12 ,4
      end