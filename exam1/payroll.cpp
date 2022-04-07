// Charlie Taylor
// Section 05
// ctaylor27@csu.fullerton.edu

#include <cstdio>
#include <stdio.h>

extern "C" double finance();

int main()
{
    double pay = finance();

    if(pay >= 0)
    {
        printf("The main program has received this %.2lf.", pay);
    }

    printf("\nHave a nice evening. 0 will be returned to the OS.\n");

    return 0;
}