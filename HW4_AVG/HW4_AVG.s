	AREA RESET , DATA , READONLY
    DCD 0x10008000
    DCD Reset_Handler

    AREA MYCODE , CODE , READONLY
ENTERY
Reset_Handler
   

    
    ldr r1,=GradeInROM          
    ldr r2,=UnitInROM          
	ldr r3,=AverageInRAM 

Myloop
    ldrsb r4 , [r1]
    ldrsb r5 , [r2] 
	
	mul r4,r5
	add r10,r4               ;r10 = sum
	add r9 , r5				 ;r9 = sum of unit
	add r1,#1
	add r2,#1
	add r0,#1
	
	cmp r0,#8
	beq Calculate_Avg
	
	b Myloop

Calculate_Avg
	
	sdiv r10,r9
	

loop
    b loop
GradeInROM DCB 20,20,20,20,15,15,13,17
UnitInROM DCB  1,1,3,3,3,3,3,2

    AREA MyData , DATA , READWRITE
    COMMON AverageInRAM , 12,4
    end