	AREA RESET , DATA , READONLY
    DCD 0x10008000
    DCD Reset_Handler
	

    AREA MYCODE , CODE , READONLY
ENTERY
Reset_Handler
	
	mov r1 , 0
	ldr r2,=NumberInROM          ;r2 = pointer to ROM
    ldr r7,=NumberInRAM          ;;r7 = pointer to RAM
	
	
TestNextByte
    ldrb r8 ,[r2] ; read first data from flash
    cmp r1,#10      
    beq   RRRRRRR
    
    str r8,[r7]   ;write data to ram
   
	add r2,#1      ;increment pointer
	add r1,#1 
    add r7,#4      ;add RAM pointer with 4
	
    b TestNextByte
	
	
RRRRRRR	
	
	
    mov r0 , 0
	mov r1 , 1
	ldr r2,=NumberInRAM          ;r2 = pointer to RAM
    ldr r3,=NumberInRAM
    ;ldr r7,=NumberInRAM          ;;r4 = pointer to RAM
	
	ldrb r4 , [r2]

Sort_Loop_1
	add r3,#4
    
    ldrb r5 , [r3]      ;read first data feom flash sign
	
	cmp r5,r4
	bge NoExchange
	
	mov r6 , r4
	mov r4 , r5
	mov r5 , r6
	str r5 , [r3]
	str r4 , [r2]
	
NoExchange

	add r1,#1          ;j++
	cmp r1,#10
	beq Sort_Loop_2
	b Sort_Loop_1
	
Sort_Loop_2
	add r2 , #4
	ldrb r4 , [r2]
	add r0,#1        ; i++
	
	mov r1,r0           ; j <--- i
	add r1,#1
	mov r3,r2
	
	cmp r0,#9
	beq loop
	
	b Sort_Loop_1
	
	
	

loop
    b loop
NumberInROM DCB -3,7,-44,44,3,9,1,0,2,21
    AREA MyData , DATA , READWRITE
    COMMON NumberInRAM , 12,4
    end