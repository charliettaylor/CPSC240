#include <iostream>

extern "C" void show_values(double arr[], int arr_size);

//Prints the contents of the array, up to arr_size, determined by the fill asm module
void show_values(double arr[], int arr_size) {
  for (int i = 0; i < arr_size; i++)
  {
    printf("%.10lf\n", arr[i]);
  }
}