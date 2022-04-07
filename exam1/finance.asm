;; Charlie Taylor
;; Section 05
;; ctaylor27@csu.fullerton.edu

extern printf   ; includes printf
extern scanf    ; includes scanf 
extern get_time_card
extern compute_wage
extern show_pay_stub

global finance

segment .data
intro: db "Welcome to Superior Payroll Services programmed by Charlie Taylor on April 7, 2022", 10, 0

input_prompt: db "Enter values needed", 10, 0

input1_worked: db "Input 1 is good!", 10, 0

output_input: db "%lf %lf", 10, 0

error_msg: db "Something went wrong, ending program.", 10, 0

return_string: db "This program will return 0 to the driver.", 10, 0

string_format: db "%s", 0

segment .bss

keyInput1: resb 100
keyInput2: resb 100

segment .text
finance:
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

    ;push qword 0

    ; welcome message
    mov rax, 0
    mov rdi, string_format
    mov rsi, intro ;put intro string in first param
    call printf ;call func with given param

    ; get time card
    mov rax, 0
    call get_time_card
    ; check if validation went well
    cmp rax, -1
    ; if not, end early
    je error

    call compute_wage ; will put values into xmm13, xmm14

    call show_pay_stub ; returns the total pay to be sent to driver

    jmp finish

    error:
    mov rax, 0
    mov rdi, string_format
    mov rsi, error_msg
    call printf
    jmp finish

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
