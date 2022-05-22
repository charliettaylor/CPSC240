extern printf
extern scanf

extern get_input
extern get_frequency

; how to make it visible to our C++ driver
global manager

segment .data
string_form: db "%s", 0
int_form: db "%ld", 0
float_form: db "%lf", 0

test: db "%lf %lf", 10, 0

start_time: db "Our start time is %lu tics.", 10, 0
end_time: db "Our end time is %lu tics.", 10, 0

current: db "The computed current is %lf amps", 10, 0

elapsed_time: db "Our elapsed time is %lf tics, which will be returned to the driver.", 10, 0

segment .bss

segment .text
manager:
    ; 15 pushes
	push rbp
	mov rbp, rsp
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
    mov rdx, 0 

    ; stop system processes and
    ; read clock time stamp
    cpuid 
    rdtsc

    ; shift all the bits of rax 32 bits to the left
    shl rdx, 32

    ; our complete number of tics
    add rdx, rax

    ; move tics elapsed to r15
    mov r15, rdx

    ; print out start time tics elapsed
    mov rax, 0
    mov rdi, start_time
    mov rsi, r15
    call printf

    ; get user input
    call get_input

    ; compute current in xmm10
    movsd xmm10, xmm12
    divsd xmm10, xmm11
    ; break for gdb after calc

    ; output computed current
    mov rax, 1
    mov rdi, current
    movsd xmm0, xmm10
    call printf

    ; stop system processes and
    ; read clock time stamp
    cpuid
    rdtsc

    ; shift all the bits of rax 32 bits to the left
    shl rdx, 32

    ; our complete number of tics
    add rdx, rax

    ; move tics elapsed to r15
    mov r14, rdx

    ; print out start time tics elapsed
    mov rax, 0
    mov rdi, end_time
    mov rsi, r14
    call printf

    ; convert integer numbers to float numbers
    cvtsi2sd xmm15, r15 ; start time
    cvtsi2sd xmm14, r14 ; end time

    ; end - start
    subsd xmm14, xmm15

    ; move to xmm15
    movsd xmm15, xmm14

    ; make a copy of xmm15 (tics)
    movsd xmm13, xmm15

    ; print out our elapsed tics
    mov rax, 1
    mov rdi, elapsed_time
    movsd xmm0, xmm15
    call printf

    ; return
    movsd xmm0, xmm13

    ; 15 pops
	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rsi
	pop rdi
	pop rdx
	pop rcx
	pop rbx
	pop rbp

    ret