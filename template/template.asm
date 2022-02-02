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
base_number equ 10                      ;10 base of the decimal number system
ascii_zero equ 48                       ;48 is the ascii value of '0'
null equ 0
minus equ '-'

extern printf                           ;External C++ function for writing to standard output device
extern scanf                            ;External C++ function for reading from the standard input device

segment .data                           ;Place initialized data here
   ;This segment is empty


segment .bss                            ;Declare pointers to un-initialized space in this segment.
   ;This segment is empty

;==============================================================================================================================
;===== Begin the executable code here.
;==============================================================================================================================
segment .text                           ;Place executable instructions in this segment.

PUT_PROGRAM_NAME_HERE:                                ;Entry point.  Execution begins here.

;The next two instructions should be performed at the start of every assembly program.
push rbp                                ;This marks the start of a new stack frame belonging to this execution of this function.
mov  rbp, rsp                           ;rbp holds the address of the start of this new stack frame.
;The following pushes are performed for safety of the data that may already be in the remaining GPRs.
;This backup process is especially important when this module is called by another asm module.  It is less important when called
;called from a C or C++ function.
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

; put code here...

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