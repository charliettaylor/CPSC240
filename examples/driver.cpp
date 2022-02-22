#include <cstdio> // <stdio.h> works too!

extern "C" char *floatio();

int main()
{
    // this is where the magic happens, a pointer (address)
    // is being returned from the assembly program, which
    // we treat as a function with a return type of char *
    double string_returned = *floatio();

    printf("\nString returned is: %lf\n", string_returned);
    printf("\nThis string was returned from assembly!\n");
    printf("\nZero will be returned to the OS.\n");

    return 0;
}