;****************************************************************************************************************************
;Program name: ""
;****************************************************************************************************************************
;
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Charlie Taylor
;  Author email: ctaylor27@csu.fullerton.edu
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;
;
;===== Begin code area ========================================================================================================

;Assembler directives
base_number equ 10
ascii_zero equ 48
null equ 0
minus equ '-'

extern printf
extern scanf

global get_values

segment .data
    input_prompt db "Please enter the value of your properties followed by enter, then at the end press Ctrl+D:", 10, 0

    string_input db "%s", 0
    float_input db "%lf", 0

segment .text

get_values:
push rbp
mov  rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

push qword 0

mov r15, rdi ; grab first parameter (array)
mov r14, rsi ; grab second parameter (size)

; output input prompt
push qword 0
mov rax, 0
mov rdi, input_prompt
call printf
pop rax

; make r13 the loop counter
mov r13, 0

loop:
    cmp r14, r13
    je finished

    mov rax, 0
    mov rdi, float_input
    push qword 0
    mov rsi, rsp
    call scanf

    cdqe
    cmp rax, -1
    pop r12
    je finished

    mov [r15 + 8 * r13], r12
    inc r13
    jmp loop
finished:

pop rax
dec r13
mov rax, r13


popf ; Restore rflags
pop rbx
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rcx
pop rdx
pop rsi
pop rdi
pop rbp

ret