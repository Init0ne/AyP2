#include <iostream>
#include <cmath>
#include <vector>

/*
    Conceptos:
    - Un numero primo solo es divisible por 1 y por si mismo
    - Para verificarlo se comprueba si el nuemro tiene divisores entre 2 y su raiz cuadrada 
    - Segun rango:
        - Numeros pequeños (ej: hasta 10^6) : Usa la criba o division por prueba.
            - Criba de Eratostenes N en rangos medianos/grandes (10^3 a 10^7)
        - Numeros grandes (ej: 10^9 o mas) : Se requieren algoritmos avanzados (Miller-Rabin, AKS)
*/ 

bool esPrimo(int n) {
    int limite = sqrt(n);
    if (n <= 1) return false;
    for (int i = 2; i <= limite; i++) {
        if (n % i == 0) return false;    
    }
    return true;
}

void calcularYMostrarPrimos_DivisionPorPrueba(int n) {
    std::vector<int> primos;
    int contador = 0;
    
    std::cout << "Numeros primos hasta " << n << " (Division por Prueba):" << std::endl;
    
    for (int i = 2; i <= n; i++) {
        if (esPrimo(i)) {
            std::cout << i << " ";
            primos.push_back(i);
            contador++;
            
            if (contador % 10 == 0) {
                std::cout << std::endl;
            }
        }
    }
    
    std::cout << std::endl;
    std::cout << std::endl << "Total de primos encontrados: " << contador << std::endl;
}

/*
    Partimos de una lista de numeros que van de 2 hasta un determinado numero.

    Eliminamos de la lista los multiplos de 2.

    Luego tomamos el primer numero despues del 2 que no fue eliminado (el 3) y eliminamos de la lista sus multiplos, y asi sucesivamente.

    El proceso termina cuando el cuadrado del mayor numero confirmado como primo es menor que el numero final de la lista.

    Cuando el cuadrado del siguiente numero primo supera el limite (N), significa que todos los primos restantes en la lista ya son primos confirmados y no necesitamos seguir tachando multiplos.

    Los numeros que permanecen en la lista son los primos.
*/

void esPrimo_Mediano_Criba(long n) {
    int contador = 0;
    std::vector<bool> esPrimo(n + 1, true);
    esPrimo[0] = esPrimo[1] = false; // 0 y 1 no son primos
    for (long i = 2; i <=n; i++){
        if (esPrimo[i]){
            for (long j = i * i; j <= n; j += i){
                esPrimo[j] = false;
            }
            contador++;
        }
    }

    std::cout << "Numeros primos hasta " << n << ":" << std::endl;
    for (long i = 0; i <= n; i++){
        if (esPrimo[i]){
            std::cout << i << " ";
        }
    }
    std::cout << "Total de primos encontrados: " << contador << std::endl;
}

int main() {
    int opcion = 0;
    long n = 0;

    do {
        std::cout << "\n===== MENU DE NUMEROS PRIMOS =====\n";
        std::cout << "1. Verificar si un numero es primo\n";
        std::cout << "2. Generar primos hasta N usando Division por Prueba\n";
        std::cout << "3. Generar primos hasta N usando Criba de Eratostenes\n";
        std::cout << "0. Salir\n";
        std::cout << "Ingrese una opcion: ";
        std::cin >> opcion;
        
        switch(opcion) {
            case 0:
                std::cout << "¡Hasta luego!\n";
                break;
                
            case 1:
                std::cout << "Ingrese un numero para verificar si es primo: ";
                std::cin >> n;
                
                if (esPrimo(n)) {
                    std::cout << "El numero " << n << " ES primo.\n";
                } else {
                    std::cout << "El numero " << n << " NO es primo.\n";
                }
                break;
                
            case 2:
                std::cout << "Ingrese el limite N para generar primos (Division por Prueba): ";
                std::cin >> n;
                
                if (n <= 0) {
                    std::cout << "El numero debe ser positivo.\n";
                } else {
                    calcularYMostrarPrimos_DivisionPorPrueba(n);
                }
                break;
                
            case 3:
                std::cout << "Ingrese el limite N para generar primos (Criba de Eratostenes): ";
                std::cin >> n;
                
                if (n <= 0) {
                    std::cout << "El numero debe ser positivo.\n";
                } else {
                    esPrimo_Mediano_Criba(n);
                }
                break;
                
            default:
                std::cout << "Opcion invalida. Por favor, intente nuevamente.\n";
                break;
        }
        
        if (opcion != 0) {
            std::cout << "\nPresione Enter para continuar...";
            std::cin.ignore(10000, '\n');
            std::cin.get();
        }
        
    } while (opcion != 0);
    
    return 0;
}