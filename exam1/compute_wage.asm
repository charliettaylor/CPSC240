;; Charlie Taylor
;; Section 05
;; ctaylor27@csu.fullerton.edu

extern printf   ; includes printf
extern scanf    ; includes scanf 

global compute_wage

segment .data

info_string: db "The weekly pay is being computed.", 10, 0

string_format: db "%s", 0

overtime_mult dq 0x1.8

segment .bss


segment .text
compute_wage:

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
	mov rsi, info_string
	call printf

    mov rax, 40 ;
    cvtsi2sd xmm12, rax
    ucomisd xmm12, xmm14 ; xmm14 has hours worked, 15 had rate
    jae no_over

    over:
    movsd xmm13, xmm12
    mulsd xmm13, xmm15 ; get 40 hours worth of money
    subsd xmm14, xmm12 ; get remaining OT hours
    mulsd xmm14, xmm15 ; get money for remaining
    mulsd xmm14, [overtime_mult] ; 1.5x rate for OT
    jmp finish

    no_over:
    mov rax, 0
    movsd xmm13, xmm14 ;move hours to 13
    mulsd xmm13, xmm15 ;mul rate to hours, done!
    cvtsi2sd xmm14, rax ; 0 dollars for OT

    finish:
	; return 0
    mov rax, 0

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
	