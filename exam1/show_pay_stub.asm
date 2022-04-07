;; Charlie Taylor
;; Section 05
;; ctaylor27@csu.fullerton.edu

extern printf   ; includes printf
extern scanf    ; includes scanf 

global show_pay_stub

segment .data

pay_stub: db "Weekly pay stub", 10, 0

regular: db "Regular pay: $%.2lf", 10, 0
over: db "Overtime pay: $%.2lf", 10, 0
total: db "Total pay: $%.2lf", 10, 0

string_format: db "%s", 0

segment .bss

segment .text
show_pay_stub:

    push rbp ; Push memory address of base of previous stack frame onto stack top

    mov rbp, rsp ; Copy value of stack pointer into base pointer, rbp = rsp = both point to stack top
    ; Rbp now holds the address of the new stack frame, i.e "top" of stack
    push rdi ; Backup rdi
    push rsi ; Backup rsi
    push rdx ; Backup rdx
    push rcx ; Backup rcx
    push r8 ; Backup r8
    push r9 ; Backup r9
    push r10 ; Backup r10
    push r11 ; Backup r11
    push r12 ; Backup r12
    push r13 ; Backup r13
    push r14 ; Backup r14
    push r15 ; Backup r15
    push rbx ; Backup rbx
    pushf ; Backup rflags
	
	; print block
	mov rax, 0
	mov rdi, string_format
	mov rsi, pay_stub
	call printf

    mov rax, 1
    mov rdi, regular
    movsd xmm0, xmm13
	call printf

    mov rax, 1
    mov rdi, over
    movsd xmm0, xmm14
	call printf

    mov rax, 1
    mov rdi, total
    addsd xmm13, xmm14 ; add OT to regular
    movsd xmm0, xmm13
	call printf

	; return 0
    movsd xmm0, xmm13

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
