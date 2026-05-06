-- ==========================================
-- EJERCICIOS - Agente Pedagógico SQL
-- ==========================================

-- SELECT
INSERT INTO "Exercise" (id_exercise, title, description, difficulty, topic, "expectedSql", "isActive", "createdAt")
VALUES
(gen_random_uuid(), 'SELECT básico', 'Obtén todos los registros de la tabla usuarios.', 'EASY', 'SELECT', 'SELECT * FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SELECT con WHERE', 'Obtén todos los usuarios cuya edad sea mayor a 18.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE edad > 18', true, NOW()),
(gen_random_uuid(), 'SELECT con ORDER BY', 'Obtén todos los usuarios ordenados por nombre de forma ascendente y filtra los que están activos.', 'HARD', 'SELECT', 'SELECT * FROM usuarios WHERE activo = true ORDER BY nombre ASC', true, NOW()),

-- INSERT
(gen_random_uuid(), 'INSERT básico', 'Inserta un usuario con nombre Juan y email juan@email.com.', 'EASY', 'INSERT', 'INSERT INTO usuarios (nombre, email) VALUES (''Juan'', ''juan@email.com'')', true, NOW()),
(gen_random_uuid(), 'INSERT múltiple', 'Inserta tres usuarios en una sola sentencia.', 'MEDIUM', 'INSERT', 'INSERT INTO usuarios (nombre, email) VALUES (''Ana'', ''ana@email.com''), (''Luis'', ''luis@email.com''), (''Maria'', ''maria@email.com'')', true, NOW()),
(gen_random_uuid(), 'INSERT desde SELECT', 'Inserta en la tabla clientes todos los usuarios que tengan rol admin.', 'HARD', 'INSERT', 'INSERT INTO clientes (nombre, email) SELECT nombre, email FROM usuarios WHERE rol = ''admin''', true, NOW()),

-- UPDATE
(gen_random_uuid(), 'UPDATE básico', 'Actualiza el nombre del usuario con id 1 a Pedro.', 'EASY', 'UPDATE', 'UPDATE usuarios SET nombre = ''Pedro'' WHERE id = 1', true, NOW()),
(gen_random_uuid(), 'UPDATE con WHERE', 'Actualiza el email de todos los usuarios cuyo nombre sea Juan.', 'MEDIUM', 'UPDATE', 'UPDATE usuarios SET email = ''nuevo@email.com'' WHERE nombre = ''Juan''', true, NOW()),
(gen_random_uuid(), 'UPDATE múltiples campos', 'Actualiza el nombre y email del usuario con id 5, solo si está activo.', 'HARD', 'UPDATE', 'UPDATE usuarios SET nombre = ''Carlos'', email = ''carlos@email.com'' WHERE id = 5 AND activo = true', true, NOW()),

-- DELETE
(gen_random_uuid(), 'DELETE básico', 'Elimina el usuario con id 1.', 'EASY', 'DELETE', 'DELETE FROM usuarios WHERE id = 1', true, NOW()),
(gen_random_uuid(), 'DELETE con condición', 'Elimina todos los usuarios que no estén activos.', 'MEDIUM', 'DELETE', 'DELETE FROM usuarios WHERE activo = false', true, NOW()),
(gen_random_uuid(), 'DELETE con subconsulta', 'Elimina todos los usuarios que no tengan ningún pedido registrado.', 'HARD', 'DELETE', 'DELETE FROM usuarios WHERE id NOT IN (SELECT id_usuario FROM pedidos)', true, NOW()),

-- JOIN
(gen_random_uuid(), 'INNER JOIN básico', 'Obtén el nombre del usuario y el nombre de su pedido usando INNER JOIN.', 'EASY', 'JOIN', 'SELECT usuarios.nombre, pedidos.nombre FROM usuarios INNER JOIN pedidos ON usuarios.id = pedidos.id_usuario', true, NOW()),
(gen_random_uuid(), 'LEFT JOIN con WHERE', 'Obtén todos los usuarios y sus pedidos, incluyendo los que no tienen pedidos, filtrando por estado activo.', 'MEDIUM', 'JOIN', 'SELECT usuarios.nombre, pedidos.nombre FROM usuarios LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario WHERE usuarios.activo = true', true, NOW()),
(gen_random_uuid(), 'JOIN múltiple', 'Obtén el nombre del usuario, el pedido y la categoría del producto, ordenado por usuario.', 'HARD', 'JOIN', 'SELECT usuarios.nombre, pedidos.nombre, categorias.nombre FROM usuarios INNER JOIN pedidos ON usuarios.id = pedidos.id_usuario INNER JOIN categorias ON pedidos.id_categoria = categorias.id ORDER BY usuarios.nombre', true, NOW()),

-- GROUP_BY
(gen_random_uuid(), 'GROUP BY básico', 'Cuenta cuántos usuarios hay por ciudad.', 'EASY', 'GROUP_BY', 'SELECT ciudad, COUNT(*) FROM usuarios GROUP BY ciudad', true, NOW()),
(gen_random_uuid(), 'GROUP BY con WHERE', 'Cuenta cuántos usuarios activos hay por ciudad.', 'MEDIUM', 'GROUP_BY', 'SELECT ciudad, COUNT(*) FROM usuarios WHERE activo = true GROUP BY ciudad', true, NOW()),
(gen_random_uuid(), 'GROUP BY con ORDER BY', 'Obtén el total de ventas por vendedor, solo de ventas completadas, ordenado de mayor a menor.', 'HARD', 'GROUP_BY', 'SELECT id_vendedor, SUM(total) FROM ventas WHERE estado = ''completado'' GROUP BY id_vendedor ORDER BY SUM(total) DESC', true, NOW()),

-- HAVING
(gen_random_uuid(), 'HAVING básico', 'Obtén las ciudades que tienen más de 5 usuarios.', 'EASY', 'HAVING', 'SELECT ciudad, COUNT(*) FROM usuarios GROUP BY ciudad HAVING COUNT(*) > 5', true, NOW()),
(gen_random_uuid(), 'HAVING con WHERE', 'Obtén las ciudades con más de 3 usuarios activos.', 'MEDIUM', 'HAVING', 'SELECT ciudad, COUNT(*) FROM usuarios WHERE activo = true GROUP BY ciudad HAVING COUNT(*) > 3', true, NOW()),
(gen_random_uuid(), 'HAVING con ORDER BY', 'Obtén los vendedores cuyas ventas completadas superen los 10000, ordenados de mayor a menor.', 'HARD', 'HAVING', 'SELECT id_vendedor, SUM(total) FROM ventas WHERE estado = ''completado'' GROUP BY id_vendedor HAVING SUM(total) > 10000 ORDER BY SUM(total) DESC', true, NOW()),

-- SUBQUERY
(gen_random_uuid(), 'Subconsulta básica', 'Obtén los usuarios que viven en la misma ciudad que el usuario con id 1.', 'EASY', 'SUBQUERY', 'SELECT * FROM usuarios WHERE ciudad = (SELECT ciudad FROM usuarios WHERE id = 1)', true, NOW()),
(gen_random_uuid(), 'Subconsulta con IN', 'Obtén los usuarios que tienen al menos un pedido registrado.', 'MEDIUM', 'SUBQUERY', 'SELECT * FROM usuarios WHERE id IN (SELECT id_usuario FROM pedidos)', true, NOW()),
(gen_random_uuid(), 'Subconsulta con EXISTS', 'Obtén los usuarios que tienen pedidos con un total mayor a 500.', 'HARD', 'SUBQUERY', 'SELECT * FROM usuarios WHERE EXISTS (SELECT 1 FROM pedidos WHERE pedidos.id_usuario = usuarios.id AND pedidos.total > 500)', true, NOW()),

-- DDL
(gen_random_uuid(), 'CREATE TABLE básico', 'Crea una tabla llamada productos con id, nombre y precio.', 'EASY', 'DDL', 'CREATE TABLE productos (id SERIAL PRIMARY KEY, nombre VARCHAR(100), precio DECIMAL(10,2))', true, NOW()),
(gen_random_uuid(), 'ALTER TABLE', 'Agrega la columna stock de tipo entero a la tabla productos.', 'MEDIUM', 'DDL', 'ALTER TABLE productos ADD COLUMN stock INT', true, NOW()),
(gen_random_uuid(), 'DROP TABLE', 'Elimina la tabla temporal llamada temp_ventas si existe.', 'HARD', 'DDL', 'DROP TABLE IF EXISTS temp_ventas', true, NOW()),

-- DCL
(gen_random_uuid(), 'GRANT básico', 'Otorga permiso de SELECT sobre la tabla usuarios al usuario invitado.', 'EASY', 'DCL', 'GRANT SELECT ON usuarios TO invitado', true, NOW()),
(gen_random_uuid(), 'GRANT múltiple', 'Otorga permisos de SELECT e INSERT sobre la tabla pedidos al usuario vendedor.', 'MEDIUM', 'DCL', 'GRANT SELECT, INSERT ON pedidos TO vendedor', true, NOW()),
(gen_random_uuid(), 'REVOKE', 'Revoca todos los permisos sobre la tabla usuarios al usuario invitado.', 'HARD', 'DCL', 'REVOKE ALL ON usuarios FROM invitado', true, NOW()),

-- TCL
(gen_random_uuid(), 'COMMIT básico', 'Confirma la transacción actual.', 'EASY', 'TCL', 'COMMIT', true, NOW()),
(gen_random_uuid(), 'ROLLBACK', 'Deshace todos los cambios de la transacción actual.', 'MEDIUM', 'TCL', 'ROLLBACK', true, NOW()),
(gen_random_uuid(), 'SAVEPOINT', 'Crea un punto de guardado llamado punto1 y luego haz rollback hasta ese punto.', 'HARD', 'TCL', 'SAVEPOINT punto1', true, NOW()),

-- AGGREGATE
(gen_random_uuid(), 'COUNT básico', 'Cuenta el total de usuarios registrados.', 'EASY', 'AGGREGATE', 'SELECT COUNT(*) FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SUM y AVG', 'Obtén la suma total y el promedio de ventas agrupado por vendedor.', 'MEDIUM', 'AGGREGATE', 'SELECT id_vendedor, SUM(total), AVG(total) FROM ventas GROUP BY id_vendedor', true, NOW()),
(gen_random_uuid(), 'MAX y MIN con HAVING', 'Obtén el vendedor con la venta máxima mayor a 1000 y la mínima, agrupado por vendedor.', 'HARD', 'AGGREGATE', 'SELECT id_vendedor, MAX(total), MIN(total) FROM ventas GROUP BY id_vendedor HAVING MAX(total) > 1000', true, NOW());

