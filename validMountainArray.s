# Valid Mountain Array
.data
Test1: .byte 1 2 3 4 5 6 5 4 3 2 1
Test1size: .byte 11
Test2: .byte 0 3 2 1
Test2size: .byte 4
Test3: .byte 2 3 5 5 6 
Test3size: .byte 5
str1: .string "The array is "
str2: .string "Is it the valid mountain array ?"
str3: .string "True"
str4: .string "False"
nextLine: .string "\n"
char1: .string " "
char2: .string "["
char3: .string "]"


.text
main:
    la s0,Test1
    lb s1,Test1size
    jal ra,valid
    jal ra,printResult
    
    la a0,nextLine
    li a7,4
    ecall
    
    la s0,Test2
    lb s1,Test2size
    jal ra,valid
    jal ra,printResult
    
    la a0,nextLine
    li a7,4
    ecall
    
    la s0,Test3
    lb s1,Test3size
    jal ra,valid
    jal ra,printResult
    
    li a7,10
    ecall
    
    
valid:
    li t0,3
    blt s1,t0,validFalse
    li t0,1
upLoop:
    addi t1,t0,-1
    add a1,t1,s0
    lb a1,0(a1)
    add a0,t0,s0
    lb a0,0(a0)
    bge a1,a0,endUpLoop
    addi t0,t0,1
    blt t0,s1,upLoop
endUpLoop:
    beq t0,s1,validFalse
    li t1,1
    beq t0,t1,validFalse
downLoop:
    addi t1,t0,-1
    add a1,t1,s0
    lb a1,0(a1)
    add a0,t0,s0
    lb a0,0(a0)
    bge a0,a1,finish
    addi t0,t0,1
    blt t0,s1,downLoop
finish:
    beq t0,s1,validTrue
validFalse:
    li a1,-1
    ret
validTrue:
    li a1,1
    ret
printResult:
    la a0,str1
    li a7,4
    ecall
    la a0,char2
    li a7,4
    ecall
    li t0,0
loop:
    add a2,t0,s0
    lb a0,0(a2)
    li a7,1
    ecall
    addi t0,t0,1
    la a0,char1
    li a7,4
    ecall
    blt t0,s1,loop
    la a0,char3
    li a7,4
    ecall
    la a0,nextLine
    li a7,4
    ecall
    la a0,str2
    li a7,4
    ecall
    la a0,nextLine
    li a7,4
    ecall
    li a2,1
    beq a1,a2,True
    la a0,str4
    li a7,4
    ecall
    ret
True:
    la a0,str3
    li a7,4
    ecall
    
    ret

