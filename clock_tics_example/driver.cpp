#include <iostream>
#include <cstdio>

// declare manager as extern
extern "C" double manager();

int main()
{
    // simple body of function
    printf("Welcome to my driver file.\n");

    // elapsed tics
    double ret_val = manager();

    printf("Our time elapsed is %lf\n", ret_val);

    return 0;
}