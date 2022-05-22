;; Charlie Taylor
;; Section 05
;; ctaylor27@csu.fullerton.edu

extern printf
extern scanf
extern atof

global volume

segment .data
string_format: db "%s", 0
three_float_format: db "%lf %lf %lf", 0

time: db "The time is now %lu tics.", 10, 0
elapsed_time: db "The run time was %lf tics.", 10, 0
side_in: db "Please enter length, width, and height as float numbers separated by ws:", 10, 0

vol_output: db "Thank you. You volume is %lf cubic units.", 10, 0

segment .bss
keyInput1: resb 100
keyInput2: resb 100
keyInput3: resb 100

segment .text
volume:
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

    push qword 0

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
    mov rdi, time
    mov rsi, r15
    call printf

    ; get user input
    
    ; prompt user for input
    mov rax, 0
    mov rdi, string_format
    mov rsi, side_in
    call printf

	push qword 0 ; push 8 bytes to top of stack for storage
	push qword 0
	push qword 0
	
	mov rdi, three_float_format
	mov rsi, rsp
	mov rdx, rsp
	add rdx, qword 8
	mov rcx, rsp
	add rcx, qword 16
	call scanf
	
	movsd xmm13, [rsp+0]  ; length in 13
	movsd xmm12, [rsp+8]  ; width in 12
	movsd xmm11, [rsp+16] ; height in 11
	
    pop rax
    pop rax
    pop rax
    pop rax

    ; compute volume in xmm10
    movsd xmm10, xmm11 ; move one side to xmm10
    mulsd xmm10, xmm12 ; mul by 2nd input
    mulsd xmm10, xmm13 ; mul by 1st input
    ; break for gdb after calc

    ; output computed volume
    mov rax, 1
    mov rdi, vol_output
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
    mov rdi, time
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
    movsd xmm0, xmm10

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