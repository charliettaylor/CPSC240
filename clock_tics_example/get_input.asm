;; Charlie Taylor
;; Section 05
;; ctaylor27@csu.fullerton.edu

extern printf   ; includes printf
extern scanf    ; includes scanf 
extern isFloat
extern atof

global get_input

segment .data

input_prompt: db "Enter values needed", 10, 0

bad_input_msg: db "Input was not valid, should be positive decimal number.", 10, 0

negative_input_msg: db "Input was negative.", 10, 0

emf_input: db "Please enter the emf:", 10, 0

res_input: db "Please enter the resistance:", 10, 0

string_format: db "%s", 0

segment .bss
keyInput1: resb 100
keyInput2: resb 100

segment .text
get_input:
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

  ; prompt user for input
  mov rax, 0
  mov rdi, string_format
  mov rsi, emf_input
  call printf

  ; scanf for input1
  push qword 0
  mov rax, 0
  mov rdi, string_format
  mov rsi, keyInput1
  call scanf

  ; convert string to double
  mov rax, 0
  mov rdi, keyInput1
  call atof
  movsd xmm12, xmm0 ; input1 moved to xmm12
  
  pop rax

  ; SECOND INPUT
  mov rax, 0
  mov rdi, string_format
  mov rsi, res_input
  call printf

  push qword 0
  mov rdi, string_format
  mov rsi, keyInput2
  mov rax, 0
  call scanf

  ; validate input and move
  mov rax, 0
  mov rdi, keyInput2
  call isFloat
  cmp rax, 0 ; 0 = fail
  je bad_input

  ; xmm 13 = 0
  mov rax, 0
  cvtsi2sd xmm13, rax

  ; convert string to double
  mov rax, 0
  mov rdi, keyInput2
  call atof
  movsd xmm11, xmm0 ; input2 moved to xmm12

  ; check if input is negative
  ucomisd xmm13, xmm14
  ja negative

  pop rax
  pop rax

  mov rax, 0

  jmp finish

  bad_input:
  pop rax
  pop rax

  ; output bad input message
  mov rax, 0
  mov rdi, bad_input_msg
  call printf

  ; return -1 to end program early
  mov rax, -1
  jmp finish

  negative:
  pop rax
  pop rax

  ; output negative input message
  mov rax, 0
  mov rdi, negative_input_msg
  call printf
  
  ; return -1 to end program early
  mov rax, -1
  jmp finish

  ; return 0
  finish:
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
