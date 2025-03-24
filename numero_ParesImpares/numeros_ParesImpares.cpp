
/*
    Desarrollo del Programa:

    Escriba un programa en C++ o Python que realice las siguientes tareas:

    Genere un vector/lista de n números aleatorios (donde n es un número a elegir por el estudiante).
    Filtre los números del vector/lista para obtener solo los números pares o solo los números impares.
    Presente como salida el vector/lista original y el vector/lista filtrado.
    Requisitos del código:

    El código debe estar prolijamente comentado, explicando cada parte importante del proceso.
    El programa debe ser modular, utilizando funciones para cada paso importante (por ejemplo, función para generar números aleatorios, función para filtrar números).
*/

#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>

using namespace std;

vector<int> generarNumerosAleatorios(int n);
vector<int> filtrarNumeros(const vector<int>& original, bool paridad);
void mostrarVector(const vector<int>& vec, const string& mensaje);

int main() {
    char continuar;

    do {
        int n = 0;
        int opcion = 0;

        // Menú para ingresar 'n'
        do {
            cout << "\nIngrese la cantidad de numeros a generar: ";
            cin >> n;
            if (n <= 0) {
                cout << "Error: Ingrese un numero positivo diferente a 0." << endl;
            }
        } while (n <= 0);

        // Menú para elegir paridad
        do {
            cout << "Ingrese *1* para pares o *2* para impares: ";
            cin >> opcion;
            if (opcion < 1 || opcion > 2) {
                cout << "Error: Opcion invalida. Intente de nuevo." << endl;
            }
        } while (opcion < 1 || opcion > 2);

        // Generar y filtrar números
        vector<int> original = generarNumerosAleatorios(n);
        bool paridad = (opcion == 1);
        vector<int> filtrado = filtrarNumeros(original, paridad);

        // Mostrar resultados
        mostrarVector(original, "original");
        mostrarVector(filtrado, "filtrado");

        cout << "\n¿Desea realizar otra operacion? (s/n): ";
        cin >> continuar;

    } while (continuar == 's' || continuar == 'S');

    return 0;
}

//Doxygen para generar documentacion como summary en C#

/// @brief Genera un vector de números aleatorios.
/// @param n Cantidad de números aleatorios a generar.
/// @return Un vector que contiene n números aleatorios entre 0 y 999.
vector<int> generarNumerosAleatorios(int n) {
    vector<int> vector(n);
    srand(time(0));
    for(int i = 0; i < n; i++) {
        vector[i] = rand() % 1000;
    }
    return vector;    
}

/// @brief Genera un nuevo vector de numeros pares o impares segun indique "paridad" tomando los numeros del vector "original"
/// @param original Vector original con el conjunto de numeros a filtrar
/// @param paridad Indica si se quiere filtrar por pares = true, o impares = false
/// @return Un vector que contiene los numeros filtrados
vector<int> filtrarNumeros(const vector<int>& original, bool paridad) {
    vector<int> filtrado;
    for (int num : original) {
        if ((paridad && num % 2 == 0) || (!paridad && num % 2 != 0)) {
            filtrado.push_back(num);
        }
    }
    return filtrado;
}

/// @brief Muestra los elementos de un vector en la consola.
/// @param vec Vector a mostrar.
/// @param mensaje Texto descriptivo (ej: "original", "filtrado").
void mostrarVector(const vector<int>& vec, const string& mensaje) {
    cout << "\nVector " << mensaje << ": ";
    for (int num : vec) {
        cout << num << " ";
    }
    cout << endl;
}

/*
    Escriba un breve comentario sobre las diferencias entre un lenguaje de programación imperativo (como C++ o Python) y un paradigma lógico visto en clase.
    Considere las siguientes preguntas para guiar su reflexión:
    ¿Qué dificultades y virtudes encontró al programar en un lenguaje imperativo?
        - La principal dificultad que encontre es el tema de lidiar con el flujo del programa, los bucles, condicionales, lo que lo hace propenso a tener errores constantes. Segun entendi en la clase los lenguajes de paradigma logico manejan todo esto de manera automatica.
        - A su vez esto te da un control total y podria ser util en ciertos casos asi que puede ser una virtud al mismo tiempo. Supongo que para problemas en los que quieras manejar directamente los datos o cosas mas complejas puede servir.

    ¿Qué diferencias observa a simple vista entre los conceptos de programación imperativa y lógica?
        - En la clase se hablo de que el paradigma imperativo se centra en como resolver el problema, por lo que uno define los pasos a seguir mientras que el logico se centra en el que y el como lo resuelve el motor logico automaticamente.

    ¿Qué virtudes destacaría de cada uno de estos paradigmas?
        - Imperativo: Flexibilidad para elegir como resolver cualquier problema
        - Logico: Abstrae y simplifica los problemas basandose en reglas

    ¿Cuál es su opinión personal sobre la aplicabilidad de estos paradigmas en esta etapa inicial de su aprendizaje?
        - En mi corta experiencia puedo decir que el imperativo es fundamental para aprender a manejar estructuras de datos y algoritmos, o por ejemplo como interactua el programa con la memoria en los punteros tomando como ejemplo c++, creo que son cosas que en el logico no se verian.
        - Creo que me falta mucho por conocer del paradigma logico, segun estuve leyendo tiene mucha aplicabilidad en el area de la inteligencia artificial, pero creo que puede ser interesante para ver los problemas desde otra perspectiva, abtraerse de como pueden hacerse ciertas cosas y centrarse unicamente en el problema en si, que es lo que se necesita para resolverlo.
*/