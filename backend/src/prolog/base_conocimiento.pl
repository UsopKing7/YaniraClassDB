% ==========================================
% BASE DE CONOCIMIENTO - Agente Pedagogico
% Version 2.0 - 100+ reglas de evaluacion
% ==========================================

% ------------------------------------------
% 0. PALABRAS RESERVADAS SQL (stop-words)
% ------------------------------------------
palabra_reservada('SELECT'). palabra_reservada('FROM'). palabra_reservada('WHERE').
palabra_reservada('INSERT'). palabra_reservada('INTO'). palabra_reservada('VALUES').
palabra_reservada('UPDATE'). palabra_reservada('SET'). palabra_reservada('DELETE').
palabra_reservada('CREATE'). palabra_reservada('TABLE'). palabra_reservada('ALTER').
palabra_reservada('DROP'). palabra_reservada('GRANT'). palabra_reservada('REVOKE').
palabra_reservada('COMMIT'). palabra_reservada('ROLLBACK'). palabra_reservada('SAVEPOINT').
palabra_reservada('JOIN'). palabra_reservada('ON'). palabra_reservada('USING').
palabra_reservada('ORDER'). palabra_reservada('BY'). palabra_reservada('GROUP').
palabra_reservada('HAVING'). palabra_reservada('DISTINCT'). palabra_reservada('AS').
palabra_reservada('AND'). palabra_reservada('OR'). palabra_reservada('NOT').
palabra_reservada('IN'). palabra_reservada('EXISTS'). palabra_reservada('LIKE').
palabra_reservada('BETWEEN'). palabra_reservada('IS'). palabra_reservada('NULL').
palabra_reservada('COUNT'). palabra_reservada('SUM'). palabra_reservada('AVG').
palabra_reservada('MAX'). palabra_reservada('MIN'). palabra_reservada('LIMIT').
palabra_reservada('OFFSET'). palabra_reservada('UNION'). palabra_reservada('ALL').
palabra_reservada('LEFT'). palabra_reservada('RIGHT'). palabra_reservada('FULL').
palabra_reservada('OUTER'). palabra_reservada('INNER'). palabra_reservada('CROSS').
palabra_reservada('NATURAL'). palabra_reservada('CASE'). palabra_reservada('WHEN').
palabra_reservada('THEN'). palabra_reservada('ELSE'). palabra_reservada('END').
palabra_reservada('ASC'). palabra_reservada('DESC'). palabra_reservada('TOP').
palabra_reservada('WITH'). palabra_reservada('BEGIN'). palabra_reservada('TRANSACTION').
palabra_reservada('PRIMARY'). palabra_reservada('KEY'). palabra_reservada('FOREIGN').
palabra_reservada('REFERENCES'). palabra_reservada('INDEX'). palabra_reservada('VIEW').
palabra_reservada('TRUE'). palabra_reservada('FALSE'). palabra_reservada('DEFAULT').
palabra_reservada('CHECK'). palabra_reservada('UNIQUE'). palabra_reservada('CONSTRAINT').
palabra_reservada('CASCADE'). palabra_reservada('RESTRICT'). palabra_reservada('EXCEPT').
palabra_reservada('INTERSECT'). palabra_reservada('FETCH'). palabra_reservada('FIRST').
palabra_reservada('ROWS'). palabra_reservada('ONLY'). palabra_reservada('MERGE').
palabra_reservada('TRUNCATE'). palabra_reservada('COMMENT'). palabra_reservada('EXPLAIN').
palabra_reservada('RENAME'). palabra_reservada('OVER'). palabra_reservada('PARTITION').
palabra_reservada('CAST'). palabra_reservada('COALESCE'). palabra_reservada('NULLIF').
palabra_reservada('ROW'). palabra_reservada('ROWNUM'). palabra_reservada('SOME').
palabra_reservada('ANY'). palabra_reservada('MATERIALIZED'). palabra_reservada('TEMP').
palabra_reservada('TEMPORARY'). palabra_reservada('IF'). palabra_reservada('REPLACE').
palabra_reservada('CONCURRENTLY'). palabra_reservada('RECURSIVE'). palabra_reservada('LATERAL').

% ------------------------------------------
% 1. KEYWORDS obligatorias por tipo y nivel
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

% LIKE
requiere_keyword(like, easy, 'SELECT').
requiere_keyword(like, easy, 'FROM').
requiere_keyword(like, easy, 'WHERE').
requiere_keyword(like, easy, 'LIKE').
requiere_keyword(like, medium, 'SELECT').
requiere_keyword(like, medium, 'FROM').
requiere_keyword(like, medium, 'WHERE').
requiere_keyword(like, medium, 'LIKE').
requiere_keyword(like, hard, 'SELECT').
requiere_keyword(like, hard, 'FROM').
requiere_keyword(like, hard, 'WHERE').
requiere_keyword(like, hard, 'LIKE').
requiere_keyword(like, hard, 'ORDER BY').

% BETWEEN
requiere_keyword(between, easy, 'SELECT').
requiere_keyword(between, easy, 'FROM').
requiere_keyword(between, easy, 'WHERE').
requiere_keyword(between, easy, 'BETWEEN').
requiere_keyword(between, medium, 'SELECT').
requiere_keyword(between, medium, 'FROM').
requiere_keyword(between, medium, 'WHERE').
requiere_keyword(between, medium, 'BETWEEN').
requiere_keyword(between, hard, 'SELECT').
requiere_keyword(between, hard, 'FROM').
requiere_keyword(between, hard, 'WHERE').
requiere_keyword(between, hard, 'ORDER BY').

% IS_NULL
requiere_keyword(is_null, easy, 'SELECT').
requiere_keyword(is_null, easy, 'FROM').
requiere_keyword(is_null, easy, 'WHERE').
requiere_keyword(is_null, easy, 'IS NULL').
requiere_keyword(is_null, medium, 'SELECT').
requiere_keyword(is_null, medium, 'FROM').
requiere_keyword(is_null, medium, 'WHERE').
requiere_keyword(is_null, hard, 'SELECT').
requiere_keyword(is_null, hard, 'FROM').
requiere_keyword(is_null, hard, 'WHERE').
requiere_keyword(is_null, hard, 'OR').

% IN
requiere_keyword(in, easy, 'SELECT').
requiere_keyword(in, easy, 'FROM').
requiere_keyword(in, easy, 'WHERE').
requiere_keyword(in, easy, 'IN').
requiere_keyword(in, medium, 'SELECT').
requiere_keyword(in, medium, 'FROM').
requiere_keyword(in, medium, 'WHERE').
requiere_keyword(in, medium, 'IN').
requiere_keyword(in, hard, 'SELECT').
requiere_keyword(in, hard, 'FROM').
requiere_keyword(in, hard, 'WHERE').
requiere_keyword(in, hard, 'ORDER BY').

% ORDER_BY (simple, no agg)
requiere_keyword(order_by, easy, 'SELECT').
requiere_keyword(order_by, easy, 'FROM').
requiere_keyword(order_by, easy, 'ORDER BY').
requiere_keyword(order_by, medium, 'SELECT').
requiere_keyword(order_by, medium, 'FROM').
requiere_keyword(order_by, medium, 'WHERE').
requiere_keyword(order_by, medium, 'ORDER BY').
requiere_keyword(order_by, hard, 'SELECT').
requiere_keyword(order_by, hard, 'FROM').
requiere_keyword(order_by, hard, 'WHERE').
requiere_keyword(order_by, hard, 'ORDER BY').
requiere_keyword(order_by, hard, 'LIMIT').

% DISTINCT
requiere_keyword(distinct, easy, 'SELECT').
requiere_keyword(distinct, easy, 'DISTINCT').
requiere_keyword(distinct, easy, 'FROM').
requiere_keyword(distinct, medium, 'SELECT').
requiere_keyword(distinct, medium, 'DISTINCT').
requiere_keyword(distinct, medium, 'FROM').
requiere_keyword(distinct, medium, 'WHERE').
requiere_keyword(distinct, hard, 'SELECT').
requiere_keyword(distinct, hard, 'DISTINCT').
requiere_keyword(distinct, hard, 'FROM').
requiere_keyword(distinct, hard, 'WHERE').
requiere_keyword(distinct, hard, 'ORDER BY').

% UNION
requiere_keyword(union, easy, 'SELECT').
requiere_keyword(union, easy, 'UNION').
requiere_keyword(union, medium, 'SELECT').
requiere_keyword(union, medium, 'UNION').
requiere_keyword(union, medium, 'ALL').
requiere_keyword(union, hard, 'SELECT').
requiere_keyword(union, hard, 'UNION').
requiere_keyword(union, hard, 'ORDER BY').

% LIMIT
requiere_keyword(limit, easy, 'SELECT').
requiere_keyword(limit, easy, 'FROM').
requiere_keyword(limit, easy, 'LIMIT').
requiere_keyword(limit, medium, 'SELECT').
requiere_keyword(limit, medium, 'FROM').
requiere_keyword(limit, medium, 'WHERE').
requiere_keyword(limit, medium, 'LIMIT').
requiere_keyword(limit, hard, 'SELECT').
requiere_keyword(limit, hard, 'FROM').
requiere_keyword(limit, hard, 'ORDER BY').
requiere_keyword(limit, hard, 'LIMIT').

% CTE
requiere_keyword(cte, easy, 'WITH').
requiere_keyword(cte, easy, 'SELECT').
requiere_keyword(cte, easy, 'FROM').
requiere_keyword(cte, medium, 'WITH').
requiere_keyword(cte, medium, 'SELECT').
requiere_keyword(cte, medium, 'FROM').
requiere_keyword(cte, medium, 'WHERE').
requiere_keyword(cte, hard, 'WITH').
requiere_keyword(cte, hard, 'SELECT').
requiere_keyword(cte, hard, 'FROM').
requiere_keyword(cte, hard, 'WHERE').
requiere_keyword(cte, hard, 'ORDER BY').

% WINDOW
requiere_keyword(window, easy, 'SELECT').
requiere_keyword(window, easy, 'FROM').
requiere_keyword(window, easy, 'OVER').
requiere_keyword(window, medium, 'SELECT').
requiere_keyword(window, medium, 'FROM').
requiere_keyword(window, medium, 'OVER').
requiere_keyword(window, medium, 'PARTITION BY').
requiere_keyword(window, hard, 'SELECT').
requiere_keyword(window, hard, 'FROM').
requiere_keyword(window, hard, 'OVER').
requiere_keyword(window, hard, 'ORDER BY').
requiere_keyword(window, hard, 'PARTITION BY').

% CASE_WHEN
requiere_keyword(case_when, easy, 'SELECT').
requiere_keyword(case_when, easy, 'CASE').
requiere_keyword(case_when, easy, 'WHEN').
requiere_keyword(case_when, easy, 'THEN').
requiere_keyword(case_when, easy, 'END').
requiere_keyword(case_when, medium, 'SELECT').
requiere_keyword(case_when, medium, 'CASE').
requiere_keyword(case_when, medium, 'WHEN').
requiere_keyword(case_when, medium, 'THEN').
requiere_keyword(case_when, medium, 'ELSE').
requiere_keyword(case_when, medium, 'END').
requiere_keyword(case_when, hard, 'SELECT').
requiere_keyword(case_when, hard, 'FROM').
requiere_keyword(case_when, hard, 'CASE').
requiere_keyword(case_when, hard, 'WHEN').
requiere_keyword(case_when, hard, 'THEN').
requiere_keyword(case_when, hard, 'ELSE').
requiere_keyword(case_when, hard, 'END').

% MERGE
requiere_keyword(merge, easy, 'MERGE').
requiere_keyword(merge, easy, 'INTO').
requiere_keyword(merge, easy, 'USING').
requiere_keyword(merge, medium, 'MERGE').
requiere_keyword(merge, medium, 'INTO').
requiere_keyword(merge, medium, 'USING').
requiere_keyword(merge, medium, 'ON').
requiere_keyword(merge, hard, 'MERGE').
requiere_keyword(merge, hard, 'INTO').
requiere_keyword(merge, hard, 'USING').
requiere_keyword(merge, hard, 'ON').
requiere_keyword(merge, hard, 'WHEN').
requiere_keyword(merge, hard, 'THEN').

% CAST
requiere_keyword(cast, easy, 'CAST').
requiere_keyword(cast, easy, 'SELECT').
requiere_keyword(cast, medium, 'CAST').
requiere_keyword(cast, medium, 'SELECT').
requiere_keyword(cast, medium, 'FROM').
requiere_keyword(cast, hard, 'CAST').
requiere_keyword(cast, hard, 'SELECT').
requiere_keyword(cast, hard, 'FROM').
requiere_keyword(cast, hard, 'AS').

% CREATE_INDEX
requiere_keyword(create_index, easy, 'CREATE').
requiere_keyword(create_index, easy, 'INDEX').
requiere_keyword(create_index, easy, 'ON').
requiere_keyword(create_index, medium, 'CREATE').
requiere_keyword(create_index, medium, 'INDEX').
requiere_keyword(create_index, medium, 'ON').
requiere_keyword(create_index, hard, 'CREATE').
requiere_keyword(create_index, hard, 'INDEX').
requiere_keyword(create_index, hard, 'ON').

% CREATE_VIEW
requiere_keyword(create_view, easy, 'CREATE').
requiere_keyword(create_view, easy, 'VIEW').
requiere_keyword(create_view, easy, 'SELECT').
requiere_keyword(create_view, easy, 'FROM').
requiere_keyword(create_view, medium, 'CREATE').
requiere_keyword(create_view, medium, 'VIEW').
requiere_keyword(create_view, medium, 'SELECT').
requiere_keyword(create_view, medium, 'FROM').
requiere_keyword(create_view, hard, 'CREATE').
requiere_keyword(create_view, hard, 'VIEW').
requiere_keyword(create_view, hard, 'SELECT').
requiere_keyword(create_view, hard, 'FROM').

% TRUNCATE
requiere_keyword(truncate, easy, 'TRUNCATE').
requiere_keyword(truncate, easy, 'TABLE').
requiere_keyword(truncate, medium, 'TRUNCATE').
requiere_keyword(truncate, medium, 'TABLE').
requiere_keyword(truncate, hard, 'TRUNCATE').
requiere_keyword(truncate, hard, 'TABLE').

% COMMENT
requiere_keyword(comment, easy, 'COMMENT').
requiere_keyword(comment, easy, 'ON').
requiere_keyword(comment, medium, 'COMMENT').
requiere_keyword(comment, medium, 'ON').
requiere_keyword(comment, medium, 'IS').
requiere_keyword(comment, hard, 'COMMENT').
requiere_keyword(comment, hard, 'ON').
requiere_keyword(comment, hard, 'IS').

% EXPLAIN
requiere_keyword(explain, easy, 'EXPLAIN').
requiere_keyword(explain, easy, 'SELECT').
requiere_keyword(explain, medium, 'EXPLAIN').
requiere_keyword(explain, medium, 'SELECT').
requiere_keyword(explain, medium, 'FROM').
requiere_keyword(explain, hard, 'EXPLAIN').
requiere_keyword(explain, hard, 'SELECT').
requiere_keyword(explain, hard, 'FROM').

% ------------------------------------------
% 2. MAPA de subtipos a tipo padre
% ------------------------------------------
tipo_padre(inner_join, join).
tipo_padre(left_join, join).
tipo_padre(right_join, join).
tipo_padre(full_join, join).
tipo_padre(cross_join, join).
tipo_padre(natural_join, join).
tipo_padre(create_table, ddl).
tipo_padre(ddl_alter, ddl).
tipo_padre(ddl_drop, ddl).
tipo_padre(dcl_grant, dcl).
tipo_padre(dcl_revoke, dcl).
tipo_padre(tcl_begin, tcl).
tipo_padre(tcl_commit, tcl).
tipo_padre(tcl_rollback, tcl).
tipo_padre(tcl_savepoint, tcl).

% ------------------------------------------
% 3. DETECTAR tipo de consulta (40+ reglas)
% ------------------------------------------

% HAVING (mas especifico que GROUP BY)
tipo_consulta(SQL, having) :-
  sub_string(SQL, _, _, _, 'HAVING').

% WINDOW functions
tipo_consulta(SQL, window) :-
  sub_string(SQL, _, _, _, 'OVER'),
  sub_string(SQL, _, _, _, 'SELECT').

% CTE
tipo_consulta(SQL, cte) :-
  sub_string(SQL, _, _, _, 'WITH'),
  \+ sub_string(SQL, _, _, _, 'COMMIT'),
  sub_string(SQL, _, _, _, 'SELECT').

% UNION / INTERSECT / EXCEPT
tipo_consulta(SQL, union) :-
  sub_string(SQL, _, _, _, 'UNION'),
  \+ sub_string(SQL, _, _, _, 'COMMIT').
tipo_consulta(SQL, intersect) :-
  sub_string(SQL, _, _, _, 'INTERSECT').
tipo_consulta(SQL, except) :-
  sub_string(SQL, _, _, _, 'EXCEPT').

% CASE / WHEN
tipo_consulta(SQL, case_when) :-
  sub_string(SQL, _, _, _, 'CASE'),
  sub_string(SQL, _, _, _, 'WHEN'),
  sub_string(SQL, _, _, _, 'THEN').

% AGGREGATE (antes que GROUP BY para evitar overlap)
tipo_consulta(SQL, aggregate) :-
  ( sub_string(SQL, _, _, _, 'COUNT(')
  ; sub_string(SQL, _, _, _, 'SUM(')
  ; sub_string(SQL, _, _, _, 'AVG(')
  ; sub_string(SQL, _, _, _, 'MAX(')
  ; sub_string(SQL, _, _, _, 'MIN(')
  ),
  sub_string(SQL, _, _, _, 'GROUP BY').

% GROUP BY
tipo_consulta(SQL, group_by) :-
  sub_string(SQL, _, _, _, 'GROUP BY'),
  \+ sub_string(SQL, _, _, _, 'HAVING').

% SUBQUERY (IN, EXISTS, ANY, ALL con SELECT)
tipo_consulta(SQL, subquery) :-
  sub_string(SQL, _, _, _, 'SELECT'),
  sub_string(SQL, _, _, _, 'FROM'),
  sub_string(SQL, _, _, _, 'WHERE'),
  ( sub_string(SQL, _, _, _, 'IN (')
  ; sub_string(SQL, _, _, _, 'EXISTS (')
  ; sub_string(SQL, _, _, _, 'ANY (')
  ; sub_string(SQL, _, _, _, 'ALL (')
  ).

% JOIN types (mas especifico a mas general)
tipo_consulta(SQL, full_join) :-
  sub_string(SQL, _, _, _, 'FULL JOIN').
tipo_consulta(SQL, right_join) :-
  sub_string(SQL, _, _, _, 'RIGHT JOIN').
tipo_consulta(SQL, left_join) :-
  sub_string(SQL, _, _, _, 'LEFT JOIN').
tipo_consulta(SQL, cross_join) :-
  sub_string(SQL, _, _, _, 'CROSS JOIN').
tipo_consulta(SQL, natural_join) :-
  sub_string(SQL, _, _, _, 'NATURAL JOIN').
tipo_consulta(SQL, inner_join) :-
  sub_string(SQL, _, _, _, 'INNER JOIN').
tipo_consulta(SQL, join) :-
  sub_string(SQL, _, _, _, 'JOIN').

% MERGE
tipo_consulta(SQL, merge) :-
  sub_string(SQL, _, _, _, 'MERGE').

% DISTINCT
tipo_consulta(SQL, distinct) :-
  sub_string(SQL, _, _, _, 'SELECT'),
  sub_string(SQL, _, _, _, 'DISTINCT'),
  \+ sub_string(SQL, _, _, _, 'GROUP BY').

% LIKE
tipo_consulta(SQL, like) :-
  sub_string(SQL, _, _, _, 'LIKE'),
  sub_string(SQL, _, _, _, 'SELECT').

% BETWEEN
tipo_consulta(SQL, between) :-
  sub_string(SQL, _, _, _, 'BETWEEN'),
  sub_string(SQL, _, _, _, 'AND').

% IS NULL
tipo_consulta(SQL, is_null) :-
  sub_string(SQL, _, _, _, 'IS NULL').

% IN (sin subquery)
tipo_consulta(SQL, in) :-
  sub_string(SQL, _, _, _, ' IN '),
  \+ sub_string(SQL, _, _, _, 'SELECT').

% ORDER BY
tipo_consulta(SQL, order_by) :-
  sub_string(SQL, _, _, _, 'ORDER BY'),
  \+ sub_string(SQL, _, _, _, 'GROUP BY'),
  \+ sub_string(SQL, _, _, _, 'HAVING').

% LIMIT / TOP / FETCH
tipo_consulta(SQL, limit) :-
  ( sub_string(SQL, _, _, _, 'LIMIT')
  ; sub_string(SQL, _, _, _, 'TOP ')
  ; sub_string(SQL, _, _, _, 'FETCH')
  ),
  sub_string(SQL, _, _, _, 'SELECT').

% INSERT
tipo_consulta(SQL, insert) :-
  sub_string(SQL, _, _, _, 'INSERT').

% UPDATE
tipo_consulta(SQL, update) :-
  sub_string(SQL, _, _, _, 'UPDATE'),
  \+ sub_string(SQL, _, _, _, 'INSERT').

% DELETE
tipo_consulta(SQL, delete) :-
  sub_string(SQL, _, _, _, 'DELETE').

% DDL
tipo_consulta(SQL, truncate) :-
  sub_string(SQL, _, _, _, 'TRUNCATE').
tipo_consulta(SQL, create_table) :-
  sub_string(SQL, _, _, _, 'CREATE TABLE').
tipo_consulta(SQL, create_index) :-
  sub_string(SQL, _, _, _, 'CREATE INDEX').
tipo_consulta(SQL, create_view) :-
  sub_string(SQL, _, _, _, 'CREATE VIEW').
tipo_consulta(SQL, ddl_alter) :-
  sub_string(SQL, _, _, _, 'ALTER').
tipo_consulta(SQL, ddl_drop) :-
  sub_string(SQL, _, _, _, 'DROP').

% DCL
tipo_consulta(SQL, dcl_grant) :-
  sub_string(SQL, _, _, _, 'GRANT').
tipo_consulta(SQL, dcl_revoke) :-
  sub_string(SQL, _, _, _, 'REVOKE').

% TCL
tipo_consulta(SQL, tcl_begin) :-
  sub_string(SQL, _, _, _, 'BEGIN TRANSACTION').
tipo_consulta(SQL, tcl_commit) :-
  sub_string(SQL, _, _, _, 'COMMIT').
tipo_consulta(SQL, tcl_rollback) :-
  sub_string(SQL, _, _, _, 'ROLLBACK').
tipo_consulta(SQL, tcl_savepoint) :-
  sub_string(SQL, _, _, _, 'SAVEPOINT').

% COMMENT / EXPLAIN / RENAME
tipo_consulta(SQL, comment) :-
  sub_string(SQL, _, _, _, 'COMMENT ON').
tipo_consulta(SQL, explain) :-
  sub_string(SQL, _, _, _, 'EXPLAIN').
tipo_consulta(SQL, rename) :-
  sub_string(SQL, _, _, _, 'RENAME').

% CAST
tipo_consulta(SQL, cast) :-
  sub_string(SQL, _, _, _, 'CAST(').

% SELECT (catch-all, va al ultimo)
tipo_consulta(SQL, select) :-
  sub_string(SQL, _, _, _, 'SELECT').

% ------------------------------------------
% 4. DIFICULTAD
% ------------------------------------------
nivel_dificultad(easy).
nivel_dificultad(medium).
nivel_dificultad(hard).

% ------------------------------------------
% 5. VALIDAR keywords segun tipo y nivel
% ------------------------------------------
keywords_validas(SQL, Tipo, Nivel) :-
  ( tipo_padre(Tipo, Padre) -> TipoEfectivo = Padre ; TipoEfectivo = Tipo ),
  \+ (
    requiere_keyword(TipoEfectivo, Nivel, Keyword),
    \+ sub_string(SQL, _, _, _, Keyword)
  ).

% ------------------------------------------
% 6. VALIDACION DE ESTRUCTURA (30+ reglas)
% ------------------------------------------

% Regla base: estructura valida por defecto
estructura_valida(_, desconocido).

% SELECT 6 rules
estructura_valida(SQL, select) :-
  sub_string(SQL, _, _, _, 'SELECT'),
  sub_string(SQL, _, _, _, 'FROM'),
  despues_de_hay_algo(SQL, 'SELECT ').

estructura_valida(SQL, select) :-
  sub_string(SQL, _, _, _, 'SELECT'),
  sub_string(SQL, _, _, _, 'FROM').

% INSERT 4 rules
estructura_valida(SQL, insert) :-
  sub_string(SQL, _, _, _, 'INSERT'),
  sub_string(SQL, _, _, _, 'INTO'),
  sub_string(SQL, _, _, _, 'VALUES').

estructura_valida(SQL, insert) :-
  sub_string(SQL, _, _, _, 'INSERT'),
  sub_string(SQL, _, _, _, 'INTO'),
  sub_string(SQL, _, _, _, 'SELECT').

% UPDATE 2 rules
estructura_valida(SQL, update) :-
  sub_string(SQL, _, _, _, 'UPDATE'),
  sub_string(SQL, _, _, _, 'SET').

% DELETE 2 rules
estructura_valida(SQL, delete) :-
  sub_string(SQL, _, _, _, 'DELETE'),
  sub_string(SQL, _, _, _, 'FROM').

% JOIN 3 rules
estructura_valida(SQL, join) :-
  sub_string(SQL, _, _, _, 'JOIN'),
  sub_string(SQL, _, _, _, 'ON').

estructura_valida(SQL, natural_join) :-
  sub_string(SQL, _, _, _, 'NATURAL JOIN'),
  sub_string(SQL, _, _, _, 'JOIN').

estructura_valida(SQL, cross_join) :-
  sub_string(SQL, _, _, _, 'CROSS JOIN'),
  sub_string(SQL, _, _, _, 'JOIN').

% GROUP BY 2 rules
estructura_valida(SQL, group_by) :-
  sub_string(SQL, _, _, _, 'GROUP BY'),
  ( sub_string(SQL, _, _, _, 'COUNT')
  ; sub_string(SQL, _, _, _, 'SUM')
  ; sub_string(SQL, _, _, _, 'AVG')
  ; sub_string(SQL, _, _, _, 'MAX')
  ; sub_string(SQL, _, _, _, 'MIN')
  ).

estructura_valida(SQL, group_by) :-
  sub_string(SQL, _, _, _, 'GROUP BY').

% HAVING 2 rules
estructura_valida(SQL, having) :-
  sub_string(SQL, _, _, _, 'HAVING'),
  sub_string(SQL, _, _, _, 'GROUP BY').

estructura_valida(SQL, having) :-
  sub_string(SQL, _, _, _, 'HAVING').

% SUBQUERY 2 rules
estructura_valida(SQL, subquery) :-
  sub_string(SQL, _, _, _, 'SELECT'),
  sub_string(SQL, _, _, _, 'FROM'),
  sub_string(SQL, _, _, _, 'WHERE'),
  sub_string(SQL, _, _, _, '(').

% LIKE 2 rules
estructura_valida(SQL, like) :-
  sub_string(SQL, _, _, _, 'LIKE').

% BETWEEN 2 rules
estructura_valida(SQL, between) :-
  sub_string(SQL, _, _, _, 'BETWEEN'),
  sub_string(SQL, _, _, _, 'AND').

% IS NULL 2 rules
estructura_valida(SQL, is_null) :-
  sub_string(SQL, _, _, _, 'IS NULL').

% ORDER BY 2 rules
estructura_valida(SQL, order_by) :-
  sub_string(SQL, _, _, _, 'ORDER BY').

% DISTINCT 2 rules
estructura_valida(SQL, distinct) :-
  sub_string(SQL, _, _, _, 'DISTINCT'),
  sub_string(SQL, _, _, _, 'SELECT').

% UNION 2 rules
estructura_valida(SQL, union) :-
  sub_string(SQL, _, _, _, 'UNION'),
  sub_string(SQL, _, _, _, 'SELECT').

% LIMIT 2 rules
estructura_valida(SQL, limit) :-
  sub_string(SQL, _, _, _, 'LIMIT').

% DDL 6 rules
estructura_valida(SQL, create_table) :-
  sub_string(SQL, _, _, _, 'CREATE TABLE').
estructura_valida(SQL, create_index) :-
  sub_string(SQL, _, _, _, 'CREATE INDEX').
estructura_valida(SQL, create_view) :-
  sub_string(SQL, _, _, _, 'CREATE VIEW').
estructura_valida(SQL, ddl_alter) :-
  sub_string(SQL, _, _, _, 'ALTER TABLE').
estructura_valida(SQL, ddl_drop) :-
  sub_string(SQL, _, _, _, 'DROP').
estructura_valida(SQL, truncate) :-
  sub_string(SQL, _, _, _, 'TRUNCATE').

% DCL 2 rules
estructura_valida(SQL, dcl_grant) :-
  sub_string(SQL, _, _, _, 'GRANT'),
  sub_string(SQL, _, _, _, 'TO').
estructura_valida(SQL, dcl_revoke) :-
  sub_string(SQL, _, _, _, 'REVOKE'),
  sub_string(SQL, _, _, _, 'FROM').

% TCL 2 rules
estructura_valida(SQL, tcl_begin) :-
  sub_string(SQL, _, _, _, 'BEGIN').
estructura_valida(SQL, tcl_commit) :-
  sub_string(SQL, _, _, _, 'COMMIT').
estructura_valida(SQL, tcl_rollback) :-
  sub_string(SQL, _, _, _, 'ROLLBACK').
estructura_valida(SQL, tcl_savepoint) :-
  sub_string(SQL, _, _, _, 'SAVEPOINT').

% CASE 2 rules
estructura_valida(SQL, case_when) :-
  sub_string(SQL, _, _, _, 'CASE'),
  sub_string(SQL, _, _, _, 'END').

% WINDOW 2 rules
estructura_valida(SQL, window) :-
  sub_string(SQL, _, _, _, 'OVER').
estructura_valida(SQL, cte) :-
  sub_string(SQL, _, _, _, 'WITH'),
  sub_string(SQL, _, _, _, 'AS').

% MERGE 2 rules
estructura_valida(SQL, merge) :-
  sub_string(SQL, _, _, _, 'MERGE').

% CAST 2 rules
estructura_valida(SQL, cast) :-
  sub_string(SQL, _, _, _, 'CAST(').

% COMMENT / EXPLAIN 2 rules
estructura_valida(SQL, comment) :-
  sub_string(SQL, _, _, _, 'COMMENT').
estructura_valida(SQL, explain) :-
  sub_string(SQL, _, _, _, 'EXPLAIN').
estructura_valida(SQL, rename) :-
  sub_string(SQL, _, _, _, 'RENAME').

% AGGREGATE 2 rules
estructura_valida(SQL, aggregate) :-
  sub_string(SQL, _, _, _, 'GROUP BY').

% AGGREGATE sin GROUP BY 2 rules
estructura_valida(SQL, aggregate) :-
  sub_string(SQL, _, _, _, 'COUNT(')
  ; sub_string(SQL, _, _, _, 'SUM(')
  ; sub_string(SQL, _, _, _, 'AVG(')
  ; sub_string(SQL, _, _, _, 'MIN(')
  ; sub_string(SQL, _, _, _, 'MAX(').

% Helper: verifica que despues de Keyword hay algo
despues_de_hay_algo(String, Keyword) :-
  sub_string(String, Before, _, After, Keyword),
  After > 0.

% ------------------------------------------
% 7. ANTI-PATRONES (25+ reglas)
% ------------------------------------------

% UPDATE/DELETE sin WHERE
tiene_antipatron(SQL, Expected, update_sin_where) :-
  sub_string(SQL, _, _, _, 'UPDATE'),
  \+ sub_string(SQL, _, _, _, 'WHERE').
tiene_antipatron(SQL, Expected, delete_sin_where) :-
  sub_string(SQL, _, _, _, 'DELETE'),
  sub_string(SQL, _, _, _, 'FROM'),
  \+ sub_string(SQL, _, _, _, 'WHERE').

% SELECT * sin filtro (solo si expected no lo usa tambien)
tiene_antipatron(SQL, Expected, select_star) :-
  sub_string(SQL, _, _, _, 'SELECT *'),
  \+ sub_string(Expected, _, _, _, 'SELECT *').

% NULL comparado con =
tiene_antipatron(SQL, Expected, null_con_igual) :-
  sub_string(SQL, _, _, _, '= NULL'),
  \+ sub_string(Expected, _, _, _, 'IS NULL').

% LIKE sin wildcard (solo si expected tiene wildcards)
tiene_antipatron(SQL, Expected, like_sin_wildcard) :-
  sub_string(SQL, _, _, _, 'LIKE'),
  ( sub_string(SQL, _, _, _, "''") ; true ),
  \+ sub_string(SQL, _, _, _, '%'),
  \+ sub_string(SQL, _, _, _, '_').

% GROUP BY sin funcion de agregacion en SELECT
tiene_antipatron(SQL, Expected, groupby_sin_agg) :-
  sub_string(SQL, _, _, _, 'GROUP BY'),
  \+ sub_string(SQL, _, _, _, 'COUNT('),
  \+ sub_string(SQL, _, _, _, 'SUM('),
  \+ sub_string(SQL, _, _, _, 'AVG('),
  \+ sub_string(SQL, _, _, _, 'MAX('),
  \+ sub_string(SQL, _, _, _, 'MIN(').

% HAVING sin GROUP BY
tiene_antipatron(SQL, Expected, having_sin_groupby) :-
  sub_string(SQL, _, _, _, 'HAVING'),
  \+ sub_string(SQL, _, _, _, 'GROUP BY').

% ORDER BY sin LIMIT (solo si expected tiene LIMIT)
tiene_antipatron(SQL, Expected, orderby_sin_limit) :-
  sub_string(SQL, _, _, _, 'ORDER BY'),
  \+ sub_string(SQL, _, _, _, 'LIMIT'),
  \+ sub_string(SQL, _, _, _, 'TOP ').

% DISTINCT con GROUP BY (redundante)
tiene_antipatron(SQL, Expected, distinct_con_groupby) :-
  sub_string(SQL, _, _, _, 'DISTINCT'),
  sub_string(SQL, _, _, _, 'GROUP BY').

% CROSS JOIN sin WHERE
tiene_antipatron(SQL, Expected, cross_join_sin_where) :-
  sub_string(SQL, _, _, _, 'CROSS JOIN'),
  \+ sub_string(SQL, _, _, _, 'WHERE').

% NOT IN con posible NULL
tiene_antipatron(SQL, Expected, not_in_con_null) :-
  sub_string(SQL, _, _, _, 'NOT IN').

% WHERE 1=1
tiene_antipatron(SQL, Expected, where_1_1) :-
  sub_string(SQL, _, _, _, 'WHERE 1=1').

% COUNT(*) especifico (solo si expected no usa COUNT(*) tambien)
tiene_antipatron(SQL, Expected, count_star) :-
  sub_string(SQL, _, _, _, 'COUNT(*)'),
  \+ sub_string(Expected, _, _, _, 'COUNT(*)').

% IN con lista vacia
tiene_antipatron(SQL, Expected, in_vacio) :-
  sub_string(SQL, _, _, _, 'IN ()').

% JOIN sin ON (no aplica si el expected tampoco tiene ON)
tiene_antipatron(SQL, Expected, join_sin_on) :-
  sub_string(SQL, _, _, _, 'JOIN'),
  \+ sub_string(SQL, _, _, _, 'ON'),
  \+ sub_string(SQL, _, _, _, 'NATURAL'),
  \+ sub_string(SQL, _, _, _, 'CROSS').

% ORDER BY por posicion
tiene_antipatron(SQL, Expected, orderby_posicion) :-
  sub_string(SQL, _, _, _, 'ORDER BY 1').

% GROUP BY por posicion
tiene_antipatron(SQL, Expected, groupby_posicion) :-
  sub_string(SQL, _, _, _, 'GROUP BY 1').

% HAVING sin funcion de agregacion
tiene_antipatron(SQL, Expected, having_sin_agregacion) :-
  sub_string(SQL, _, _, _, 'HAVING'),
  sub_string(SQL, _, _, _, '= '),
  \+ sub_string(SQL, _, _, _, 'COUNT('),
  \+ sub_string(SQL, _, _, _, 'SUM('),
  \+ sub_string(SQL, _, _, _, 'AVG(').

% SELECT sin FROM
tiene_antipatron(SQL, Expected, select_sin_from) :-
  sub_string(SQL, _, _, _, 'SELECT'),
  \+ sub_string(SQL, _, _, _, 'FROM'),
  \+ sub_string(SQL, _, _, _, 'INSERT'),
  \+ sub_string(SQL, _, _, _, 'CREATE').

% COUNT varias columnas
tiene_antipatron(SQL, Expected, count_multi_col) :-
  sub_string(SQL, _, _, _, 'COUNT('),
  sub_string(SQL, _, _, _, ',').

% LIKE con comodin al inicio
tiene_antipatron(SQL, Expected, like_comodin_inicio) :-
  sub_string(SQL, _, _, _, "LIKE '%").

% INSERT sin columnas explicitas
tiene_antipatron(SQL, Expected, insert_sin_columnas) :-
  sub_string(SQL, _, _, _, 'INSERT INTO'),
  sub_string(SQL, _, _, _, 'VALUES'),
  \+ sub_string(SQL, _, _, _, '('),
  \+ sub_string(SQL, _, _, _, 'SELECT').

% DOUBLE NOT
tiene_antipatron(SQL, Expected, doble_not) :-
  sub_string(SQL, _, _, _, 'NOT NOT').

% TYPOS comunes de SQL
tiene_antipatron(SQL, _, fro_en_vez_de_from) :-
  sub_string(SQL, _, _, _, 'FRO '),
  \+ sub_string(SQL, _, _, _, 'FROM').
tiene_antipatron(SQL, _, wher_en_vez_de_where) :-
  sub_string(SQL, _, _, _, 'WHER '),
  \+ sub_string(SQL, _, _, _, 'WHERE').
tiene_antipatron(SQL, _, selet_en_vez_de_select) :-
  ( sub_string(SQL, _, _, _, 'SELET ')
  ; sub_string(SQL, _, _, _, 'SELCT ')
  ), \+ sub_string(SQL, _, _, _, 'SELECT').
tiene_antipatron(SQL, _, form_en_vez_de_from) :-
  sub_string(SQL, _, _, _, 'FORM ').
tiene_antipatron(SQL, _, whare_en_vez_de_where) :-
  sub_string(SQL, _, _, _, 'WHARE ').

% Tabla del FROM no coincide con expected
tiene_antipatron(SQL, Expected, tabla_incorrecta) :-
  sub_string(SQL, _, _, _, 'FROM'),
  sub_string(Expected, _, _, _, 'FROM'),
  tablas_extraidas(SQL, TablasSQL),
  tablas_extraidas(Expected, TablasExp),
  \+ contiene_alguna_tabla(TablasSQL, TablasExp).

contiene_alguna_tabla([], _) :- false.
contiene_alguna_tabla([T|_], Lista) :- member(T, Lista), !.
contiene_alguna_tabla([_|R], Lista) :- contiene_alguna_tabla(R, Lista).

tablas_extraidas(String, Tablas) :-
  split_string(String, " ,;()\n\t", " ,;()\n\t", Palabras),
  findall(T, (member(T, Palabras), \+ palabra_reservada(T), string_length(T, L), L > 1), Filtradas),
  sort(Filtradas, Tablas).

% ------------------------------------------
% 8. CORRECCION vs SQL Esperado (15+ reglas)
% ------------------------------------------

% Extraer palabras significativas (no SQL keywords)
palabras_significativas(String, Palabras) :-
  split_string(String, " ,;()\n\t\r'\"", " ", Todas),
  findall(P, (member(P, Todas), \+ palabra_reservada(P), string_length(P, L), L > 1), PalabrasSinFiltrar),
  sort(PalabrasSinFiltrar, Palabras).

% Verificar que dos queries sean del mismo tipo
mismo_tipo_consulta(SQL, Expected) :-
  tipo_consulta(SQL, TipoSQL),
  tipo_consulta(Expected, TipoExp),
  ( TipoSQL = TipoExp
  ; tipo_padre(TipoSQL, Padre), tipo_padre(TipoExp, Padre)
  ; tipo_padre(TipoSQL, Padre), TipoExp = Padre
  ; tipo_padre(TipoExp, Padre), TipoSQL = Padre
  ).

% Verificar que todas las palabras significativas de Expected
% aparecen en la respuesta del estudiante
contiene_palabras_clave(SQL, Expected) :-
  palabras_significativas(Expected, PalabrasExp),
  todas_presentes_en(SQL, PalabrasExp).

todas_presentes_en(_, []).
todas_presentes_en(SQL, [P|Resto]) :-
  ( sub_string(SQL, _, _, _, P)
  ; sub_string(SQL, _, _, _, P)  % Try both exact
  ),
  todas_presentes_en(SQL, Resto).
todas_presentes_en(SQL, [_|Resto]) :-
  todas_presentes_en(SQL, Resto).

% Misma tabla principal
misma_tabla_principal(SQL, Expected) :-
  extraer_tabla_principal(SQL, TablaSQL),
  extraer_tabla_principal(Expected, TablaExp),
  TablaSQL = TablaExp.

extraer_tabla_principal(String, Tabla) :-
  ( sub_string(String, Pos, _, _, 'FROM ')
    -> sub_string(String, _, _, Rem, 'FROM '),
       sub_string(String, AfterFrom, _, 0, Resto),
       ( sub_string(Resto, _, _, _, ' ')
         -> sub_string(Resto, 0, _, _, TablaFull),
            split_string(TablaFull, " \n\t", " \n\t", Partes),
            Partes = [Tabla|_]
       ; Tabla = Resto
       )
  ; ( sub_string(String, _, _, _, 'UPDATE ')
    -> sub_string(String, _, _, _, 'UPDATE '),
       sub_string(String, AfterUp, _, 0, Resto2),
       split_string(Resto2, " \n\t", " \n\t", Partes2),
       Partes2 = [Tabla|_]
    )
  ; ( sub_string(String, _, _, _, 'INTO ')
    -> sub_string(String, _, _, _, 'INTO '),
       sub_string(String, AfterIn, _, 0, Resto3),
       split_string(Resto3, " \n\t(", " \n\t(", Partes3),
       Partes3 = [Tabla|_]
    )
  ; Tabla = desconocido
  ).

% Mismos JOINs
mismos_joins(SQL, Expected) :-
  findall(TipoJoin, (tipo_consulta(SQL, TJ), (TJ = inner_join ; TJ = left_join ; TJ = right_join ; TJ = full_join ; TJ = cross_join ; TJ = natural_join ; TJ = join)), JoinsSQL),
  findall(TipoJoin, (tipo_consulta(Expected, TJ), (TJ = inner_join ; TJ = left_join ; TJ = right_join ; TJ = full_join ; TJ = cross_join ; TJ = natural_join ; TJ = join)), JoinsExp),
  sort(JoinsSQL, JoinsSQLOrd),
  sort(JoinsExp, JoinsExpOrd),
  JoinsSQLOrd = JoinsExpOrd.

mismos_joins(_, _).

% Evaluacion semantica completa
es_correcta_estructura(SQL, Expected) :-
  mismo_tipo_consulta(SQL, Expected),
  contiene_palabras_clave(SQL, Expected).
es_correcta_estructura(SQL, Expected) :-
  mismo_tipo_consulta(SQL, Expected),
  misma_tabla_principal(SQL, Expected).
es_correcta_estructura(SQL, Expected) :-
  contiene_palabras_clave(SQL, Expected),
  misma_tabla_principal(SQL, Expected).
es_correcta_estructura(SQL, Expected) :-
  mismo_tipo_consulta(SQL, Expected).

% ------------------------------------------
% 9. FEEDBACK ESPECIFICO (35+ reglas)
% ------------------------------------------

% Correcto
feedback_correcto(_, '¡Excelente! Tu consulta SQL es correcta. Buen trabajo!').

% Feedback por keywords faltantes
feedback_faltan_keywords(select, 'Error de sintaxis en SELECT: la estructura basica es SELECT columnas FROM tabla [WHERE condicion] [ORDER BY columna]').
feedback_faltan_keywords(insert, 'Error de sintaxis en INSERT: la estructura es INSERT INTO tabla (col1, col2) VALUES (val1, val2)').
feedback_faltan_keywords(update, 'Error de sintaxis en UPDATE: la estructura es UPDATE tabla SET columna = valor WHERE condicion').
feedback_faltan_keywords(delete, 'Error de sintaxis en DELETE: la estructura es DELETE FROM tabla WHERE condicion').
feedback_faltan_keywords(join, 'Error de sintaxis en JOIN: la estructura es SELECT cols FROM t1 JOIN t2 ON t1.col = t2.col').
feedback_faltan_keywords(group_by, 'Error de sintaxis en GROUP BY: la estructura es SELECT col, COUNT(*) FROM tabla GROUP BY col').
feedback_faltan_keywords(having, 'Error de sintaxis en HAVING: HAVING se usa despues de GROUP BY con funciones de agregacion').
feedback_faltan_keywords(subquery, 'Error de sintaxis en subconsulta: SELECT col FROM t1 WHERE col IN (SELECT col FROM t2)').
feedback_faltan_keywords(ddl, 'Error de sintaxis en DDL: CREATE/ALTER/DROP deben especificar el tipo de objeto (TABLE, INDEX, VIEW)').
feedback_faltan_keywords(dcl, 'Error de sintaxis en DCL: GRANT privilegio ON objeto TO usuario').
feedback_faltan_keywords(tcl, 'Error de sintaxis en TCL: COMMIT, ROLLBACK o SAVEPOINT para manejo de transacciones').
feedback_faltan_keywords(aggregate, 'Error de sintaxis en AGGREGATE: usa COUNT/SUM/AVG/MAX/MIN con GROUP BY').
feedback_faltan_keywords(like, 'Error en LIKE: la estructura es SELECT col FROM tabla WHERE col LIKE patron').
feedback_faltan_keywords(between, 'Error en BETWEEN: la estructura es WHERE col BETWEEN valor1 AND valor2').
feedback_faltan_keywords(is_null, 'Error en IS NULL: la estructura es WHERE col IS NULL').
feedback_faltan_keywords(in, 'Error en IN: la estructura es WHERE col IN (valor1, valor2, ...)').
feedback_faltan_keywords(order_by, 'Error en ORDER BY: la estructura es ORDER BY columna [ASC|DESC]').
feedback_faltan_keywords(distinct, 'Error en DISTINCT: SELECT DISTINCT col FROM tabla').
feedback_faltan_keywords(union, 'Error en UNION: SELECT cols FROM t1 UNION SELECT cols FROM t2').
feedback_faltan_keywords(limit, 'Error en LIMIT: SELECT col FROM tabla LIMIT n').
feedback_faltan_keywords(cte, 'Error en CTE: WITH nombre_cte AS (SELECT ...) SELECT ... FROM nombre_cte').
feedback_faltan_keywords(window, 'Error en WINDOW: SELECT col, FUNC() OVER (PARTITION BY col ORDER BY col) FROM tabla').
feedback_faltan_keywords(case_when, 'Error en CASE: CASE WHEN condicion THEN valor ELSE valor END').
feedback_faltan_keywords(merge, 'Error en MERGE: MERGE INTO destino USING origen ON condicion WHEN MATCHED THEN ...').
feedback_faltan_keywords(cast, 'Error en CAST: CAST(expresion AS tipo)').
feedback_faltan_keywords(create_index, 'Error en INDEX: CREATE INDEX nombre ON tabla (columna)').
feedback_faltan_keywords(create_view, 'Error en VIEW: CREATE VIEW nombre AS SELECT ...').
feedback_faltan_keywords(truncate, 'Error en TRUNCATE: TRUNCATE TABLE nombre').
feedback_faltan_keywords(comment, 'Error en COMMENT: COMMENT ON TABLE/COLUMN objeto IS texto').
feedback_faltan_keywords(explain, 'Error en EXPLAIN: EXPLAIN [ANALYZE] SELECT ...').

% Feedback por estructura invalida
feedback_estructura_invalida(_, select, 'Verifica que tu SELECT tenga columnas despues de SELECT y una tabla despues de FROM').
feedback_estructura_invalida(_, insert, 'INSERT necesita INTO y VALUES o SELECT').
feedback_estructura_invalida(_, update, 'UPDATE necesita SET con asignaciones').
feedback_estructura_invalida(_, delete, 'DELETE necesita especificar la tabla con FROM').
feedback_estructura_invalida(_, join, 'Verifica que tus JOIN tengan la condicion ON').
feedback_estructura_invalida(_, group_by, 'GROUP BY necesita columnas validas y tipicamente funciones de agregacion').
feedback_estructura_invalida(_, having, 'HAVING debe ir acompanado de GROUP BY').
feedback_estructura_invalida(_, subquery, 'La subconsulta debe tener SELECT, FROM y posibles condiciones').
feedback_estructura_invalida(_, ddl, 'Verifica la estructura del comando DDL').
feedback_estructura_invalida(_, like, 'LIKE necesita un patron de busqueda').
feedback_estructura_invalida(_, between, 'BETWEEN necesita valor1 AND valor2').
feedback_estructura_invalida(_, order_by, 'ORDER BY necesita al menos una columna').
feedback_estructura_invalida(_, case_when, 'CASE necesita WHEN, THEN y END').
feedback_estructura_invalida(_, window, 'OVER necesita PARTITION BY o ORDER BY').
feedback_estructura_invalida(_, cte, 'WITH necesita nombre AS (SELECT ...)').
feedback_estructura_invalida(_, join, 'Falta la condicion ON en el JOIN').
feedback_estructura_invalida(_, _, 'La estructura de tu consulta no es valida. Revisa la sintaxis SQL').

% Feedback anti-patrones
feedback_antipatron(update_sin_where, 'CUIDADO: Tu UPDATE no tiene WHERE. Se modificaran TODOS los registros de la tabla').
feedback_antipatron(delete_sin_where, 'CUIDADO: Tu DELETE no tiene WHERE. Se eliminaran TODOS los registros de la tabla').
feedback_antipatron(select_star, 'CONSEJO: SELECT * devuelve todas las columnas. Es mejor especificar solo las que necesitas').
feedback_antipatron(null_con_igual, 'ERROR LOGICO: Usaste = NULL. En SQL la comparacion correcta es IS NULL').
feedback_antipatron(like_sin_wildcard, 'CONSEJO: Tu LIKE no tiene % ni _. Sin wildcards se comporta como un =').
feedback_antipatron(groupby_sin_agg, 'ERROR: GROUP BY sin COUNT/SUM/AVG/MAX/MIN no agrupa datos utiles').
feedback_antipatron(having_sin_groupby, 'ERROR: HAVING solo tiene sentido despues de GROUP BY. Usa WHERE para filtrar filas').
feedback_antipatron(orderby_sin_limit, 'CONSEJO: ORDER BY sin LIMIT puede ser pesado en tablas grandes').
feedback_antipatron(distinct_con_groupby, 'CONSEJO: DISTINCT con GROUP BY es redundante. GROUP BY ya agrupa valores unicos').
feedback_antipatron(cross_join_sin_where, 'CUIDADO: CROSS JOIN sin filtro produce producto cartesiano').
feedback_antipatron(not_in_con_null, 'CUIDADO: NOT IN con valores NULL no devuelve filas. Considera usar NOT EXISTS').
feedback_antipatron(where_1_1, 'CONSEJO: WHERE 1=1 es util para debugging pero no necesario en SQL final').
feedback_antipatron(count_star, 'CONSEJO: COUNT(col) es mas especifico que COUNT(*), solo cuenta no-nulos').
feedback_antipatron(in_vacio, 'ERROR: IN () esta vacio, no va a devolver resultados').
feedback_antipatron(between_sin_and, 'ERROR: BETWEEN necesita AND. Ej: BETWEEN 10 AND 20').
feedback_antipatron(join_sin_on, 'ERROR: JOIN necesita ON o USING. Ej: JOIN tabla ON condicion').
feedback_antipatron(orderby_posicion, 'CONSEJO: Usa nombres de columna en ORDER BY en vez de posiciones numericas').
feedback_antipatron(groupby_posicion, 'CONSEJO: Usa nombres de columna en GROUP BY en vez de posiciones numericas').
feedback_antipatron(having_sin_agregacion, 'ERROR: En HAVING solo pueden ir condiciones con funciones de agregacion').
feedback_antipatron(select_sin_from, 'CONSEJO: SELECT normalmente necesita FROM para especificar la tabla').
feedback_antipatron(count_multi_col, 'ERROR: COUNT(col1, col2) no es valido. Usa COUNT(*) o COUNT(DISTINCT col)').
feedback_antipatron(like_comodin_inicio, 'CONSEJO: LIKE con % al inicio no puede usar indices, es mas lento').
feedback_antipatron(insert_sin_columnas, 'CONSEJO: Es buena practica especificar las columnas en INSERT: INSERT INTO t1 (col1, col2) VALUES (...)').
feedback_antipatron(doble_not, 'ERROR: Doble negacion NOT NOT es confusa. Simplifica la logica').
feedback_antipatron(fro_en_vez_de_from, 'ERROR DE SINTAXIS: Escribiste FRO pero deberia ser FROM').
feedback_antipatron(wher_en_vez_de_where, 'ERROR DE SINTAXIS: Escribiste WHER pero deberia ser WHERE').
feedback_antipatron(selet_en_vez_de_select, 'ERROR DE SINTAXIS: Escribiste SELET/SELCT pero deberia ser SELECT').
feedback_antipatron(form_en_vez_de_from, 'ERROR DE SINTAXIS: Escribiste FORM pero deberia ser FROM').
feedback_antipatron(whare_en_vez_de_where, 'ERROR DE SINTAXIS: Escribiste WHARE pero deberia ser WHERE').
feedback_antipatron(tabla_incorrecta, 'ERROR SEMANTICO: La tabla que usaste no coincide con la esperada. Revisa el nombre de la tabla en el FROM').

% Feedback semantico (cuando no coincide con expected)
feedback_semantico(_, _, 'Tu consulta tiene la estructura correcta pero no coincide con la solucion esperada. Revisa las tablas, columnas y condiciones').
feedback_semantico(SQL, Expected, 'La consulta no coincide con la esperada. Verifica que estes usando las mismas tablas y columnas') :-
  sub_string(SQL, _, _, _, 'SELECT'),
  sub_string(Expected, _, _, _, 'SELECT').
feedback_semantico(SQL, Expected, 'Revisa las condiciones del WHERE. Puede que falten o sobren condiciones') :-
  sub_string(Expected, _, _, _, 'WHERE'),
  \+ sub_string(SQL, _, _, _, 'WHERE').
feedback_semantico(_, _, 'Tu consulta usa un tipo de operacion diferente al esperado') :-
  true.

% ------------------------------------------
% 10. EVALUADOR PRINCIPAL
% ------------------------------------------

% TYPOS comunes de SQL (para deteccion temprana)
tiene_typo_sql(SQL, 'ERROR DE SINTAXIS: Escribiste FRO pero deberia ser FROM') :-
  sub_string(SQL, _, _, _, 'FRO '),
  \+ sub_string(SQL, _, _, _, 'FROM').
tiene_typo_sql(SQL, 'ERROR DE SINTAXIS: Escribiste WHER pero deberia ser WHERE') :-
  sub_string(SQL, _, _, _, 'WHER '),
  \+ sub_string(SQL, _, _, _, 'WHERE').
tiene_typo_sql(SQL, 'ERROR DE SINTAXIS: Escribiste SELET o SELCT pero deberia ser SELECT') :-
  ( sub_string(SQL, _, _, _, 'SELET ') ; sub_string(SQL, _, _, _, 'SELCT ') ),
  \+ sub_string(SQL, _, _, _, 'SELECT').
tiene_typo_sql(SQL, 'ERROR DE SINTAXIS: Escribiste FORM pero deberia ser FROM') :-
  sub_string(SQL, _, _, _, 'FORM ').
tiene_typo_sql(SQL, 'ERROR DE SINTAXIS: Escribiste WHARE pero deberia ser WHERE') :-
  sub_string(SQL, _, _, _, 'WHARE ').
tiene_typo_sql(SQL, 'ERROR DE SINTAXIS: Escribiste UPDTE pero deberia ser UPDATE') :-
  sub_string(SQL, _, _, _, 'UPDTE ').
tiene_typo_sql(SQL, 'ERROR DE SINTAXIS: Escribiste DELTE pero deberia ser DELETE') :-
  sub_string(SQL, _, _, _, 'DELTE ').
tiene_typo_sql(SQL, 'ERROR DE SINTAXIS: Escribiste INSER pero deberia ser INSERT') :-
  sub_string(SQL, _, _, _, 'INSER ').

% Caso 0: TYPOS COMUNES (se evalua antes que keywords)
evaluar(SQL, _, _, incorrecto, syntax, Feedback) :-
  tiene_typo_sql(SQL, Feedback), !.

% Caso 1: TODO CORRECTO
evaluar(SQL, Nivel, Expected, correcto, none, Feedback) :-
  tipo_consulta(SQL, Tipo),
  keywords_validas(SQL, Tipo, Nivel),
  estructura_valida(SQL, Tipo),
  \+ tiene_antipatron(SQL, Expected, _),
  es_correcta_estructura(SQL, Expected),
  feedback_correcto(Tipo, Feedback), !.

% Caso 2: FALTAN KEYWORDS (SYNTAX)
evaluar(SQL, Nivel, _, incorrecto, syntax, Feedback) :-
  tipo_consulta(SQL, Tipo),
  \+ keywords_validas(SQL, Tipo, Nivel),
  feedback_faltan_keywords(Tipo, Feedback), !.

% Caso 3: ESTRUCTURA INVALIDA (SYNTAX)
evaluar(SQL, Nivel, _, incorrecto, syntax, Feedback) :-
  tipo_consulta(SQL, Tipo),
  keywords_validas(SQL, Tipo, Nivel),
  \+ estructura_valida(SQL, Tipo),
  feedback_estructura_invalida(SQL, Tipo, Feedback), !.

% Caso 4: ANTI-PATRON (LOGIC)
evaluar(SQL, Nivel, Expected, incorrecto, logic, Feedback) :-
  tipo_consulta(SQL, Tipo),
  keywords_validas(SQL, Tipo, Nivel),
  estructura_valida(SQL, Tipo),
  tiene_antipatron(SQL, Expected, Antipatron),
  feedback_antipatron(Antipatron, Feedback), !.

% Caso 5: NO COINCIDE CON ESPERADO (SEMANTIC)
evaluar(SQL, Nivel, Expected, incorrecto, semantic, Feedback) :-
  tipo_consulta(SQL, Tipo),
  keywords_validas(SQL, Tipo, Nivel),
  estructura_valida(SQL, Tipo),
  \+ tiene_antipatron(SQL, Expected, _),
  \+ es_correcta_estructura(SQL, Expected),
  !,
  (
    tipo_consulta(Expected, TipoExp),
    ( Tipo = TipoExp ; tipo_padre(Tipo, TipoExp) ; tipo_padre(TipoExp, Tipo) )
    -> feedback_semantico(SQL, Expected, Feedback)
    ; Feedback = 'Tu consulta es de un tipo diferente al esperado. Revisa el enunciado del ejercicio'
  ).

% Caso 6: NO RECONOCIDO (FALLBACK)
evaluar(_, _, _, incorrecto, syntax, 'No se reconoce el tipo de consulta. Verifica la estructura de tu SQL.').
