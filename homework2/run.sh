#!/bin/bash

#Author: Charlie Taylor
#Title: BASH compile for C++

rm *.o
rm *.out

echo "Compiling files..."

nasm -f elf64 -o gravity.o gravity.asm

g++ -c -m64 -std=c++17 -fno-pie -no-pie -o driver.o driver.cpp

g++ -c -m64 -std=c++17 -fno-pie -no-pie -o isFloat.o isFloat.cpp

g++ -m64 -std=c++17 -fno-pie -no-pie -o object_file_compiled.out gravity.o driver.o isFloat.o

echo "Running program, compilation successful."

./object_file_compiled.out