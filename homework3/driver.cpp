#include <iostream>
#include <stdlib.h>

using namespace std;

extern "C" double manager();

int main(int argc, char* argv[]){
  cout << "Begin driver function that will test the module." << endl;

  double answer = manager();

  printf("The main C++ driver function will now terminate. %lf was outputted.\n", answer);

  return 0;
}
