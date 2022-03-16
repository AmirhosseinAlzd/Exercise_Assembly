	AREA RESET , DATA , READONLY
    DCD 0x10008000
    DCD Reset_Handler

    AREA MYCODE , CODE , READONLY
ENTERY
Reset_Handler
	mov r10,0x00000706
    mov r0,#5-1
    ldr r1,=NumberInROM          ;r1 = pointer to ROM
    ldr r4,=NumberInRAM          ;;r4 = pointer to RAM

    ldr r2 , [r1]
    ;ldrsb r3 , [r1]      ;read first data feom flash sign
	add r4 , r10

TestNextByte
	ldr r3,[r1]
    str r3 , [r4]
    add r1,#1
    add r4 , #4
    subs r0,#1             ;counte 9>8>7>6>....
    bne TestNextByte

loop
    b loop
NumberInROM DCB 0X55,0X56,0X57,0X58 
    AREA MyData , DATA , READWRITE
    COMMON NumberInRAM , 12,4
    end