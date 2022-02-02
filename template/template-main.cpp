//****************************************************************************************************************************
//Program name: "Triangles". Copyright (C) 2022 Charlie Taylor                                                               *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************
//
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//Author information
//  Author name: Charlie Taylor
//  Author email: ctaylor27@csu.fullerton.edu
//
//Program information
//  Program name: 
//  Programming languages: Main function in C++; atolong function in X86-64
//  Date program began: 
//  Date of last update: 
//  Comments reorganized: 
//  Files in the program: 
//
//Purpose
//

//This file
//  File name: template-main.cpp
//  Language: C++
//  Max page width: 132 columns.  Well, we try to keep the width less than 132.
//  Optimal print specification: 7 point font, monospace, 132 columns, 8½x11 paper
//  Compile: g++ -c -m64 -Wall -std=c++17 -fno-pie -no-pie -o TEMPLATE-main.o TEMPLATE-main.cpp
//  Link: g++ -m64 -std=c++14 -fno-pie -no-pie -o convert.out TEMPLATE-main.o TEMPLATE.o
//
//References:
//  Jorgensen: X86-64 Assembly Language Programming with Ubuntu (free download)
//
//===== Begin code area ===========================================================================================================
//
#include <iostream>

using namespace std;

extern "C" void PROGRAM(char []);                   //The "C" is a directive to the C++ compiler to use standard "CCC" rules for parameter passing.

int main(int argc, char* argv[]){
  long result;
  cout << "Begin driver function that will test the module." << endl;

  printf("%s\n","The main C++ driver function will now terminate.");

  return 0;                                                 //'0' is the traditional code for 'no errors'.

}//End of main
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6**

