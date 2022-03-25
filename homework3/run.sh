#!/bin/bash

#Program: Property Values
#Author: Charlie Taylor

rm *.o
rm *.out

echo "Assemble manager.asm"
nasm -f elf64 -o manager.o manager.asm

echo "compile get_values.asm"
nasm -f elf64 -o get_values.o get_values.asm

echo "compile sum_values.asm"
nasm -f elf64 -o sum_values.o sum_values.asm

echo "compile show_values.cpp using the g++ compiler standard 2017"
g++ -c -Wall -no-pie -m64 -std=c++17 -o show_values.o show_values.cpp

echo "compile driver.c using gcc compiler standard 2017"
g++ -c -Wall -m64 -no-pie -o driver.o driver.cpp -std=c++17

echo "Link object files using the gcc Linker standard 2017"
g++ -m64 -no-pie -o propertyValues.out manager.o get_values.o driver.o sum_values.o show_values.o -std=c++17

echo "Run the Property Value Program:"
./propertyValues.out

echo "Script file has terminated."