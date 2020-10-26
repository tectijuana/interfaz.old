/*
    Programa que convierto Numero a numero Romano.
   
*/

#include <iostream>
using namespace std;

typedef struct _MiEstruct {
    const int numero;
    const char* rom;
} MiEstruct;

void toRomano(int n);

int main() {
    cout << "TECLEAR NUMERO A CONVERTIR (SIN DECIMAL): ";
    int n;
    cin >> n;
    toRomano(n);
    return 0;
}

void toRomano(int n) {
    MiEstruct dict[] = {
        {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "LC"}, {50, "L"},
        {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}
    };
    
    int len = sizeof(dict) / sizeof(dict[0]);
    
    for (int i = 0; i < len; i++) {
        while (n >= dict[i].numero) {
            n -= dict[i].numero;
            cout << dict[i].rom;
        }
    }
    
    cout << endl;
}

