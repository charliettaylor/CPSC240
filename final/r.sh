#!/bin/bash

# Delete some un-needed files
rm *.o
rm *.out

echo "Assemble manager.asm"
nasm -f elf64 -g -o volume.o volume.asm -gdwarf

echo "Compile cube.cpp"
g++ -c -g -m64 -Wall -fno-pie -no-pie -o cube.o cube.cpp -std=c++17

echo "Link the object files"
g++ -g -m64 -no-pie -o volume.out -std=c++17 volume.o cube.o

# Run the program with gdb commands and inputs done automatically
gdb -q -args volume.out

# Run program normally without gdb
# ./volume.out
