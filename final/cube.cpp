// Charlie Taylor
// Section 05
// ctaylor27@csu.fullerton.edu

#include <iostream>
#include <cstdio>

extern "C" double volume();

int main()
{
    printf("Welcome to Cuboids programmed by Charlie Taylor\n");

    double vol;
    vol = volume();

    printf("Function main received this number %lf and will view it. \n", vol);
    printf("We strive to please the customer. Enjoy your cuboids.\n");

    return 0;
}