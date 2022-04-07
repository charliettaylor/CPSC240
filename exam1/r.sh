#!/bin/bash

#Author: Charlie Taylor
#Title: Payroll Compilation

rm *.o
rm *.out

echo "Compiling files..."

nasm -f elf64 -o finance.o finance.asm
nasm -f elf64 -o get_time_card.o get_time_card.asm
nasm -f elf64 -o compute_wage.o compute_wage.asm
nasm -f elf64 -o show_pay_stub.o show_pay_stub.asm

g++ -c -m64 -std=c++17 -fno-pie -no-pie -o payroll.o payroll.cpp

g++ -c -m64 -std=c++17 -fno-pie -no-pie -o isFloat.o isFloat.cpp

g++ -m64 -std=c++17 -fno-pie -no-pie -o object_file_compiled.out isFloat.o finance.o payroll.o get_time_card.o compute_wage.o show_pay_stub.o -lm

echo "Running program, compilation successful."

./object_file_compiled.out