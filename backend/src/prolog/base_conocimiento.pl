% ==========================================
% BASE DE CONOCIMIENTO - Agente Pedagógico
% ==========================================

% ------------------------------------------
% KEYWORDS obligatorias por tipo de consulta
% ------------------------------------------

% SELECT
requiere_keyword(select, easy, 'SELECT').
requiere_keyword(select, easy, 'FROM').
requiere_keyword(select, medium, 'SELECT').
requiere_keyword(select, medium, 'FROM').
requiere_keyword(select, medium, 'WHERE').
requiere_keyword(select, hard, 'SELECT').
requiere_keyword(select, hard, 'FROM').
requiere_keyword(select, hard, 'WHERE').
requiere_keyword(select, hard, 'ORDER BY').

% INSERT
requiere_keyword(insert, easy, 'INSERT').
requiere_keyword(insert, easy, 'INTO').
requiere_keyword(insert, easy, 'VALUES').
requiere_keyword(insert, medium, 'INSERT').
requiere_keyword(insert, medium, 'INTO').
requiere_keyword(insert, medium, 'VALUES').
requiere_keyword(insert, hard, 'INSERT').
requiere_keyword(insert, hard, 'INTO').
requiere_keyword(insert, hard, 'SELECT').

% UPDATE
requiere_keyword(update, easy, 'UPDATE').
requiere_keyword(update, easy, 'SET').
requiere_keyword(update, medium, 'UPDATE').
requiere_keyword(update, medium, 'SET').
requiere_keyword(update, medium, 'WHERE').
requiere_keyword(update, hard, 'UPDATE').
requiere_keyword(update, hard, 'SET').
requiere_keyword(update, hard, 'WHERE').

% DELETE
requiere_keyword(delete, easy, 'DELETE').
requiere_keyword(delete, easy, 'FROM').
requiere_keyword(delete, medium, 'DELETE').
requiere_keyword(delete, medium, 'FROM').
requiere_keyword(delete, medium, 'WHERE').
requiere_keyword(delete, hard, 'DELETE').
requiere_keyword(delete, hard, 'FROM').
requiere_keyword(delete, hard, 'WHERE').

% JOIN
requiere_keyword(join, easy, 'SELECT').
requiere_keyword(join, easy, 'FROM').
requiere_keyword(join, easy, 'JOIN').
requiere_keyword(join, easy, 'ON').
requiere_keyword(join, medium, 'SELECT').
requiere_keyword(join, medium, 'FROM').
requiere_keyword(join, medium, 'JOIN').
requiere_keyword(join, medium, 'ON').
requiere_keyword(join, medium, 'WHERE').
requiere_keyword(join, hard, 'SELECT').
requiere_keyword(join, hard, 'FROM').
requiere_keyword(join, hard, 'JOIN').
requiere_keyword(join, hard, 'ON').
requiere_keyword(join, hard, 'WHERE').
requiere_keyword(join, hard, 'ORDER BY').

% GROUP_BY
requiere_keyword(group_by, easy, 'SELECT').
requiere_keyword(group_by, easy, 'FROM').
requiere_keyword(group_by, easy, 'GROUP BY').
requiere_keyword(group_by, medium, 'SELECT').
requiere_keyword(group_by, medium, 'FROM').
requiere_keyword(group_by, medium, 'GROUP BY').
requiere_keyword(group_by, medium, 'WHERE').
requiere_keyword(group_by, hard, 'SELECT').
requiere_keyword(group_by, hard, 'FROM').
requiere_keyword(group_by, hard, 'GROUP BY').
requiere_keyword(group_by, hard, 'HAVING').
requiere_keyword(group_by, hard, 'ORDER BY').

% HAVING
requiere_keyword(having, easy, 'SELECT').
requiere_keyword(having, easy, 'FROM').
requiere_keyword(having, easy, 'GROUP BY').
requiere_keyword(having, easy, 'HAVING').
requiere_keyword(having, medium, 'SELECT').
requiere_keyword(having, medium, 'FROM').
requiere_keyword(having, medium, 'GROUP BY').
requiere_keyword(having, medium, 'HAVING').
requiere_keyword(having, medium, 'WHERE').
requiere_keyword(having, hard, 'SELECT').
requiere_keyword(having, hard, 'FROM').
requiere_keyword(having, hard, 'GROUP BY').
requiere_keyword(having, hard, 'HAVING').
requiere_keyword(having, hard, 'ORDER BY').

% SUBQUERY
requiere_keyword(subquery, easy, 'SELECT').
requiere_keyword(subquery, easy, 'FROM').
requiere_keyword(subquery, easy, 'WHERE').
requiere_keyword(subquery, medium, 'SELECT').
requiere_keyword(subquery, medium, 'FROM').
requiere_keyword(subquery, medium, 'WHERE').
requiere_keyword(subquery, medium, 'IN').
requiere_keyword(subquery, hard, 'SELECT').
requiere_keyword(subquery, hard, 'FROM').
requiere_keyword(subquery, hard, 'WHERE').
requiere_keyword(subquery, hard, 'EXISTS').

% DDL
requiere_keyword(ddl, easy, 'CREATE').
requiere_keyword(ddl, easy, 'TABLE').
requiere_keyword(ddl, medium, 'ALTER').
requiere_keyword(ddl, medium, 'TABLE').
requiere_keyword(ddl, hard, 'DROP').
requiere_keyword(ddl, hard, 'TABLE').

% DCL
requiere_keyword(dcl, easy, 'GRANT').
requiere_keyword(dcl, medium, 'GRANT').
requiere_keyword(dcl, medium, 'ON').
requiere_keyword(dcl, hard, 'REVOKE').
requiere_keyword(dcl, hard, 'ON').
requiere_keyword(dcl, hard, 'FROM').

% TCL
requiere_keyword(tcl, easy, 'COMMIT').
requiere_keyword(tcl, medium, 'ROLLBACK').
requiere_keyword(tcl, hard, 'SAVEPOINT').

% AGGREGATE
requiere_keyword(aggregate, easy, 'SELECT').
requiere_keyword(aggregate, easy, 'FROM').
requiere_keyword(aggregate, medium, 'SELECT').
requiere_keyword(aggregate, medium, 'FROM').
requiere_keyword(aggregate, medium, 'GROUP BY').
requiere_keyword(aggregate, hard, 'SELECT').
requiere_keyword(aggregate, hard, 'FROM').
requiere_keyword(aggregate, hard, 'GROUP BY').
requiere_keyword(aggregate, hard, 'HAVING').

% ------------------------------------------
% DETECTAR tipo de consulta
% ------------------------------------------
tipo_consulta(SQL, select)   :- sub_string(SQL, _, _, _, 'SELECT'), \+ sub_string(SQL, _, _, _, 'JOIN'), \+ sub_string(SQL, _, _, _, 'GROUP BY').
tipo_consulta(SQL, insert)   :- sub_string(SQL, _, _, _, 'INSERT').
tipo_consulta(SQL, update)   :- sub_string(SQL, _, _, _, 'UPDATE').
tipo_consulta(SQL, delete)   :- sub_string(SQL, _, _, _, 'DELETE').
tipo_consulta(SQL, join)     :- sub_string(SQL, _, _, _, 'JOIN').
tipo_consulta(SQL, group_by) :- sub_string(SQL, _, _, _, 'GROUP BY'), \+ sub_string(SQL, _, _, _, 'HAVING').
tipo_consulta(SQL, having)   :- sub_string(SQL, _, _, _, 'HAVING').
tipo_consulta(SQL, subquery) :- sub_string(SQL, _, _, _, 'WHERE'), sub_string(SQL, _, _, _, 'IN').
tipo_consulta(SQL, ddl)      :- sub_string(SQL, _, _, _, 'CREATE') ; sub_string(SQL, _, _, _, 'ALTER') ; sub_string(SQL, _, _, _, 'DROP').
tipo_consulta(SQL, dcl)      :- sub_string(SQL, _, _, _, 'GRANT') ; sub_string(SQL, _, _, _, 'REVOKE').
tipo_consulta(SQL, tcl)      :- sub_string(SQL, _, _, _, 'COMMIT') ; sub_string(SQL, _, _, _, 'ROLLBACK') ; sub_string(SQL, _, _, _, 'SAVEPOINT').
tipo_consulta(SQL, aggregate):- sub_string(SQL, _, _, _, 'COUNT') ; sub_string(SQL, _, _, _, 'SUM') ; sub_string(SQL, _, _, _, 'AVG') ; sub_string(SQL, _, _, _, 'MAX') ; sub_string(SQL, _, _, _, 'MIN').

% ------------------------------------------
% DETECTAR nivel de dificultad
% ------------------------------------------
nivel_dificultad(easy).
nivel_dificultad(medium).
nivel_dificultad(hard).

% ------------------------------------------
% VALIDAR keywords segun tipo y nivel
% ------------------------------------------
keywords_validas(SQL, Tipo, Nivel) :-
  \+ (
    requiere_keyword(Tipo, Nivel, Keyword),
    \+ sub_string(SQL, _, _, _, Keyword)
  ).

% ------------------------------------------
% FEEDBACK por tipo de error
% ------------------------------------------
feedback(select,   syntax, 'Error de sintaxis en SELECT: verifica que uses SELECT ... FROM ...').
feedback(insert,   syntax, 'Error de sintaxis en INSERT: la estructura correcta es INSERT INTO tabla VALUES (...)').
feedback(update,   syntax, 'Error de sintaxis en UPDATE: recuerda usar UPDATE tabla SET columna = valor WHERE condicion').
feedback(delete,   syntax, 'Error de sintaxis en DELETE: recuerda usar DELETE FROM tabla WHERE condicion').
feedback(join,     syntax, 'Error de sintaxis en JOIN: verifica que uses JOIN ... ON condicion').
feedback(group_by, syntax, 'Error de sintaxis en GROUP BY: recuerda agrupar con GROUP BY despues del FROM').
feedback(having,   syntax, 'Error de sintaxis en HAVING: HAVING va despues de GROUP BY').
feedback(subquery, syntax, 'Error de sintaxis en subconsulta: verifica el uso de IN o EXISTS').
feedback(ddl,      syntax, 'Error de sintaxis en DDL: verifica CREATE TABLE, ALTER TABLE o DROP TABLE').
feedback(dcl,      syntax, 'Error de sintaxis en DCL: verifica el uso de GRANT o REVOKE').
feedback(tcl,      syntax, 'Error de sintaxis en TCL: verifica el uso de COMMIT, ROLLBACK o SAVEPOINT').
feedback(aggregate,syntax, 'Error de sintaxis en AGGREGATE: verifica el uso de COUNT, SUM, AVG, MAX o MIN').

% ------------------------------------------
% EVALUAR consulta
% ------------------------------------------
evaluar(SQL, Nivel, correcto, none, 'Tu consulta es correcta. Buen trabajo!') :-
  tipo_consulta(SQL, Tipo),
  keywords_validas(SQL, Tipo, Nivel).

evaluar(SQL, Nivel, incorrecto, syntax, Feedback) :-
  tipo_consulta(SQL, Tipo),
  \+ keywords_validas(SQL, Tipo, Nivel),
  feedback(Tipo, syntax, Feedback).

evaluar(_, _, incorrecto, syntax, 'No se reconoce el tipo de consulta. Verifica la estructura de tu SQL.') :-
  true.
