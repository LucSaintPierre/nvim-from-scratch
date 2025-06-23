#include <iostream>

/**
 * @brief Compares two Blink objects based on their intensity.
 *
 * @param _a The first Blink object.
 * @param _b The second Blink object.
 * @return  -1 if blink1 is less intense than blink2.
 *          0 if blink1 and blink2 have the same intensity.
 *          1 if blink1 is more intense than blink2.
 */
int myFunction(int _a, float _b) { return 2; }

int main() {
  int myA = 2;
  int myB = 3;
  int myFcR = myFunction(myA, myB);
  // make alook that goes from 2 to 10 for the myA and print the result
  for (int i = 2; i <= 10; ++i) {
    std::cout << "myFunction(" << i << ", " << myB
              << ") = " << myFunction(i, myB) << std::endl;
  }
  // now chang the myB to 2.0 and call the function again
  myB = 2.0;
  std::cout << "Calling myFunction with myB = 2.0" << std::endl;

  myFunction(11, 2.0);
}
