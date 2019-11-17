data segment
    char db 0ah,0dh,'$'
data ends
code segment
    assume cs:code
    start: mov dl,0 ;用来统计
    input: mov ah,1
           int 21h
           cmp al,' '
           jz exit
           cmp al,'0'
           jb input
    c2:    cmp al,'9'
           ja input
           add dl,1
           jmp input

    exit:  mov bl,dl
           mov dl,offset data
           mov ah,2
           int 21h
           mov dl,bl
           add dl,30h
           mov ah,2
           int 21h
           mov ah,4ch
           int 21h
    code ends
    end start