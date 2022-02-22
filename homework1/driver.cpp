#include <cstdio> // <stdio.h> works too!

extern "C" double triangles();

int main()
{
    double area = triangles();

    printf("\nString returned is: %lf\n", area);
    printf("\nThis area was returned from assembly!\n");
    printf("\nZero will be returned to the OS.\n");

    return 0;
}