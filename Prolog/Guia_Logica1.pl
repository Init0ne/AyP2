pastas(ravioles).
pastas(fideos).
pastas(involtinis).

come(juan, ravioles).
come(brenda, fideos).
come(melina, ravioles).
come(juan, fideos).

mortal(Persona) :- humano(Persona).
humano(socrates).
humano(platon).

viveEn(tefi, lanus).
viveEn(gise, lanus).
viveEn(alf, lanus).
viveEn(dodain, liniers).
docente(alf).
docente(tefi).
docente(gise).
docente(dodain).

afortunado(Persona) :- docente(Persona), viveEn(Persona, lanus).

chica(nora).
chica(maria).
chica(zulema).
chica(roberta).
chica(ana).
chica(laura).

tieneOnda(zulema).
tieneOnda(roberta).

morocha(maria).
morocha(roberta).

gusta(juan, maria).
gusta(pedro, ana).
gusta(pedro, nora).
gusta(mario, ana).
gusta(mario, luisa).
gusta(Persona, zulema) :- gusta(Persona, nora).

gusta(julian, Chica):- chica(Chica), morocha(Chica).
gusta(julian, Chica):- chica(Chica), tieneOnda(Chica).
gusta(mario, Chica):- chica(Chica), morocha(Chica),
tieneOnda(Chica).
gusta(Persona, laura) :- gusta(Persona, ana), gusta(Persona, luisa).