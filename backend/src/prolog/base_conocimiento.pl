% ==========================================
% BASE DE CONOCIMIENTO - Agente Pedagogico SQL
% Version 3.0 - Completa
% ==========================================

% --- 0. PALABRAS RESERVADAS SQL ---

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

% --- 1. ESQUEMA DE REFERENCIA ---

tabla(usuarios). tabla(pedidos). tabla(clientes).
tabla(categorias). tabla(productos). tabla(ventas).
tabla(empleados). tabla(comentarios). tabla(premium_users).

columna(usuarios, id). columna(usuarios, nombre). columna(usuarios, email).
columna(usuarios, edad). columna(usuarios, ciudad). columna(usuarios, rol).
columna(usuarios, activo).
columna(pedidos, id). columna(pedidos, id_usuario). columna(pedidos, nombre).
columna(pedidos, total). columna(pedidos, fecha). columna(pedidos, estado).
columna(clientes, id). columna(clientes, nombre). columna(clientes, email).
columna(clientes, edad). columna(clientes, ciudad). columna(clientes, activo).
columna(categorias, id). columna(categorias, nombre).
columna(productos, id). columna(productos, nombre). columna(productos, precio).
columna(ventas, id). columna(ventas, id_vendedor). columna(ventas, total).
columna(empleados, id). columna(empleados, nombre). columna(empleados, id_jefe).
columna(empleados, salario).
columna(comentarios, id). columna(comentarios, id_usuario).
columna(premium_users, id_usuario). columna(premium_users, nombre).

% --- 2. KEYWORDS REQUERIDAS POR TIPO Y NIVEL ---

requiere_keyword(select, easy, 'SELECT'). requiere_keyword(select, easy, 'FROM').
requiere_keyword(select, medium, 'SELECT'). requiere_keyword(select, medium, 'FROM').
requiere_keyword(select, medium, 'WHERE'). requiere_keyword(select, hard, 'SELECT').
requiere_keyword(select, hard, 'FROM'). requiere_keyword(select, hard, 'WHERE').

requiere_keyword(order_by, easy, 'SELECT'). requiere_keyword(order_by, easy, 'FROM').
requiere_keyword(order_by, easy, 'ORDER BY'). requiere_keyword(order_by, medium, 'SELECT').
requiere_keyword(order_by, medium, 'FROM'). requiere_keyword(order_by, medium, 'WHERE').
requiere_keyword(order_by, medium, 'ORDER BY'). requiere_keyword(order_by, hard, 'SELECT').
requiere_keyword(order_by, hard, 'FROM'). requiere_keyword(order_by, hard, 'ORDER BY').
requiere_keyword(order_by, hard, 'LIMIT').

requiere_keyword(insert, easy, 'INSERT'). requiere_keyword(insert, easy, 'INTO').
requiere_keyword(insert, easy, 'VALUES'). requiere_keyword(insert, medium, 'INSERT').
requiere_keyword(insert, medium, 'INTO'). requiere_keyword(insert, medium, 'VALUES').
requiere_keyword(insert, hard, 'INSERT'). requiere_keyword(insert, hard, 'INTO').
requiere_keyword(insert, hard, 'SELECT').

requiere_keyword(update, easy, 'UPDATE'). requiere_keyword(update, easy, 'SET').
requiere_keyword(update, medium, 'UPDATE'). requiere_keyword(update, medium, 'SET').
requiere_keyword(update, medium, 'WHERE'). requiere_keyword(update, hard, 'UPDATE').
requiere_keyword(update, hard, 'SET'). requiere_keyword(update, hard, 'WHERE').

requiere_keyword(delete, easy, 'DELETE'). requiere_keyword(delete, easy, 'FROM').
requiere_keyword(delete, medium, 'DELETE'). requiere_keyword(delete, medium, 'FROM').
requiere_keyword(delete, medium, 'WHERE'). requiere_keyword(delete, hard, 'DELETE').
requiere_keyword(delete, hard, 'FROM'). requiere_keyword(delete, hard, 'WHERE').

requiere_keyword(join, easy, 'SELECT'). requiere_keyword(join, easy, 'FROM').
requiere_keyword(join, easy, 'JOIN'). requiere_keyword(join, easy, 'ON').
requiere_keyword(join, medium, 'SELECT'). requiere_keyword(join, medium, 'FROM').
requiere_keyword(join, medium, 'JOIN'). requiere_keyword(join, medium, 'ON').
requiere_keyword(join, medium, 'WHERE'). requiere_keyword(join, hard, 'SELECT').
requiere_keyword(join, hard, 'FROM'). requiere_keyword(join, hard, 'JOIN').
requiere_keyword(join, hard, 'ON'). requiere_keyword(join, hard, 'WHERE').
requiere_keyword(join, hard, 'ORDER BY').

requiere_keyword(group_by, easy, 'SELECT'). requiere_keyword(group_by, easy, 'FROM').
requiere_keyword(group_by, easy, 'GROUP BY'). requiere_keyword(group_by, medium, 'SELECT').
requiere_keyword(group_by, medium, 'FROM'). requiere_keyword(group_by, medium, 'GROUP BY').
requiere_keyword(group_by, medium, 'WHERE'). requiere_keyword(group_by, hard, 'SELECT').
requiere_keyword(group_by, hard, 'FROM'). requiere_keyword(group_by, hard, 'GROUP BY').
requiere_keyword(group_by, hard, 'HAVING').

requiere_keyword(aggregate, easy, 'SELECT'). requiere_keyword(aggregate, easy, 'FROM').
requiere_keyword(aggregate, medium, 'SELECT'). requiere_keyword(aggregate, medium, 'FROM').
requiere_keyword(aggregate, medium, 'GROUP BY'). requiere_keyword(aggregate, hard, 'SELECT').
requiere_keyword(aggregate, hard, 'FROM'). requiere_keyword(aggregate, hard, 'GROUP BY').
requiere_keyword(aggregate, hard, 'HAVING').

requiere_keyword(subquery, easy, 'SELECT'). requiere_keyword(subquery, easy, 'FROM').
requiere_keyword(subquery, easy, 'WHERE'). requiere_keyword(subquery, medium, 'SELECT').
requiere_keyword(subquery, medium, 'FROM'). requiere_keyword(subquery, medium, 'WHERE').
requiere_keyword(subquery, medium, 'IN'). requiere_keyword(subquery, hard, 'SELECT').
requiere_keyword(subquery, hard, 'FROM'). requiere_keyword(subquery, hard, 'WHERE').
requiere_keyword(subquery, hard, 'EXISTS').

requiere_keyword(like, easy, 'SELECT'). requiere_keyword(like, easy, 'FROM').
requiere_keyword(like, easy, 'WHERE'). requiere_keyword(like, easy, 'LIKE').
requiere_keyword(like, medium, 'SELECT'). requiere_keyword(like, medium, 'FROM').
requiere_keyword(like, medium, 'WHERE'). requiere_keyword(like, medium, 'LIKE').
requiere_keyword(like, hard, 'SELECT'). requiere_keyword(like, hard, 'FROM').
requiere_keyword(like, hard, 'WHERE'). requiere_keyword(like, hard, 'ORDER BY').

requiere_keyword(between, easy, 'SELECT'). requiere_keyword(between, easy, 'FROM').
requiere_keyword(between, easy, 'WHERE'). requiere_keyword(between, easy, 'BETWEEN').
requiere_keyword(between, medium, 'SELECT'). requiere_keyword(between, medium, 'FROM').
requiere_keyword(between, medium, 'WHERE'). requiere_keyword(between, medium, 'BETWEEN').
requiere_keyword(between, hard, 'SELECT'). requiere_keyword(between, hard, 'FROM').
requiere_keyword(between, hard, 'WHERE'). requiere_keyword(between, hard, 'ORDER BY').

requiere_keyword(is_null, easy, 'SELECT'). requiere_keyword(is_null, easy, 'FROM').
requiere_keyword(is_null, easy, 'WHERE'). requiere_keyword(is_null, easy, 'IS NULL').
requiere_keyword(is_null, medium, 'SELECT'). requiere_keyword(is_null, medium, 'FROM').
requiere_keyword(is_null, medium, 'WHERE'). requiere_keyword(is_null, hard, 'SELECT').
requiere_keyword(is_null, hard, 'FROM'). requiere_keyword(is_null, hard, 'WHERE').
requiere_keyword(is_null, hard, 'OR').

requiere_keyword(in, easy, 'SELECT'). requiere_keyword(in, easy, 'FROM').
requiere_keyword(in, easy, 'WHERE'). requiere_keyword(in, easy, 'IN').
requiere_keyword(in, medium, 'SELECT'). requiere_keyword(in, medium, 'FROM').
requiere_keyword(in, medium, 'WHERE'). requiere_keyword(in, medium, 'IN').
requiere_keyword(in, hard, 'SELECT'). requiere_keyword(in, hard, 'FROM').
requiere_keyword(in, hard, 'WHERE'). requiere_keyword(in, hard, 'ORDER BY').

requiere_keyword(distinct, easy, 'SELECT'). requiere_keyword(distinct, easy, 'DISTINCT').
requiere_keyword(distinct, easy, 'FROM'). requiere_keyword(distinct, medium, 'SELECT').
requiere_keyword(distinct, medium, 'DISTINCT'). requiere_keyword(distinct, medium, 'FROM').
requiere_keyword(distinct, medium, 'WHERE'). requiere_keyword(distinct, hard, 'SELECT').
requiere_keyword(distinct, hard, 'DISTINCT'). requiere_keyword(distinct, hard, 'FROM').
requiere_keyword(distinct, hard, 'WHERE').

requiere_keyword(union, easy, 'SELECT'). requiere_keyword(union, easy, 'UNION').
requiere_keyword(union, medium, 'SELECT'). requiere_keyword(union, medium, 'UNION').
requiere_keyword(union, medium, 'ALL'). requiere_keyword(union, hard, 'SELECT').
requiere_keyword(union, hard, 'UNION').

requiere_keyword(limit, easy, 'SELECT'). requiere_keyword(limit, easy, 'FROM').
requiere_keyword(limit, easy, 'LIMIT'). requiere_keyword(limit, medium, 'SELECT').
requiere_keyword(limit, medium, 'FROM'). requiere_keyword(limit, medium, 'WHERE').
requiere_keyword(limit, medium, 'LIMIT'). requiere_keyword(limit, hard, 'SELECT').
requiere_keyword(limit, hard, 'FROM'). requiere_keyword(limit, hard, 'ORDER BY').
requiere_keyword(limit, hard, 'LIMIT').

requiere_keyword(having, easy, 'SELECT'). requiere_keyword(having, easy, 'FROM').
requiere_keyword(having, easy, 'GROUP BY'). requiere_keyword(having, easy, 'HAVING').
requiere_keyword(having, medium, 'SELECT'). requiere_keyword(having, medium, 'FROM').
requiere_keyword(having, medium, 'GROUP BY'). requiere_keyword(having, medium, 'HAVING').
requiere_keyword(having, medium, 'WHERE'). requiere_keyword(having, hard, 'SELECT').
requiere_keyword(having, hard, 'FROM'). requiere_keyword(having, hard, 'GROUP BY').
requiere_keyword(having, hard, 'HAVING').

requiere_keyword(cte, easy, 'WITH'). requiere_keyword(cte, easy, 'SELECT').
requiere_keyword(cte, easy, 'FROM'). requiere_keyword(cte, medium, 'WITH').
requiere_keyword(cte, medium, 'SELECT'). requiere_keyword(cte, medium, 'FROM').
requiere_keyword(cte, medium, 'WHERE'). requiere_keyword(cte, hard, 'WITH').
requiere_keyword(cte, hard, 'SELECT'). requiere_keyword(cte, hard, 'FROM').

requiere_keyword(window, easy, 'SELECT'). requiere_keyword(window, easy, 'FROM').
requiere_keyword(window, easy, 'OVER'). requiere_keyword(window, medium, 'SELECT').
requiere_keyword(window, medium, 'FROM'). requiere_keyword(window, medium, 'OVER').
requiere_keyword(window, medium, 'PARTITION BY'). requiere_keyword(window, hard, 'SELECT').
requiere_keyword(window, hard, 'FROM'). requiere_keyword(window, hard, 'OVER').
requiere_keyword(window, hard, 'ORDER BY').

requiere_keyword(case_when, easy, 'SELECT'). requiere_keyword(case_when, easy, 'CASE').
requiere_keyword(case_when, easy, 'WHEN'). requiere_keyword(case_when, easy, 'THEN').
requiere_keyword(case_when, easy, 'END'). requiere_keyword(case_when, medium, 'CASE').
requiere_keyword(case_when, medium, 'WHEN'). requiere_keyword(case_when, medium, 'THEN').
requiere_keyword(case_when, medium, 'ELSE'). requiere_keyword(case_when, medium, 'END').
requiere_keyword(case_when, hard, 'SELECT'). requiere_keyword(case_when, hard, 'FROM').
requiere_keyword(case_when, hard, 'CASE'). requiere_keyword(case_when, hard, 'WHEN').
requiere_keyword(case_when, hard, 'THEN'). requiere_keyword(case_when, hard, 'END').

requiere_keyword(ddl, easy, 'CREATE'). requiere_keyword(ddl, easy, 'TABLE').
requiere_keyword(ddl, medium, 'ALTER'). requiere_keyword(ddl, medium, 'TABLE').
requiere_keyword(ddl, hard, 'DROP'). requiere_keyword(ddl, hard, 'TABLE').

requiere_keyword(create_index, easy, 'CREATE'). requiere_keyword(create_index, easy, 'INDEX').
requiere_keyword(create_index, easy, 'ON'). requiere_keyword(create_index, medium, 'CREATE').
requiere_keyword(create_index, medium, 'INDEX'). requiere_keyword(create_index, medium, 'ON').
requiere_keyword(create_index, hard, 'CREATE'). requiere_keyword(create_index, hard, 'INDEX').
requiere_keyword(create_index, hard, 'ON').

requiere_keyword(create_view, easy, 'CREATE'). requiere_keyword(create_view, easy, 'VIEW').
requiere_keyword(create_view, easy, 'SELECT'). requiere_keyword(create_view, easy, 'FROM').
requiere_keyword(create_view, medium, 'CREATE'). requiere_keyword(create_view, medium, 'VIEW').
requiere_keyword(create_view, medium, 'SELECT'). requiere_keyword(create_view, medium, 'FROM').
requiere_keyword(create_view, hard, 'CREATE'). requiere_keyword(create_view, hard, 'VIEW').
requiere_keyword(create_view, hard, 'SELECT'). requiere_keyword(create_view, hard, 'FROM').

requiere_keyword(merge, easy, 'MERGE'). requiere_keyword(merge, easy, 'INTO').
requiere_keyword(merge, easy, 'USING'). requiere_keyword(merge, medium, 'MERGE').
requiere_keyword(merge, medium, 'INTO'). requiere_keyword(merge, medium, 'USING').
requiere_keyword(merge, medium, 'ON'). requiere_keyword(merge, hard, 'MERGE').
requiere_keyword(merge, hard, 'INTO'). requiere_keyword(merge, hard, 'USING').
requiere_keyword(merge, hard, 'ON').

requiere_keyword(cast, easy, 'CAST'). requiere_keyword(cast, easy, 'SELECT').
requiere_keyword(cast, medium, 'CAST'). requiere_keyword(cast, medium, 'SELECT').
requiere_keyword(cast, medium, 'FROM'). requiere_keyword(cast, hard, 'CAST').
requiere_keyword(cast, hard, 'SELECT'). requiere_keyword(cast, hard, 'FROM').

requiere_keyword(truncate, easy, 'TRUNCATE'). requiere_keyword(truncate, easy, 'TABLE').
requiere_keyword(truncate, medium, 'TRUNCATE'). requiere_keyword(truncate, medium, 'TABLE').
requiere_keyword(truncate, hard, 'TRUNCATE'). requiere_keyword(truncate, hard, 'TABLE').

requiere_keyword(dcl, easy, 'GRANT'). requiere_keyword(dcl, medium, 'GRANT').
requiere_keyword(dcl, medium, 'ON'). requiere_keyword(dcl, hard, 'REVOKE').
requiere_keyword(dcl, hard, 'ON'). requiere_keyword(dcl, hard, 'FROM').

requiere_keyword(tcl, easy, 'COMMIT'). requiere_keyword(tcl, medium, 'ROLLBACK').
requiere_keyword(tcl, hard, 'SAVEPOINT').

% --- 3. TIPO PADRE ---

tipo_padre(inner_join, join). tipo_padre(left_join, join).
tipo_padre(right_join, join). tipo_padre(full_join, join).
tipo_padre(cross_join, join). tipo_padre(natural_join, join).
tipo_padre(create_table, ddl). tipo_padre(ddl_alter, ddl).
tipo_padre(ddl_drop, ddl). tipo_padre(dcl_grant, dcl).
tipo_padre(dcl_revoke, dcl). tipo_padre(tcl_begin, tcl).
tipo_padre(tcl_commit, tcl). tipo_padre(tcl_rollback, tcl).
tipo_padre(tcl_savepoint, tcl).

% --- 4. DETECTAR TIPO DE CONSULTA ---

tipo_consulta(SQL, having) :- sub_string(SQL, _, _, _, 'HAVING').
tipo_consulta(SQL, window) :- sub_string(SQL, _, _, _, 'OVER'), sub_string(SQL, _, _, _, 'SELECT').
tipo_consulta(SQL, cte) :- sub_string(SQL, _, _, _, 'WITH'), sub_string(SQL, _, _, _, 'SELECT').
tipo_consulta(SQL, union) :- sub_string(SQL, _, _, _, 'UNION').
tipo_consulta(SQL, case_when) :- sub_string(SQL, _, _, _, 'CASE'), sub_string(SQL, _, _, _, 'WHEN').
tipo_consulta(SQL, aggregate) :- (sub_string(SQL, _, _, _, 'COUNT(');sub_string(SQL, _, _, _, 'SUM(');sub_string(SQL, _, _, _, 'AVG(');sub_string(SQL, _, _, _, 'MAX(');sub_string(SQL, _, _, _, 'MIN(')), sub_string(SQL, _, _, _, 'GROUP BY').
tipo_consulta(SQL, group_by) :- sub_string(SQL, _, _, _, 'GROUP BY'), \+ sub_string(SQL, _, _, _, 'HAVING').
tipo_consulta(SQL, subquery) :- sub_string(SQL, _, _, _, 'SELECT'), sub_string(SQL, _, _, _, 'FROM'), sub_string(SQL, _, _, _, 'WHERE'), (sub_string(SQL, _, _, _, 'IN (');sub_string(SQL, _, _, _, 'EXISTS (')).
tipo_consulta(SQL, full_join) :- sub_string(SQL, _, _, _, 'FULL JOIN').
tipo_consulta(SQL, right_join) :- sub_string(SQL, _, _, _, 'RIGHT JOIN').
tipo_consulta(SQL, left_join) :- sub_string(SQL, _, _, _, 'LEFT JOIN').
tipo_consulta(SQL, cross_join) :- sub_string(SQL, _, _, _, 'CROSS JOIN').
tipo_consulta(SQL, natural_join) :- sub_string(SQL, _, _, _, 'NATURAL JOIN').
tipo_consulta(SQL, inner_join) :- sub_string(SQL, _, _, _, 'INNER JOIN').
tipo_consulta(SQL, join) :- sub_string(SQL, _, _, _, 'JOIN').
tipo_consulta(SQL, merge) :- sub_string(SQL, _, _, _, 'MERGE').
tipo_consulta(SQL, distinct) :- sub_string(SQL, _, _, _, 'DISTINCT'), sub_string(SQL, _, _, _, 'SELECT').
tipo_consulta(SQL, like) :- sub_string(SQL, _, _, _, 'LIKE'), sub_string(SQL, _, _, _, 'SELECT').
tipo_consulta(SQL, between) :- sub_string(SQL, _, _, _, 'BETWEEN').
tipo_consulta(SQL, is_null) :- sub_string(SQL, _, _, _, 'IS NULL').
tipo_consulta(SQL, in) :- sub_string(SQL, _, _, _, ' IN '), \+ sub_string(SQL, _, _, _, 'SELECT').
tipo_consulta(SQL, order_by) :- sub_string(SQL, _, _, _, 'ORDER BY'), \+ sub_string(SQL, _, _, _, 'GROUP BY'), \+ sub_string(SQL, _, _, _, 'HAVING').
tipo_consulta(SQL, limit) :- (sub_string(SQL, _, _, _, 'LIMIT');sub_string(SQL, _, _, _, 'TOP ')), sub_string(SQL, _, _, _, 'SELECT').
tipo_consulta(SQL, insert) :- sub_string(SQL, _, _, _, 'INSERT').
tipo_consulta(SQL, update) :- sub_string(SQL, _, _, _, 'UPDATE').
tipo_consulta(SQL, delete) :- sub_string(SQL, _, _, _, 'DELETE').
tipo_consulta(SQL, truncate) :- sub_string(SQL, _, _, _, 'TRUNCATE').
tipo_consulta(SQL, create_table) :- sub_string(SQL, _, _, _, 'CREATE TABLE').
tipo_consulta(SQL, create_index) :- sub_string(SQL, _, _, _, 'CREATE INDEX').
tipo_consulta(SQL, create_view) :- sub_string(SQL, _, _, _, 'CREATE VIEW').
tipo_consulta(SQL, ddl_alter) :- sub_string(SQL, _, _, _, 'ALTER').
tipo_consulta(SQL, ddl_drop) :- sub_string(SQL, _, _, _, 'DROP').
tipo_consulta(SQL, dcl_grant) :- sub_string(SQL, _, _, _, 'GRANT').
tipo_consulta(SQL, dcl_revoke) :- sub_string(SQL, _, _, _, 'REVOKE').
tipo_consulta(SQL, tcl_begin) :- sub_string(SQL, _, _, _, 'BEGIN TRANSACTION').
tipo_consulta(SQL, tcl_commit) :- sub_string(SQL, _, _, _, 'COMMIT').
tipo_consulta(SQL, tcl_rollback) :- sub_string(SQL, _, _, _, 'ROLLBACK').
tipo_consulta(SQL, tcl_savepoint) :- sub_string(SQL, _, _, _, 'SAVEPOINT').
tipo_consulta(SQL, cast) :- sub_string(SQL, _, _, _, 'CAST(').
tipo_consulta(SQL, comment) :- sub_string(SQL, _, _, _, 'COMMENT ON').
tipo_consulta(SQL, explain) :- sub_string(SQL, _, _, _, 'EXPLAIN').
tipo_consulta(SQL, select) :- sub_string(SQL, _, _, _, 'SELECT').

nivel_dificultad(easy). nivel_dificultad(medium). nivel_dificultad(hard).

% --- 5. VALIDAR KEYWORDS ---

keywords_validas(SQL, Tipo, Nivel) :-
  ( tipo_padre(Tipo, Padre) -> TipoEfectivo = Padre ; TipoEfectivo = Tipo ),
  \+ ( requiere_keyword(TipoEfectivo, Nivel, Keyword), \+ sub_string(SQL, _, _, _, Keyword) ).

% --- 6. VALIDACION DE ESTRUCTURA ---

estructura_valida(SQL, select) :- sub_string(SQL, _, _, _, 'SELECT'), sub_string(SQL, _, _, _, 'FROM').
estructura_valida(SQL, insert) :- sub_string(SQL, _, _, _, 'INSERT'), sub_string(SQL, _, _, _, 'INTO'), (sub_string(SQL, _, _, _, 'VALUES');sub_string(SQL, _, _, _, 'SELECT')).
estructura_valida(SQL, update) :- sub_string(SQL, _, _, _, 'UPDATE'), sub_string(SQL, _, _, _, 'SET').
estructura_valida(SQL, delete) :- sub_string(SQL, _, _, _, 'DELETE'), sub_string(SQL, _, _, _, 'FROM').
estructura_valida(SQL, join) :- sub_string(SQL, _, _, _, 'JOIN'), sub_string(SQL, _, _, _, 'ON').
estructura_valida(SQL, inner_join) :- sub_string(SQL, _, _, _, 'JOIN'), sub_string(SQL, _, _, _, 'ON').
estructura_valida(SQL, left_join) :- sub_string(SQL, _, _, _, 'JOIN'), sub_string(SQL, _, _, _, 'ON').
estructura_valida(SQL, right_join) :- sub_string(SQL, _, _, _, 'JOIN'), sub_string(SQL, _, _, _, 'ON').
estructura_valida(SQL, full_join) :- sub_string(SQL, _, _, _, 'JOIN'), sub_string(SQL, _, _, _, 'ON').
estructura_valida(SQL, cross_join) :- sub_string(SQL, _, _, _, 'CROSS JOIN'), sub_string(SQL, _, _, _, 'JOIN').
estructura_valida(SQL, natural_join) :- sub_string(SQL, _, _, _, 'NATURAL JOIN'), sub_string(SQL, _, _, _, 'JOIN').
estructura_valida(SQL, group_by) :- sub_string(SQL, _, _, _, 'GROUP BY').
estructura_valida(SQL, having) :- sub_string(SQL, _, _, _, 'HAVING'), sub_string(SQL, _, _, _, 'GROUP BY').
estructura_valida(SQL, subquery) :- sub_string(SQL, _, _, _, 'SELECT'), sub_string(SQL, _, _, _, 'FROM'), sub_string(SQL, _, _, _, '(').
estructura_valida(SQL, aggregate) :- sub_string(SQL, _, _, _, 'GROUP BY').
estructura_valida(SQL, like) :- sub_string(SQL, _, _, _, 'LIKE').
estructura_valida(SQL, between) :- sub_string(SQL, _, _, _, 'BETWEEN').
estructura_valida(SQL, is_null) :- sub_string(SQL, _, _, _, 'IS NULL').
estructura_valida(SQL, order_by) :- sub_string(SQL, _, _, _, 'ORDER BY').
estructura_valida(SQL, distinct) :- sub_string(SQL, _, _, _, 'DISTINCT').
estructura_valida(SQL, union) :- sub_string(SQL, _, _, _, 'UNION').
estructura_valida(SQL, limit) :- sub_string(SQL, _, _, _, 'LIMIT').
estructura_valida(SQL, in) :- sub_string(SQL, _, _, _, 'IN').
estructura_valida(SQL, cte) :- sub_string(SQL, _, _, _, 'WITH'), sub_string(SQL, _, _, _, 'AS').
estructura_valida(SQL, window) :- sub_string(SQL, _, _, _, 'OVER').
estructura_valida(SQL, case_when) :- sub_string(SQL, _, _, _, 'CASE'), sub_string(SQL, _, _, _, 'END').
estructura_valida(SQL, merge) :- sub_string(SQL, _, _, _, 'MERGE').
estructura_valida(SQL, cast) :- sub_string(SQL, _, _, _, 'CAST(').
estructura_valida(SQL, create_table) :- sub_string(SQL, _, _, _, 'CREATE TABLE').
estructura_valida(SQL, create_index) :- sub_string(SQL, _, _, _, 'CREATE INDEX').
estructura_valida(SQL, create_view) :- sub_string(SQL, _, _, _, 'CREATE VIEW').
estructura_valida(SQL, ddl_alter) :- sub_string(SQL, _, _, _, 'ALTER TABLE').
estructura_valida(SQL, ddl_drop) :- sub_string(SQL, _, _, _, 'DROP').
estructura_valida(SQL, truncate) :- sub_string(SQL, _, _, _, 'TRUNCATE').
estructura_valida(SQL, dcl_grant) :- sub_string(SQL, _, _, _, 'GRANT').
estructura_valida(SQL, dcl_revoke) :- sub_string(SQL, _, _, _, 'REVOKE').
estructura_valida(SQL, tcl_begin) :- sub_string(SQL, _, _, _, 'BEGIN').
estructura_valida(SQL, tcl_commit) :- sub_string(SQL, _, _, _, 'COMMIT').
estructura_valida(SQL, tcl_rollback) :- sub_string(SQL, _, _, _, 'ROLLBACK').
estructura_valida(SQL, tcl_savepoint) :- sub_string(SQL, _, _, _, 'SAVEPOINT').
estructura_valida(SQL, comment) :- sub_string(SQL, _, _, _, 'COMMENT').
estructura_valida(SQL, explain) :- sub_string(SQL, _, _, _, 'EXPLAIN').
estructura_valida(_, _).

% --- 7. EXTRAER TABLA PRINCIPAL ---

extraer_tabla_principal(String, Tabla) :-
  ( sub_string(String, Pos, _, _, 'FROM ')
    -> AfterFrom is Pos + 5, sub_string(String, AfterFrom, _, 0, Resto),
       split_string(Resto, " \n\t\"(", " \n\t\"(", Partes), Partes = [Tabla|_]
  ; ( sub_string(String, Pos2, _, _, 'UPDATE ') -> AfterUp is Pos2 + 7, sub_string(String, AfterUp, _, 0, Resto2), split_string(Resto2, " \n\t", " \n\t", Partes2), Partes2 = [Tabla|_] )
  ; ( sub_string(String, Pos3, _, _, 'INTO ') -> AfterIn is Pos3 + 5, sub_string(String, AfterIn, _, 0, Resto3), split_string(Resto3, " \n\t(", " \n\t(", Partes3), Partes3 = [Tabla|_] )
  ; Tabla = desconocido ).

% --- 8. EXTRAER COLUMNAS DEL SELECT ---

normalizar_columna(Parte, Columna) :-
  ( sub_string(Parte, _, _, _, '.')
    -> split_string(Parte, ".", " \n\t", PartesDot), PartesDot = [_, Columna]
    ; Columna = Parte ).

extraer_columnas_select(SQL, Columnas) :-
  sub_string(SQL, PosSelect, _, _, 'SELECT '),
  sub_string(SQL, PosFrom, _, _, ' FROM '),
  PosSelect < PosFrom,
  StartCols is PosSelect + 7, LenCols is PosFrom - StartCols,
  sub_string(SQL, StartCols, LenCols, _, BetweenStr),
  split_string(BetweenStr, ",", " \n\t\"", Partes),
  findall(C, (member(Parte, Partes), string_length(Parte, L), L > 0, (atom_string(AtomP, Parte) -> \+ palabra_reservada(AtomP) ; true), \+ sub_string(Parte, _, _, _, '('), \+ sub_string(Parte, _, _, _, ')'), \+ sub_string(Parte, _, _, _, '*'), normalizar_columna(Parte, C)), Columnas).

% --- 9. PALABRAS SIGNIFICATIVAS ---

palabras_significativas(String, Palabras) :-
  split_string(String, " ,;()\n\t\r'\"", " ", Todas),
  findall(A, (member(P, Todas), atom_string(A, P), \+ palabra_reservada(A), string_length(P, L), L > 1), PalabrasSinFiltrar),
  sort(PalabrasSinFiltrar, Palabras).

% --- 10. COMPARACION SEMANTICA ---

mismo_tipo_consulta(SQL, Expected) :-
  tipo_consulta(SQL, TipoSQL), tipo_consulta(Expected, TipoExp),
  ( TipoSQL = TipoExp ; tipo_padre(TipoSQL, Padre), tipo_padre(TipoExp, Padre) ; tipo_padre(TipoSQL, Padre), TipoExp = Padre ; tipo_padre(TipoExp, Padre), TipoSQL = Padre ).

contiene_palabras_clave(SQL, Expected) :-
  palabras_significativas(Expected, PalabrasExp),
  todas_presentes_en(SQL, PalabrasExp).

todas_presentes_en(_, []).
todas_presentes_en(SQL, [P|Resto]) :- sub_string(SQL, _, _, _, P), todas_presentes_en(SQL, Resto).

misma_tabla_principal(SQL, Expected) :-
  extraer_tabla_principal(SQL, TablaSQL),
  extraer_tabla_principal(Expected, TablaExp),
  TablaSQL = TablaExp.

es_correcta_estructura(SQL, Expected) :-
  mismo_tipo_consulta(SQL, Expected),
  contiene_palabras_clave(SQL, Expected),
  misma_tabla_principal(SQL, Expected).

% --- 11. TYPOS ---

tiene_typo_sql(SQL, 'ERROR: Escribiste FRO pero deberia ser FROM')     :- sub_string(SQL, _, _, _, 'FRO '), \+ sub_string(SQL, _, _, _, 'FROM').
tiene_typo_sql(SQL, 'ERROR: Escribiste WHER pero deberia ser WHERE')   :- sub_string(SQL, _, _, _, 'WHER '), \+ sub_string(SQL, _, _, _, 'WHERE').
tiene_typo_sql(SQL, 'ERROR: Escribiste SELET/SELCT pero deberia ser SELECT') :- (sub_string(SQL, _, _, _, 'SELET ');sub_string(SQL, _, _, _, 'SELCT ')), \+ sub_string(SQL, _, _, _, 'SELECT').
tiene_typo_sql(SQL, 'ERROR: Escribiste FORM pero deberia ser FROM')    :- sub_string(SQL, _, _, _, 'FORM ').
tiene_typo_sql(SQL, 'ERROR: Escribiste WHARE pero deberia ser WHERE')  :- sub_string(SQL, _, _, _, 'WHARE ').
tiene_typo_sql(SQL, 'ERROR: Escribiste UPDTE pero deberia ser UPDATE') :- sub_string(SQL, _, _, _, 'UPDTE ').
tiene_typo_sql(SQL, 'ERROR: Escribiste DELTE pero deberia ser DELETE') :- sub_string(SQL, _, _, _, 'DELTE ').
tiene_typo_sql(SQL, 'ERROR: Escribiste INSER pero deberia ser INSERT') :- sub_string(SQL, _, _, _, 'INSER ').
tiene_typo_sql(SQL, 'ERROR: ORDER necesita BY (ORDER BY columna)')     :- sub_string(SQL, _, _, _, 'ORDER '), \+ sub_string(SQL, _, _, _, 'ORDER BY').
tiene_typo_sql(SQL, 'ERROR: GROUP necesita BY (GROUP BY columna)')     :- sub_string(SQL, _, _, _, 'GROUP '), \+ sub_string(SQL, _, _, _, 'GROUP BY').
tiene_typo_sql(SQL, 'ERROR: ORDER BY sin columna despues')            :- sub_string(SQL, _, _, 0, 'ORDER BY').
tiene_typo_sql(SQL, 'ERROR: WHERE sin condicion despues')             :- sub_string(SQL, Pos, _, _, 'WHERE '), After is Pos + 6, sub_string(SQL, After, _, 0, Resto), string_length(Resto, L), L < 3.

% --- 12. ANTI-PATRONES (ERRORES LOGICOS) ---

anti_patron_error(SQL, _, update_sin_where)      :- sub_string(SQL, _, _, _, 'UPDATE'), \+ sub_string(SQL, _, _, _, 'WHERE').
anti_patron_error(SQL, _, delete_sin_where)      :- sub_string(SQL, _, _, _, 'DELETE'), sub_string(SQL, _, _, _, 'FROM'), \+ sub_string(SQL, _, _, _, 'WHERE').
anti_patron_error(SQL, _, null_con_igual)        :- sub_string(SQL, _, _, _, '= NULL').
anti_patron_error(SQL, _, groupby_sin_agg)       :- sub_string(SQL, _, _, _, 'GROUP BY'), \+ sub_string(SQL, _, _, _, 'COUNT('), \+ sub_string(SQL, _, _, _, 'SUM('), \+ sub_string(SQL, _, _, _, 'AVG('), \+ sub_string(SQL, _, _, _, 'MAX('), \+ sub_string(SQL, _, _, _, 'MIN(').
anti_patron_error(SQL, _, having_sin_groupby)    :- sub_string(SQL, _, _, _, 'HAVING'), \+ sub_string(SQL, _, _, _, 'GROUP BY').
anti_patron_error(SQL, _, not_in_con_null)       :- sub_string(SQL, _, _, _, 'NOT IN').
anti_patron_error(SQL, _, in_vacio)              :- sub_string(SQL, _, _, _, 'IN ()').
anti_patron_error(SQL, _, join_sin_on)           :- sub_string(SQL, _, _, _, 'JOIN'), \+ sub_string(SQL, _, _, _, 'ON'), \+ sub_string(SQL, _, _, _, 'NATURAL'), \+ sub_string(SQL, _, _, _, 'CROSS').
anti_patron_error(SQL, _, having_sin_agregacion) :- sub_string(SQL, _, _, _, 'HAVING'), \+ sub_string(SQL, _, _, _, 'COUNT('), \+ sub_string(SQL, _, _, _, 'SUM('), \+ sub_string(SQL, _, _, _, 'AVG(').
anti_patron_error(SQL, _, count_multi_col)       :- sub_string(SQL, PosOpen, _, _, 'COUNT('), sub_string(SQL, PosClose, _, _, ')'), PosOpen < PosClose, InsideLen is PosClose - PosOpen - 6, InsideLen > 0, Start is PosOpen + 6, sub_string(SQL, Start, InsideLen, _, InsideStr), sub_string(InsideStr, _, _, _, ',').
anti_patron_error(SQL, _, doble_not)             :- sub_string(SQL, _, _, _, 'NOT NOT').
anti_patron_error(SQL, _, between_sin_and)       :- sub_string(SQL, _, _, _, 'BETWEEN'), \+ sub_string(SQL, _, _, _, 'AND').
anti_patron_error(SQL, _, cross_join_sin_where)  :- sub_string(SQL, _, _, _, 'CROSS JOIN'), \+ sub_string(SQL, _, _, _, 'WHERE').
anti_patron_error(SQL, _, select_sin_cols)       :- sub_string(SQL, PosSelect, _, _, 'SELECT'), sub_string(SQL, PosFrom, _, _, ' FROM'), ColStart is PosSelect + 7, ColLen is PosFrom - ColStart, ColLen > 0, sub_string(SQL, ColStart, ColLen, _, ColStr), \+ sub_string(ColStr, _, _, _, '*'), \+ palabras_significativas(ColStr, [_|_]).
anti_patron_error(SQL, _, tabla_no_existe)       :- sub_string(SQL, _, _, _, 'FROM'), extraer_tabla_principal(SQL, TablaStr), TablaStr \= desconocido, atom_string(TablaAtom, TablaStr), \+ tabla(TablaAtom).
anti_patron_error(SQL, _, columna_no_existe)     :- sub_string(SQL, _, _, _, 'SELECT'), sub_string(SQL, _, _, _, 'FROM'), extraer_tabla_principal(SQL, TablaStr), TablaStr \= desconocido, atom_string(TablaAtom, TablaStr), tabla(TablaAtom), extraer_columnas_select(SQL, Columnas), member(Col, Columnas), atom_string(ColAtom, Col), \+ columna(TablaAtom, ColAtom).
anti_patron_error(SQL, _, like_con_igual)          :- sub_string(SQL, _, _, _, '= ''%'), \+ sub_string(SQL, _, _, _, 'LIKE').
anti_patron_error(SQL, _, like_sin_wildcard)       :- sub_string(SQL, _, _, _, 'LIKE'), \+ sub_string(SQL, _, _, _, '%'), \+ sub_string(SQL, _, _, _, '_').
anti_patron_error(SQL, _, insert_sin_columnas)     :- sub_string(SQL, _, _, _, 'INSERT INTO'), sub_string(SQL, _, _, _, 'VALUES'), sub_string(SQL, PosInto, _, _, 'INTO '), sub_string(SQL, PosVal, _, _, 'VALUES'), PosVal > PosInto, AfterInto is PosInto + 5, BetweenLen is PosVal - AfterInto, sub_string(SQL, AfterInto, BetweenLen, _, BetweenStr), \+ sub_string(BetweenStr, _, _, _, '(').
anti_patron_error(SQL, _, where_1_igual_1)          :- sub_string(SQL, _, _, _, 'WHERE 1=1').
anti_patron_error(SQL, _, groupby_posicion)         :- sub_string(SQL, _, _, _, 'GROUP BY 1').
anti_patron_error(SQL, _, groupby_posicion)         :- sub_string(SQL, _, _, _, 'GROUP BY 2').
anti_patron_error(SQL, _, groupby_posicion)         :- sub_string(SQL, _, _, _, 'GROUP BY 3').
anti_patron_error(SQL, _, alter_table_sin_accion)   :- sub_string(SQL, _, _, _, 'ALTER TABLE'), \+ sub_string(SQL, _, _, _, 'ADD '), \+ sub_string(SQL, _, _, _, 'DROP '), \+ sub_string(SQL, _, _, _, 'RENAME'), \+ sub_string(SQL, _, _, _, 'ALTER COLUMN'), \+ sub_string(SQL, _, _, _, 'SET '), \+ sub_string(SQL, _, _, _, 'RESTART').

% --- 13. FEEDBACK ---

feedback_correcto(_, 'Correcto! Buen trabajo!').

feedback_faltan_keywords(select, 'Error en SELECT: necesita SELECT columnas FROM tabla').
feedback_faltan_keywords(insert, 'Error en INSERT: necesita INSERT INTO tabla VALUES (...)').
feedback_faltan_keywords(update, 'Error en UPDATE: necesita UPDATE tabla SET col = valor').
feedback_faltan_keywords(delete, 'Error en DELETE: necesita DELETE FROM tabla').
feedback_faltan_keywords(join, 'Error en JOIN: necesita SELECT ... FROM t1 JOIN t2 ON ...').
feedback_faltan_keywords(group_by, 'Error en GROUP BY: necesita SELECT ... FROM ... GROUP BY col').
feedback_faltan_keywords(having, 'Error en HAVING: necesita GROUP BY y HAVING condicion').
feedback_faltan_keywords(subquery, 'Error en subconsulta: SELECT ... FROM ... WHERE ... IN (SELECT ...)').
feedback_faltan_keywords(like, 'Error en LIKE: WHERE col LIKE patron').
feedback_faltan_keywords(between, 'Error en BETWEEN: WHERE col BETWEEN val1 AND val2').
feedback_faltan_keywords(is_null, 'Error en IS NULL: WHERE col IS NULL').
feedback_faltan_keywords(in, 'Error en IN: WHERE col IN (val1, val2)').
feedback_faltan_keywords(order_by, 'Error en ORDER BY: ORDER BY columna [ASC|DESC]').
feedback_faltan_keywords(distinct, 'Error en DISTINCT: SELECT DISTINCT col FROM tabla').
feedback_faltan_keywords(union, 'Error en UNION: SELECT ... UNION SELECT ...').
feedback_faltan_keywords(limit, 'Error en LIMIT: SELECT ... FROM ... LIMIT n').
feedback_faltan_keywords(aggregate, 'Error: necesita COUNT/SUM/AVG/MAX/MIN con GROUP BY').
feedback_faltan_keywords(cte, 'Error en CTE: WITH nombre AS (SELECT ...) SELECT ...').
feedback_faltan_keywords(window, 'Error en WINDOW: FUNC() OVER (PARTITION BY col)').
feedback_faltan_keywords(case_when, 'Error en CASE: CASE WHEN cond THEN val ELSE val END').
feedback_faltan_keywords(merge, 'Error en MERGE: MERGE INTO destino USING origen ON cond').
feedback_faltan_keywords(cast, 'Error en CAST: CAST(expr AS tipo)').
feedback_faltan_keywords(create_index, 'Error en INDEX: CREATE INDEX nombre ON tabla (col)').
feedback_faltan_keywords(create_view, 'Error en VIEW: CREATE VIEW nombre AS SELECT ...').
feedback_faltan_keywords(truncate, 'Error en TRUNCATE: TRUNCATE TABLE nombre').
feedback_faltan_keywords(ddl, 'Error en DDL: CREATE/ALTER/DROP TABLE/INDEX/VIEW').
feedback_faltan_keywords(dcl, 'Error en DCL: GRANT ... ON ... TO ...').
feedback_faltan_keywords(tcl, 'Error en TCL: COMMIT, ROLLBACK o SAVEPOINT').
feedback_faltan_keywords(comment, 'Error en COMMENT: COMMENT ON TABLE/COLUMN ... IS ...').
feedback_faltan_keywords(explain, 'Error en EXPLAIN: EXPLAIN [ANALYZE] SELECT ...').

feedback_estructura_invalida(_, 'La estructura de la consulta no es valida. Revisa la sintaxis SQL.').

feedback_error(update_sin_where, 'ERROR LOGICO: UPDATE sin WHERE modifica TODOS los registros').
feedback_error(delete_sin_where, 'ERROR LOGICO: DELETE sin WHERE elimina TODOS los registros').
feedback_error(null_con_igual, 'ERROR LOGICO: = NULL es incorrecto. Usa IS NULL').
feedback_error(groupby_sin_agg, 'ERROR LOGICO: GROUP BY necesita COUNT/SUM/AVG/MAX/MIN').
feedback_error(having_sin_groupby, 'ERROR LOGICO: HAVING necesita GROUP BY').
feedback_error(not_in_con_null, 'ERROR LOGICO: NOT IN con NULL no devuelve filas. Usa NOT EXISTS').
feedback_error(in_vacio, 'ERROR LOGICO: IN () esta vacio, no devuelve resultados').
feedback_error(join_sin_on, 'ERROR LOGICO: JOIN necesita ON o USING').
feedback_error(having_sin_agregacion, 'ERROR LOGICO: HAVING solo acepta funciones de agregacion').
feedback_error(count_multi_col, 'ERROR LOGICO: COUNT(col1, col2) no es valido').
feedback_error(doble_not, 'ERROR LOGICO: NOT NOT es confuso. Simplifica').
feedback_error(between_sin_and, 'ERROR LOGICO: BETWEEN necesita AND').
feedback_error(cross_join_sin_where, 'ERROR LOGICO: CROSS JOIN sin WHERE produce producto cartesiano').
feedback_error(select_sin_cols, 'ERROR LOGICO: SELECT sin columnas entre SELECT y FROM').
feedback_error(tabla_no_existe, 'ERROR SEMANTICO: Esa tabla no existe en el esquema de referencia').
feedback_error(columna_no_existe, 'ERROR SEMANTICO: Esa columna no existe en la tabla').
feedback_error(like_con_igual, 'ERROR LOGICO: Usaste = con % . Usa LIKE para patrones').
feedback_error(like_sin_wildcard, 'ERROR LOGICO: LIKE sin % o _ es exactamente como =').
feedback_error(insert_sin_columnas, 'ERROR LOGICO: INSERT necesita lista de columnas: INSERT INTO tabla (col) VALUES (val)').
feedback_error(where_1_igual_1, 'ERROR LOGICO: WHERE 1=1 siempre es verdadero. No tiene sentido').
feedback_error(groupby_posicion, 'ERROR LOGICO: Usa nombres de columna en GROUP BY, no numeros').
feedback_error(alter_table_sin_accion, 'ERROR LOGICO: ALTER TABLE necesita ADD / DROP / RENAME / ALTER').

feedback_semantico(_, _, 'Tu consulta no coincide con la esperada. Revisa tablas y columnas.').

% --- 14. EVALUADOR ---

evaluar(SQL, _, _, incorrecto, syntax, Feedback) :-
  tiene_typo_sql(SQL, Feedback), !.

evaluar(SQL, Nivel, Expected, correcto, none, Feedback) :-
  tipo_consulta(SQL, Tipo),
  keywords_validas(SQL, Tipo, Nivel),
  estructura_valida(SQL, Tipo),
  \+ anti_patron_error(SQL, Expected, _),
  es_correcta_estructura(SQL, Expected),
  !, feedback_correcto(Tipo, Feedback).

evaluar(SQL, Nivel, _, incorrecto, syntax, Feedback) :-
  tipo_consulta(SQL, Tipo),
  \+ keywords_validas(SQL, Tipo, Nivel),
  feedback_faltan_keywords(Tipo, Feedback), !.

evaluar(SQL, Nivel, _, incorrecto, syntax, Feedback) :-
  tipo_consulta(SQL, Tipo),
  keywords_validas(SQL, Tipo, Nivel),
  \+ estructura_valida(SQL, Tipo),
  feedback_estructura_invalida(Tipo, Feedback), !.

evaluar(SQL, Nivel, Expected, incorrecto, logic, Feedback) :-
  tipo_consulta(SQL, Tipo),
  keywords_validas(SQL, Tipo, Nivel),
  estructura_valida(SQL, Tipo),
  anti_patron_error(SQL, Expected, Error),
  feedback_error(Error, Feedback), !.

evaluar(SQL, Nivel, Expected, incorrecto, semantic, Feedback) :-
  tipo_consulta(SQL, Tipo),
  keywords_validas(SQL, Tipo, Nivel),
  estructura_valida(SQL, Tipo),
  \+ anti_patron_error(SQL, Expected, _),
  \+ es_correcta_estructura(SQL, Expected),
  !,
  ( tipo_consulta(Expected, TipoExp), ( Tipo = TipoExp ; tipo_padre(Tipo, TipoExp) ; tipo_padre(TipoExp, Tipo) )
    -> feedback_semantico(SQL, Expected, Feedback)
    ; Feedback = 'Tu consulta es de un tipo diferente al esperado' ).

evaluar(_, _, _, incorrecto, syntax, 'No se reconoce la consulta. Verifica la sintaxis SQL.').
