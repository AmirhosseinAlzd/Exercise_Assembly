	AREA RESET , DATA , READONLY
    DCD 0x10008000
    DCD Reset_Handler

    AREA MYCODE , CODE , READONLY
ENTERY
Reset_Handler

    ldr r1,=Matrix_1
	ldr r7,=Matrix_1 	
    ldr r2,=Matrix_2
	ldr r8,=Matrix_2	
	ldr r3,=Matrix_3
	
	
first_loop
	
	ldrsb r4 , [r1]
    ldrsb r5 , [r2] 
	mul r4,r5
	add r10,r4  	
	
	add r1,#1
	add r2,#3
	
	add r0 ,#1
	cmp r0,#3
	beq SETTING_1
	b first_loop
 
 
SETTING_1
	str r10,[r3]
	mov r1,r7
	add r8,#1
	mov r2,r8
	add r3,#4
	add r9 ,1
	mov r0,#0
	mov r10,#0
	cmp r9 , #3
	bne first_loop


SETTING_2
	add r11,#1
	add r7,#3
	cmp r11 , #3
	beq loop
	mov r9,#0
	sub r8,#3
	mov r1,r7
	mov r2,r8
	b first_loop


loop
    b loop
Matrix_1 DCB 1,2,3,4,5,6,7,8,9
Matrix_2 DCB 1,2,3,4,5,6,7,8,9

    AREA MyData , DATA , READWRITE
    COMMON Matrix_3 , 12,4
    end