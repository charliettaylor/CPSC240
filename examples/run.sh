#!/bin/bash

#Author: Charlie Taylor
#Title: BASH compile for C++

rm *.o
rm *.out

echo "Compiling files..."

nasm -f elf64 -o floatio.o floatio.asm

g++ -c -m64 -std=c++17 -fno-pie -no-pie -o driver.o driver.cpp

g++ -m64 -std=c++17 -fno-pie -no-pie -o object_file_compiled.out floatio.o driver.o

echo "Running program, compilation successful."

./object_file_compiled.out