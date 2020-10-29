

```asm
// Basically Push() and Pop() as in stacks. Hmm, interesting stuff for me as a beginner.



# Generador de Aleatorios RANDOM
```c
//
//  Random.cpp
//  Random-int
//
//  Created by Rohit Navalgund on 17/04/18.
//  Copyright © 2018 Rohit Navalgund. All rights reserved.
//

// Uses C++'s inbuilt random() function to generate a random integer. This is a long integer (8bytes).
#include <iostream>
using namespace std;

class Randomiser {
public: long a; int n;

    void calc() {
        cout<<"How many random numbers do you want? ";
        cin>>n;
        for (int i = 0; i < n; i++) {
            a = random();
            cout<<a<<"\n";
        }
    }
};

int main() {
    Randomiser r;
    r.calc();
    return 0;
}
```
