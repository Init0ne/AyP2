grupo(a, colombia).
grupo(a, camerun).
grupo(a, jamaica).
grupo(a, italia).
grupo(b, argentina).
grupo(b, nigeria).
grupo(b, japon).
grupo(b, escocia).

rivales(Equipo, Rival) :-
    grupo(Grupo, Equipo),             
    grupo(Grupo, Rival),              
    Equipo \= Rival. 