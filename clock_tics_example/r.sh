#!/bin/bash

# Delete some un-needed files
rm *.o
rm *.out

echo "Assemble manager.asm"
nasm -f elf64 -g -o manager.o manager.asm -gdwarf

nasm -f elf64 -g -o get_input.o get_input.asm -gdwarf

nasm -f elf64 -g -o get_frequency.o get_frequency.asm -gdwarf

echo "Compile driver.cpp"
g++ -c -g -m64 -Wall -fno-pie -no-pie -o driver.o driver.cpp -std=c++17

g++ -c -g -m64 -Wall -fno-pie -no-pie -o isFloat.o isFloat.cpp -std=c++17

echo "Link the object files"
g++ -g -m64 -no-pie -o time_elapsed.out -std=c++17 get_frequency.o get_input.o manager.o driver.o isFloat.o

# Run the program
gdb -q -args time_elapsed.out
# ./time_elapsed.out
