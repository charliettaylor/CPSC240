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
global triangles

segment .data                           ;Place initialized data here
   string_format: db "%s", 0
   intro: db "Welcome to Amazing Triange programmed by Charlie Taylor on January 30, 2022", 0
   name_prompt: db "Please enter your name: ", 0
   entry_prompt: db "Good morning %s, please enter the length of side 1, length of side 2, and size (degrees) of the included angle between them as real float numbers. Separate the numbers by white space, and be sure to press <enter> after the last inputted number.", 0
   sides_output: db "Thank you Juan. You entered %f %f %f", 0
   area_out: db "The area of your triangle is %f square units"
   perimeter_out: db "The perimeter is 19.567 linear units."
   sending_out: db "The area will now be sent to the driver function."
   return_value: db "The driver received this number 24.888888888 and will simply keep it."
   bye_out: db "An integer zero will now be sent to the operating system. Have a good day. Bye"


segment .bss                            ;Declare pointers to un-initialized space in this segment.
   side1: resb INPUT_LEN
   side2: resb INPUT_LEN
   angle: resb INPUT_LEN

segment .text

triangles:                                ;Entry point.  Execution begins here.
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

   mov rax, 0
   mov rdi, string_format
   mov rsi, intro
   call printf

   mov rax, intro

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

   ret ;  return