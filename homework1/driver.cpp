#include <cstdio> // <stdio.h> works too!

extern "C" char *triangles();

int main()
{
    printf("This is an instructional program made by Daniel C\n");

    // this is where the magic happens, a pointer (address)
    // is being returned from the assembly program, which
    // we treat as a function with a return type of char *
    char *string_returned = triangles();

    printf("\nString returned is: %s\n", string_returned);
    printf("\nThis string was returned from assembly!\n");
    printf("\nZero will be returned to the OS.\n");

    return 0;
}