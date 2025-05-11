persona(ale, 8).        % Vive a 8 cuadras
persona(maria, 12).     % Vive a 12 cuadras
persona(juan, 10).      % Vive a 10 cuadras
persona(lucas, 13).     % Vive a 13 cuadras
persona(carla, 3).      % Vive a 3 cuadras
persona(carlos, 5).      % Vive a 5 cuadras
persona(carloncho, 6).      % Vive a 6 cuadras

% Actividades de las personas
actividad(ale, juega(ajedrez)).
actividad(ale, clases(ceramica, martes, 11)).
actividad(ale, clases(ceramica, jueves, 11)).
actividad(ale, trabaja(empresaloca, turnoManana)).
actividad(maria, juega(voley)).
actividad(maria, clases(ceramica, lunes, 14)).
actividad(maria, trabaja(empresacool, turnoNoche)).
actividad(juan, juega(futbol)).
actividad(juan, clases(ceramica, lunes, 11)).
actividad(juan, clases(ceramica, miercoles, 14)).
actividad(juan, trabaja(empresaloca, turnoTarde)).
actividad(lucas, juega(basquet)).
actividad(lucas, clases(tenis, sabado, 10)).
actividad(lucas, trabaja(empresacool, turnoManana)).
actividad(carla, clases(ceramica, jueves, 11)).
actividad(carla, trabaja(empresaloca, turnoManana)).
actividad(carlos, juega(monopoly)).
actividad(carlos, trabaja(atiendoBoludos, turnoManana)).
actividad(carloncho, juega(monopoly)).
actividad(carloncho, trabaja(atiendoBoludos, turnoManana)).

% Informe sobre deportes
deporte(ajedrez).
deporte(futbol).
deporte(voley).
deporte(basquet).
deporte(tenis).

% 1.
esDeportista(Nombre) :- actividad(Nombre, juega(Actividad)), deporte(Actividad).
esDeportista(Nombre) :- actividad(Nombre, clases(Actividad, _, _)), deporte(Actividad).

%2.
esInteresante(Nombre) :- actividad(Nombre, trabaja(_, _)).
esInteresante(Nombre) :- actividad(Nombre, juega(ajedrez)).
esInteresante(Nombre) :- 
                        actividad(Nombre, clases(Actividad, Dia, _)),
                        actividad(Nombre, clases(Actividad, Dia2, _)),
                        Dia \= Dia2.

%3.
diferenciaDeCuadras(Persona1, Persona2, Diferencia) :- 
                                                    persona(Persona1, Cuadras1),
                                                    persona(Persona2, Cuadras2),
                                                    Diferencia is abs(Cuadras1 - Cuadras2).

%4.
amigosVagos(Persona1, Persona2) :-  (esInteresante(Persona1);esInteresante(Persona2)),
                                    % El ; funciona como OR
                                    % Esto es para darle mas ingo a la negacion, sino no es inversible
                                    persona(Persona1,_),
                                    persona(Persona2,_),
                                    not(esDeportista(Persona1)),
                                    not(esDeportista(Persona2)),
                                    Persona1 \= Persona2.

%5.
bff(Persona1, Persona2) :- 
                            persona(Persona1,_),
                            persona(Persona2,_),
                            Persona1 \= Persona2,
                            esInteresante(Persona1),
                            esInteresante(Persona2),
                            forall(actividad(Persona1, Actividad), actividad(Persona2, Actividad)),
                            forall(actividad(Persona2, Actividad), actividad(Persona1, Actividad)).

%6
amigoPorConveniencia(Buscadora, Buscada) :- 
                                            persona(Buscadora,_),
                                            persona(Buscada, Distancia),
                                            Buscadora \= Buscada,
                                            not((persona(Otra, OtraDistancia),
                                            Otra \= Buscada,
                                            OtraDistancia < Distancia)).
                                            % forall(
                                            %     (persona(OtraPersona, CuadrasOtra), OtraPersona \= Buscada),
                                            %     Distancia < CuadrasOtra
                                            % ).
                                            
%7
actividadesComunes(Persona1, Persona2, Actividades) :- 
                            persona(Persona1,_),
                            persona(Persona2,_),
                            Persona1 \= Persona2,
                            findall(Actividad,
                            (actividad(Persona1, Actividad),
                            actividad(Persona2, Actividad)),
                            Actividades).