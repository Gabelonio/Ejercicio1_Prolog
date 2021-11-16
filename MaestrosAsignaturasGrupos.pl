% Hechos y reglas
:- nl,nl,write('Digite \'preguntar.\' para iniciar:  ?- preguntar. '), nl,nl,nl.

:- dynamic profesor_of/3.

profesor_of(josé, matemáticas, 1).
profesor_of(josé, matemáticas, 2).
profesor_of(maría, biología, 1).
profesor_of(maría, química, 1).
profesor_of(teresa, geografía, 1).
profesor_of(teresa, historia, 1).
profesor_of(margarita, biología, 2).
profesor_of(margarita, química, 2).
profesor_of(margarita, geografía, 2).
profesor_of(ruth, biología, 3).
profesor_of(ruth, química, 3).

:- dynamic estudiante_of/3.

estudiante_of(ana, matemáticas, 2).
estudiante_of(ana, geografía, 1).
estudiante_of(luis, historia, 1).
estudiante_of(luis, biología, 3).
estudiante_of(pedro, química, 1).
estudiante_of(pedro, matemáticas, 1).
estudiante_of(juan, matemáticas, 1).
estudiante_of(juan, biología, 2).
estudiante_of(juan, historia, 1).
estudiante_of(rosa, geografía, 2).
estudiante_of(rosa, historia, 1).
estudiante_of(rosa, biología, 1).
estudiante_of(jesús, geografía, 2).
estudiante_of(jesús, historia, 1).

preguntar:-write('Para añadir profesores escriba 1.'),nl,write('Para añadir estudiantes escriba 2.'),nl,read(Opcion),nl,((Opcion==1)->añadirProfesor;(Opcion==2)->añadirEstudiante;fail).

añadirEstudiante:-write('Añadir estudiante'),nl,nl,write('Ingrese el Nombre del estudiante:'),read(Nombre),nl,write('Ingrese la Asignatura que cursa el estudiante:'),read(Asignatura),nl,write('Ingrese el Grupo al que pertenece el estudiante:'),read(Grupo),nl,assert(estudiante_of(Nombre, Asignatura, Grupo)),repetir.
añadirProfesor:-write('Añadir profesor'),nl,nl,write('Ingrese el Nombre del profesor:'),read(Nombre),nl,write('Ingrese la Asignatura que dicta el profesor:'),read(Asignatura),nl,write('Ingrese el Grupo al que pertenece el profesor:'),read(Grupo),nl,assert(profesor_of(Nombre, Asignatura, Grupo)),repetir.

repetir:-write('¿Desea incluir otro profesor y/o estudiante? (si/no) '), read(Respuesta),nl, ((Respuesta==si)->preguntar;fail).

undo :-profesor_of(_ ,_, _),fail.
undo.

undo :-estudiante_of(_, _, _), fail.
undo.

profesor_estudiante(Estudiante, Asignatura, Grupo, Profesor):-estudiante_of(Estudiante,Asignatura,Grupo),profesor_of(Profesor,Asignatura,Grupo).

profesores_asignatura(Profesor1, Asignatura, Grupo, Profesor2):-profesor_of(Profesor1,Asignatura,Grupo),profesor_of(Profesor2,Asignatura,Grupo),Profesor1\=Profesor2.

