/*
    Ejercicio 7

    a. Escribir un programa Prolog que responda consultas acerca de qué colores atraen a una determinada
    persona, de acuerdo con la siguiente información:
    A Mabel y a Ana les atrae el rosa.
    A Mara le atraen el celeste y el lila.
    A Juan le atraen todos los colores pastel.
    A todas las mujeres y a Pablo les atrae el azul.
    A los varones mayores y a Mabel les atrae el rojo.
    A todos los porteños (sin importar el sexo) y a Adrián les atrae el amarillo.
    A Ana y a Juan les atrae el naranja.
    Mabel, Mara y Pablo son porteños.
    Ana y Pablo son mayores.
    El rosa, el celeste y el lila son colores pastel.
    El programa debe ser capaz de responder, p.ej., a la siguiente consulta: ¿qué colores atraen a Mabel?
    obteniendo como respuestas "rosa", "azul", "rojo" y "amarillo".
    b. Modificar el programa anterior para que responda consultas acerca de con qué colores puede iluminarse una
    determinada reunión.
    Se dice que una reunión puede iluminarse con un color si entre los asistentes a la reunión hay una pareja (dos
    personas de distinto sexo) a quienes les atrae el color.
    Incluir en el programa la siguiente información:
    Mabel, Ana, Adrián y Pablo asistirán a la reunión del viernes.
    Mara, Mabel, Adrián y Juan asistirán a la reunión del sábado.
    Las personas mayores y Juan asistirán a la reunión del domingo.
    El programa debe ser capaz de responder, p.ej., a la siguiente consulta
    ¿con qué colores puede iluminarse la reunión del sábado?
    obteniendo como respuestas "rosa", "celeste", "lila" y "amarillo".
*/

leAtrae(mabel, rosa).
leAtrae(ana, rosa).
leAtrae(mara, celeste).
leAtrae(mara, lila).
leAtrae(juan , X) :- esPastel(X).
leAtrae(pablo, azul).
leAtrae(Y, azul) :- esMujer(Y).
leAtrae(mabel, rojo).
leAtrae(Z, rojo) :- sonMayores(Z), \+ esMujer(Z).
leAtrae(adrian, amarillo).
leAtrae(F, amarillo) :- sonPortenios(F).
leAtrae(ana, naranja).
leAtrae(juan, naranja).

esPastel(rosa).
esPastel(celeste).
esPastel(lila).

esMujer(mabel).
esMujer(ana).
esMujer(mara).

sonMayores(ana).
sonMayores(pablo).

sonPortenios(mabel).
sonPortenios(mara).
sonPortenios(pablo).

seIlumina(X, Y) :- leAtrae(X, Colorx), leAtrae(Y, Colorx) , esMujer(X), \+ esMujer(Y).
% seIlumina(X, Y) :- leAtrae(X, Colorx), leAtrae(Y, Colorx) , \+ esMujer(X), esMujer(Y).

asistenReunion(mabel, viernes).
asistenReunion(ana, viernes).
asistenReunion(adrian, viernes).
asistenReunion(pablo, viernes).
asistenReunion(mara, sabado).
asistenReunion(mabel, sabado).
asistenReunion(adrian, sabado).
asistenReunion(juan, sabado).
asistenReunion(juan, domingo).
asistenReunion(X, domingo) :- sonMayores(X).
