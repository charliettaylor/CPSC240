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
;Program information
;  Program name: 
;  Programming languages: Main function in C++;  function in X86-64
;  Date program began: 
;  Date of last update: 
;  Comments reorganized: 
;  Files in the program: 
;
;Purpose
;  
;
;Names
;
;This file
;  File name: 
;  Language: X86-64
;  Syntax: Intel
;  Max page width: 132 columns.  Well, we try to keep the width less than 132.
;  Optimal print specification: Landscape, 7-point font, monospace, 132 columns, 8½x11 paper
;  Assemble: 
;  Classification:
;
;References:
;  Jorgensen: X86-64 Assembly Language Programming with Ubuntu (free download)
;
;Prototype of this function in C++: 
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
extern isFloat
extern atof
global gravity

segment .data
   intro db "Welcome to Gravitational Attraction maintained by Charlie Taylor", 10, 0
   input_prompt db "Please enter the height you are dropping from: ", 10, 0
   time_prompt db "The object you drop from that height will reach the ground after %lf seconds", 10, 0
   exit db "Thanks for using this, the time in seconds will be returned to the driver", 10, 0

   negative_input db "Height entered less than 0, now exiting...", 10, 0
   bad_input_msg db "Bad input, enter positive decimal float value", 10, 0

   string_input db "%s", 0
   g_constant dq 0x9.CCCCCCCCCCCCCCCCCCCD
   ; apparently 0x4023 9999 9999 999A works too?


segment .bss
   height: resq 1 ; reserve a qword for input
   keyInput resb 100

segment .text

gravity:
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

   ; welcome message
   ;push qword 0
   mov rax, 0
   mov rdi, intro ;put intro string in first param
   call printf ;call func with given param

   ;push qword 0
   mov rax, 0
   mov rdi, input_prompt ;put intro string in first param
   call printf ;call func with given param

   pop rax

   ; scanf for height
   push qword 0
   mov rax, 0
   mov rdi, string_input
   mov rsi, keyInput
   call scanf

   ; validate input and move
   mov rax, 0
   mov rdi, keyInput
   call isFloat
   mov r14, rax ; r14 hold bool result of isFloat

   ; xmm 13 = 0
   mov rax, 0
   cvtsi2sd xmm13, rax

   ; keep input or exit
   cmp r14, 0 ; 0 = fail
   je bad_input

   ; convert string to double
   mov rax, 0
   mov rdi, keyInput
   call atof
   movsd xmm15, xmm0 ; input moved to xmm15

   ; check if input is negative
   ucomisd xmm13, xmm15
   ja negative

   ; xmm14 = 2
   mov rax, 2
   cvtsi2sd xmm14, rax
   ; calculate time to fall
   mulsd xmm15, xmm14 ; 2h
   divsd xmm15, [g_constant] ; 15 = 2h/g
   sqrtsd xmm15, xmm15 ; sqrt(2h/g)
   movsd xmm0, xmm15 ; return time

   jmp end

   negative:
   mov rax, 0
   mov rdi, negative_input ;put intro string in first param
   call printf ;call func with given param
   movsd xmm0, xmm13
   jmp end

   bad_input:
   mov rax, 0
   mov rdi, bad_input_msg ;put intro string in first param
   call printf ;call func with given param
   movsd xmm0, xmm13

   end:
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
