/* Ejercicio 3 
Armar un programa Prolog que resuelva el siguiente problema lógico: 
Un asesino siempre odia a su víctima y nunca es más rico que ella. El asesino de la tía Agatha, 
además, vive en la mansión Dreadbury. 
Tía Agatha, el carnicero y Charles son las únicas personas que viven en la mansión Dreadbury. 
Charles odia a todas las personas de la mansión que no son odiadas por la tía Agatha. 
Agatha odia a todos los que viven en la mansión, excepto al carnicero. 
Quien no es odiado por el carnicero y vive en la mansión, es más rico que tía Agatha 
El carnicero odia a las mismas personas que odia tía Agatha. 
Al programa le tengo que poder preguntar quién es el asesino de la tía Agatha, y tiene que brindar una sola 
respuesta.
*/ 

viveMansion(agatha).
viveMansion(carnicero).
viveMansion(carlitos).

agathaOdia(Persona) :- viveMansion(Persona), Persona \= carnicero, Persona \= agatha.
carlitosOdia(Persona) :- viveMansion(Persona), not(agathaOdia(Persona)), Persona \= carlitos.
carniceroOdia(Persona) :- agathaOdia(Persona).

esMasRicoAgatha(Persona) :- viveMansion(Persona), not(carniceroOdia(Persona)).

asesino(Persona) :- viveMansion(Persona), agathaOdia(Persona), not(esMasRicoAgatha(Persona)).
asesino(Persona) :- viveMansion(Persona), carlitosOdia(Persona), not(esMasRicoAgatha(Persona)).