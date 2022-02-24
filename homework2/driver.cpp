#include <iostream>

using namespace std;

extern "C" double gravity();
extern "C" char isFloat();

int main(int argc, char* argv[]){
  long result;
  cout << "Begin driver function that will test the module." << endl;
  double test = gravity();

  printf("The main C++ driver function will now terminate. %lf was outputted.\n", test);

  return 0;
}
