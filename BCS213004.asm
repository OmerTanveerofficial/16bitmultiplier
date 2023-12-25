[org 0x100]

[org 0x0100]
jmp start
    multiplicand dd 1300
    multi dw 500
    result dd 0

start: 
    mov ecx, 16
    mov edx, [multi]

check: 
    shr edx, 1
    jnc skip
          
    mov eax, [multiplicand]
    add [result], eax
    mov eax, [multiplicand + 4]
    adc [result + 4], eax

skip: 
    shl word [multiplicand], 1
    rcl word [multiplicand + 4], 1 
    dec ecx
    jnz check

    mov eax, 0x4c00
    int 0x21