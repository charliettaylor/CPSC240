;****************************************************************************************************************************
;Program name: "Triangles"
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
;  Date program began: 1/27/2022
;  Date of last update: 1/27/2022
;  Comments reorganized: 1/27/2022
;  Files in the program: triangles.asm, triangles-main.cpp, run.sh
;
;Purpose
;  The purpose of the program is to compute the area of a triangle given input from the user.
;
;This file
;  File name: triangles.asm
;  Language: X86-64
;  Syntax: Intel
;  Max page width: 132 columns.  Well, we try to keep the width less than 132.
;  Optimal print specification: Landscape, 7-point font, monospace, 132 columns, 8½x11 paper
;  Assemble: nasm -f elf64 -o triangles.o triangles.asm
;  Classification: Library
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
base_number equ 10                      ;10 base of the decimal number system
ascii_zero equ 48                       ;48 is the ascii value of '0'
null equ 0
minus equ '-'
INPUT_LEN equ 64


extern printf                           ;External C++ function for writing to standard output device
extern scanf                            ;External C++ function for reading from the standard input device
extern sin
extern cos
global triangles

segment .data                           ;Place initialized data here

intro db "Welcome to Amazing Triangles programmed by Charlie Taylor on January 30, 2022", 10, 0

; prompts
name_prompt db "Please enter your name: ", 10, 0
entry_prompt db "Good morning %s, please enter the length of side 1, length of side 2, and size (degrees) of the included angle between them as real float numbers. Separate the numbers by white space, and be sure to press <enter> after the last inputted number.", 0

; outputs
display_input db "Thank you. You entered %lf %lf %lf", 10, 0
result_out db "The area of your triangle is %lf square units and the perimeter is %lf linear units", 10, 0
return_value db "The driver received this number %lf and will simply keep it.", 10, 0
bye_out db "An integer zero will now be sent to the operating system. Have a good day. Bye", 0

; format and calculations
form3 db "%lf %lf %lf", 0
string_format db "%s", 0
pi dq 0x400921F854442D18


segment .bss
   user_name: resb INPUT_LEN
   perimeter: resq 1 ; resq = reserve n qwords
   area: resq 1

segment .text

triangles:
   push rbp
   mov rbp, rsp
   push rdi
   push rsi
   push rdx
   push rcx
   push r8
   push r9
   push r10
   push r11
   push r12
   push r13
   push r14
   push r15
   push rbx
   pushf

   push qword 0
   
   ; welcome message
   mov rax, 0
   mov rdi, intro ;put intro string in first param
   call printf ;call func with given param

   ;output name prompt
   mov rax, 0
   mov rdi, name_prompt
   call printf

   ; get name
   push qword 0
   mov rax, 0
   mov rdi, string_format
   mov rsi, user_name
   call scanf

   ;output 3 entry prompt
   mov rax, 0
   mov rdi, entry_prompt
   mov rsi, user_name
   call printf

   pop rax

   ; scanf for numbers
   push qword -1
   push qword -2
   push qword -3
   mov rax, 0
   mov rdi, form3
   mov rsi, rsp
   mov rdx, rsp
   add rdx, 8
   mov rcx, rsp
   add rcx, 16
   call scanf

   movsd xmm15, [rsp]
   pop rax
   movsd xmm14, [rsp]
   pop rax
   movsd xmm13, [rsp]
   pop rax

   push qword 99
   mov rdi, display_input
   mov rax, 3
   movsd xmm0, xmm15
   movsd xmm1, xmm14
   movsd xmm2, xmm13
   call printf

   ; 15 = side1
   ; 14 = side2
   ; 13 = angle

   ; convert andle to radians
   movsd xmm12, [pi] ; xmm12 = pi (numerator)
   mov rax, 180
   cvtsi2sd xmm11, rax ; xmm11 = 180 (denominator)
   divsd xmm12, xmm11 ; xmm12 = pi/180
   mulsd xmm13, xmm12 ; xmm13 = radians

   ; check if xmm13 <= 0, if so jump to .end: flag
   ; ucomisd xmm13, xmm12
   ; jbe error
   ; ucomisd xmm14, xmm12
   ; jbe error
   ; ucomisd xmm15, xmm12
   ; jbe error

   ; get cosine of angle into xmm12
   movsd xmm0, xmm13
   call cos
   movsd xmm12, xmm0

   ; get sine of angle into xmm11
   movsd xmm0, xmm13
   call sin
   movsd xmm11, xmm0

   ;calculate area
   mov rax, 2
   cvtsi2sd xmm10, rax

   movsd xmm9, xmm15 ; side 1 to xmm9
   mulsd xmm9, xmm14 ; side1 * side 2
   mulsd xmm9, xmm11 ; side1 * side2 * sin
   divsd xmm9, xmm10 ; (side1 * side2 * sin) / 2
   movsd [area], xmm9 ; save area for later

   ; calculate perimeter
   mov rax, 2
   cvtsi2sd xmm10, rax ; xmm10 = 2
   mulsd xmm10, xmm15 ; xmm10 = 2A
   mulsd xmm10, xmm14 ; xmm10 = 2AB

   movsd xmm11, xmm15
   mulsd xmm11, xmm11 ; xmm11 = A^2

   movsd xmm9, xmm14
   mulsd xmm9, xmm9 ; xmm10 = B^2
   
   ; cos(x) in xmm12
   
   mov rax, -1
   cvtsi2sd xmm8, rax ; -1 -> xmm8
   mulsd xmm10, xmm8 ; xmm10 = -2AB
   mulsd xmm10, xmm12 ; xmm10 = -2AB*cos(x)
   addsd xmm9, xmm11 ; xmm9 = A^2 + B^2
   addsd xmm10, xmm9 ; xmm10 = A^2 + B^2 - 2AB*cos(x)
   sqrtsd xmm10, xmm10 ; xmm10 = missing side (C)

   ; add our sides!
   addsd xmm10, xmm15
   addsd xmm10, xmm14 ; xmm9 = perimeter

   movsd [perimeter], xmm10
   
   ; output answers
   mov rax, 2
   mov rdi, result_out
   movsd xmm0, [area]
   movsd xmm1, [perimeter]
   call printf
   pop rax

   ; say bye
   mov rax, 0
   mov rdi, bye_out
   call printf

   ; area to driver
   pop rax
   movsd xmm0, [area]

   popf ; Restore rflags
   pop rbx ; Restore rbx
   pop r15 ; Restore r15
   pop r14 ; Restore r14
   pop r13 ; Restore r13
   pop r12 ; Restore r12
   pop r11 ; Restore r11
   pop r10 ; Restore r10
   pop r9 ; Restore r9
   pop r8 ; Restore r8
   pop rcx ; Restore rcx
   pop rdx ; Restore rdx
   pop rsi ; Restore rsi
   pop rdi ; Restore rdi
   pop rbp ; Restore rbp

   ret