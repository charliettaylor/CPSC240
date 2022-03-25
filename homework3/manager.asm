;****************************************************************************************************************************
;Program name: "Property Values"
;****************************************************************************************************************************
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Charlie Taylor
;  Author email: ctaylor27@csu.fullerton.edu
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;===== Begin code area ========================================================================================================

;Assembler directives
base_number equ 10
ascii_zero equ 48
null equ 0
minus equ '-'

extern printf
extern scanf
extern get_values
extern sum_values
extern show_values

global manager

segment .data
    intro db "Welcome to the Orange County Property Assessment Office", 10, 0
    nums_output db "The numbers you entered are:", 10, 0
    sum_output db "The sum of assessed values is %lf", 10, 0
    mean_output db "The mean of assessed values is %lf", 10, 0
    exit db "Thanks for using this, the sum will be returned to the driver", 10, 0

    negative_input db "Height entered less than 0, now exiting...", 10, 0
    bad_input_msg db "Bad input, enter positive decimal float value", 10, 0

    string_input db "%s", 0
    float_input db "%lf", 0


segment .bss                            ;Declare pointers to un-initialized space in this segment.
   array resq 10

;==============================================================================================================================
;===== Begin the executable code here.
;==============================================================================================================================
segment .text                           ;Place executable instructions in this segment.

manager:
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

; output welcome message
push qword 0
mov rax, 0
mov rdi, intro
call printf
pop rax

; Fill the array using the fill module
push qword 0
mov rax, 0
mov rdi, array ; array passed in as first param
mov rsi, 10         ; array size passed in as second param
call get_values
mov r15, rax
pop rax

; Print numbers entered
push qword 0
mov rax, 0
mov rdi, nums_output
mov rsi, r15
call show_values
pop rax

; Sum the array
push qword 0
mov rax, 0
mov rdi, array
mov rsi, 6
call sum_values
movsd xmm15, xmm0
pop rax

; Print sum
push qword 0
mov rax, 1
mov rdi, sum_output
movsd xmm0, xmm15 ; return sum
call printf
pop rax

; The sum will be returned to the caller module
push qword 0
mov rax, 0
mov rdi, exit
call printf
pop rax

pop rax
movsd xmm0, xmm15

finished:
; Restore rflags
popf
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