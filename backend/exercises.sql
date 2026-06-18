-- ==========================================
-- EJERCICIOS - Agente Pedagógico SQL
-- Version 3.0 - 135+ ejercicios
-- ==========================================

-- SELECT (15)
INSERT INTO "Exercise" (id_exercise, title, description, difficulty, topic, "expectedSql", "isActive", "createdAt") VALUES
(gen_random_uuid(), 'SELECT básico', 'Obtén todos los registros de la tabla usuarios.', 'EASY', 'SELECT', 'SELECT * FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SELECT con WHERE simple', 'Obtén todos los usuarios cuya edad sea mayor a 18.', 'EASY', 'SELECT', 'SELECT * FROM usuarios WHERE edad > 18', true, NOW()),
(gen_random_uuid(), 'SELECT con columna específica', 'Obtén solo los nombres y emails de todos los usuarios.', 'EASY', 'SELECT', 'SELECT nombre, email FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SELECT con ORDER BY ASC', 'Obtén todos los usuarios ordenados por nombre alfabéticamente.', 'EASY', 'SELECT', 'SELECT * FROM usuarios ORDER BY nombre ASC', true, NOW()),
(gen_random_uuid(), 'SELECT con alias', 'Obtén el nombre y edad de los usuarios, muestra el nombre como "Nombre" y la edad como "Edad".', 'EASY', 'SELECT', 'SELECT nombre AS "Nombre", edad AS "Edad" FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SELECT con WHERE y AND', 'Obtén los usuarios activos mayores de 25 años.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE activo = true AND edad > 25', true, NOW()),
(gen_random_uuid(), 'SELECT con BETWEEN', 'Obtén los usuarios cuya edad esté entre 18 y 30 años.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE edad BETWEEN 18 AND 30', true, NOW()),
(gen_random_uuid(), 'SELECT con IN', 'Obtén los usuarios que vivan en "La Paz", "Cochabamba" o "Santa Cruz".', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE ciudad IN (''La Paz'', ''Cochabamba'', ''Santa Cruz'')', true, NOW()),
(gen_random_uuid(), 'SELECT con WHERE y OR', 'Obtén los usuarios que tengan rol admin o que sean mayores de 30.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE rol = ''admin'' OR edad > 30', true, NOW()),
(gen_random_uuid(), 'SELECT con LIMIT', 'Obtén los primeros 10 usuarios de la tabla.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios LIMIT 10', true, NOW()),
(gen_random_uuid(), 'SELECT con CASE', 'Obtén el nombre y una columna llamada "categoria_edad" que muestre "Joven" si edad < 18, "Adulto" si edad < 60 y "Adulto Mayor" si >= 60.', 'HARD', 'SELECT', 'SELECT nombre, CASE WHEN edad < 18 THEN ''Joven'' WHEN edad < 60 THEN ''Adulto'' ELSE ''Adulto Mayor'' END AS categoria_edad FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SELECT con CAST', 'Obtén el nombre y convierte la edad a texto como "edad_texto".', 'HARD', 'SELECT', 'SELECT nombre, CAST(edad AS TEXT) AS edad_texto FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SELECT con DISTINCT', 'Obtén las ciudades distintas de las que hay usuarios registrados.', 'HARD', 'SELECT', 'SELECT DISTINCT ciudad FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SELECT con COALESCE', 'Obtén el nombre y el email, pero si el email es NULL muestra "Sin email".', 'HARD', 'SELECT', 'SELECT nombre, COALESCE(email, ''Sin email'') AS email FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SELECT con ORDER BY DESC y LIMIT', 'Obtén los 5 usuarios más jóvenes.', 'HARD', 'SELECT', 'SELECT * FROM usuarios ORDER BY edad ASC LIMIT 5', true, NOW()),

-- INSERT (9)
(gen_random_uuid(), 'INSERT básico', 'Inserta un usuario con nombre Juan y email juan@email.com.', 'EASY', 'INSERT', 'INSERT INTO usuarios (nombre, email) VALUES (''Juan'', ''juan@email.com'')', true, NOW()),
(gen_random_uuid(), 'INSERT con todas las columnas', 'Inserta un usuario completo: nombre Juan, email juan@email.com, edad 25, ciudad "La Paz", rol user, activo true.', 'EASY', 'INSERT', 'INSERT INTO usuarios (nombre, email, edad, ciudad, rol, activo) VALUES (''Juan'', ''juan@email.com'', 25, ''La Paz'', ''user'', true)', true, NOW()),
(gen_random_uuid(), 'INSERT múltiple', 'Inserta tres usuarios en una sola sentencia.', 'MEDIUM', 'INSERT', 'INSERT INTO usuarios (nombre, email) VALUES (''Ana'', ''ana@email.com''), (''Luis'', ''luis@email.com''), (''Maria'', ''maria@email.com'')', true, NOW()),
(gen_random_uuid(), 'INSERT con DEFAULT', 'Inserta un usuario usando valores por defecto solo con nombre y email.', 'MEDIUM', 'INSERT', 'INSERT INTO usuarios (nombre, email) VALUES (''Pedro'', ''pedro@email.com'')', true, NOW()),
(gen_random_uuid(), 'INSERT especificando columnas', 'Inserta un usuario especificando solo nombre, email y ciudad.', 'MEDIUM', 'INSERT', 'INSERT INTO usuarios (nombre, email, ciudad) VALUES (''Sofia'', ''sofia@email.com'', ''Cochabamba'')', true, NOW()),
(gen_random_uuid(), 'INSERT desde SELECT', 'Inserta en la tabla clientes todos los usuarios que tengan rol admin.', 'HARD', 'INSERT', 'INSERT INTO clientes (nombre, email) SELECT nombre, email FROM usuarios WHERE rol = ''admin''', true, NOW()),
(gen_random_uuid(), 'INSERT con SELECT y WHERE', 'Inserta en la tabla clientes los usuarios mayores de 18.', 'HARD', 'INSERT', 'INSERT INTO clientes (nombre, email, edad) SELECT nombre, email, edad FROM usuarios WHERE edad > 18', true, NOW()),
(gen_random_uuid(), 'INSERT con JOIN', 'Inserta en la tabla premium_users los usuarios que hayan hecho más de 5 pedidos.', 'HARD', 'INSERT', 'INSERT INTO premium_users (id_usuario, nombre) SELECT u.id, u.nombre FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario GROUP BY u.id, u.nombre HAVING COUNT(p.id) > 5', true, NOW()),

-- UPDATE (9)
(gen_random_uuid(), 'UPDATE básico', 'Actualiza el nombre del usuario con id 1 a Pedro.', 'EASY', 'UPDATE', 'UPDATE usuarios SET nombre = ''Pedro'' WHERE id = 1', true, NOW()),
(gen_random_uuid(), 'UPDATE un campo por nombre', 'Actualiza el email de todos los usuarios cuyo nombre sea Juan.', 'EASY', 'UPDATE', 'UPDATE usuarios SET email = ''nuevo@email.com'' WHERE nombre = ''Juan''', true, NOW()),
(gen_random_uuid(), 'UPDATE múltiples campos', 'Actualiza el nombre y email del usuario con id 5.', 'MEDIUM', 'UPDATE', 'UPDATE usuarios SET nombre = ''Carlos'', email = ''carlos@email.com'' WHERE id = 5', true, NOW()),
(gen_random_uuid(), 'UPDATE con condición AND', 'Actualiza el email del usuario con id 5 solo si está activo.', 'MEDIUM', 'UPDATE', 'UPDATE usuarios SET email = ''nuevo@email.com'' WHERE id = 5 AND activo = true', true, NOW()),
(gen_random_uuid(), 'UPDATE con incremento', 'Incrementa en 1 la edad de todos los usuarios activos.', 'MEDIUM', 'UPDATE', 'UPDATE usuarios SET edad = edad + 1 WHERE activo = true', true, NOW()),
(gen_random_uuid(), 'UPDATE con CASE', 'Actualiza el rol de los usuarios: admin a superadmin, user a client.', 'HARD', 'UPDATE', 'UPDATE usuarios SET rol = CASE WHEN rol = ''admin'' THEN ''superadmin'' WHEN rol = ''user'' THEN ''client'' ELSE rol END', true, NOW()),
(gen_random_uuid(), 'UPDATE con subquery', 'Actualiza el estado de los usuarios que no tienen pedidos como inactivo.', 'HARD', 'UPDATE', 'UPDATE usuarios SET activo = false WHERE id NOT IN (SELECT id_usuario FROM pedidos)', true, NOW()),
(gen_random_uuid(), 'UPDATE con JOIN', 'Actualiza el email de los usuarios agregando un sufijo si tienen pedidos completados.', 'HARD', 'UPDATE', 'UPDATE usuarios SET email = CONCAT(email, ''.vip'') WHERE id IN (SELECT id_usuario FROM pedidos WHERE estado = ''completado'')', true, NOW()),

-- DELETE (9)
(gen_random_uuid(), 'DELETE básico', 'Elimina el usuario con id 1.', 'EASY', 'DELETE', 'DELETE FROM usuarios WHERE id = 1', true, NOW()),
(gen_random_uuid(), 'DELETE por condición', 'Elimina todos los usuarios que no estén activos.', 'EASY', 'DELETE', 'DELETE FROM usuarios WHERE activo = false', true, NOW()),
(gen_random_uuid(), 'DELETE con AND', 'Elimina los usuarios inactivos y menores de edad.', 'MEDIUM', 'DELETE', 'DELETE FROM usuarios WHERE activo = false AND edad < 18', true, NOW()),
(gen_random_uuid(), 'DELETE con OR', 'Elimina los usuarios que sean de "La Paz" o tengan rol invitado.', 'MEDIUM', 'DELETE', 'DELETE FROM usuarios WHERE ciudad = ''La Paz'' OR rol = ''invitado''', true, NOW()),
(gen_random_uuid(), 'DELETE con NOT IN', 'Elimina todos los usuarios que no tengan pedidos registrados.', 'MEDIUM', 'DELETE', 'DELETE FROM usuarios WHERE id NOT IN (SELECT id_usuario FROM pedidos)', true, NOW()),
(gen_random_uuid(), 'DELETE con subconsulta', 'Elimina los usuarios que no tengan ningún pedido con estado completado.', 'HARD', 'DELETE', 'DELETE FROM usuarios WHERE id NOT IN (SELECT id_usuario FROM pedidos WHERE estado = ''completado'')', true, NOW()),
(gen_random_uuid(), 'DELETE con USING', 'Elimina los usuarios que tengan pedidos cancelados usando USING.', 'HARD', 'DELETE', 'DELETE FROM usuarios USING pedidos WHERE usuarios.id = pedidos.id_usuario AND pedidos.estado = ''cancelado''', true, NOW()),
(gen_random_uuid(), 'DELETE con IN y subquery', 'Elimina los usuarios que hayan hecho pedidos menores a 100.', 'HARD', 'DELETE', 'DELETE FROM usuarios WHERE id IN (SELECT id_usuario FROM pedidos WHERE total < 100)', true, NOW()),

-- JOIN (15)
(gen_random_uuid(), 'INNER JOIN básico', 'Obtén el nombre del usuario y el nombre de su pedido.', 'EASY', 'JOIN', 'SELECT usuarios.nombre, pedidos.nombre FROM usuarios INNER JOIN pedidos ON usuarios.id = pedidos.id_usuario', true, NOW()),
(gen_random_uuid(), 'INNER JOIN con alias', 'Obtén el nombre del usuario y el total del pedido usando alias u y p.', 'EASY', 'JOIN', 'SELECT u.nombre, p.total FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario', true, NOW()),
(gen_random_uuid(), 'LEFT JOIN', 'Obtén todos los usuarios y sus pedidos, incluyendo los que no tienen.', 'EASY', 'JOIN', 'SELECT usuarios.nombre, pedidos.nombre FROM usuarios LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario', true, NOW()),
(gen_random_uuid(), 'LEFT JOIN con WHERE', 'Obtén los usuarios que no tienen ningún pedido.', 'EASY', 'JOIN', 'SELECT usuarios.nombre FROM usuarios LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario WHERE pedidos.id IS NULL', true, NOW()),
(gen_random_uuid(), 'RIGHT JOIN', 'Obtén todos los pedidos y los usuarios asociados, incluyendo pedidos sin usuario.', 'MEDIUM', 'JOIN', 'SELECT usuarios.nombre, pedidos.nombre FROM usuarios RIGHT JOIN pedidos ON usuarios.id = pedidos.id_usuario', true, NOW()),
(gen_random_uuid(), 'JOIN con USING', 'Obtén usuarios y pedidos usando USING cuando la columna se llama igual.', 'MEDIUM', 'JOIN', 'SELECT u.nombre, p.total FROM usuarios u INNER JOIN pedidos p USING(id)', true, NOW()),
(gen_random_uuid(), 'JOIN múltiple (3 tablas)', 'Obtén el nombre del usuario, el pedido y la categoría del producto.', 'MEDIUM', 'JOIN', 'SELECT u.nombre, p.nombre, c.nombre FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario INNER JOIN categorias c ON p.id_categoria = c.id', true, NOW()),
(gen_random_uuid(), 'JOIN con GROUP BY', 'Obtén el nombre del usuario y la cantidad de pedidos que tiene.', 'MEDIUM', 'JOIN', 'SELECT u.nombre, COUNT(p.id) FROM usuarios u LEFT JOIN pedidos p ON u.id = p.id_usuario GROUP BY u.nombre', true, NOW()),
(gen_random_uuid(), 'SELF JOIN', 'Obtén los nombres de empleados con su jefe usando una misma tabla empleados.', 'HARD', 'JOIN', 'SELECT e1.nombre AS empleado, e2.nombre AS jefe FROM empleados e1 INNER JOIN empleados e2 ON e1.id_jefe = e2.id', true, NOW()),
(gen_random_uuid(), 'FULL OUTER JOIN', 'Obtén todos los usuarios y pedidos haya o no correspondencia.', 'HARD', 'JOIN', 'SELECT usuarios.nombre, pedidos.nombre FROM usuarios FULL OUTER JOIN pedidos ON usuarios.id = pedidos.id_usuario', true, NOW()),
(gen_random_uuid(), 'CROSS JOIN', 'Obtén todas las combinaciones posibles entre usuarios y categorías.', 'HARD', 'JOIN', 'SELECT usuarios.nombre, categorias.nombre FROM usuarios CROSS JOIN categorias', true, NOW()),
(gen_random_uuid(), 'JOIN con ORDER BY y LIMIT', 'Obtén los 5 usuarios con más pedidos ordenados de mayor a menor.', 'HARD', 'JOIN', 'SELECT u.nombre, COUNT(p.id) AS total_pedidos FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario GROUP BY u.nombre ORDER BY total_pedidos DESC LIMIT 5', true, NOW()),
(gen_random_uuid(), 'JOIN con WHERE y AND', 'Obtén los pedidos completados con el nombre del usuario y el total.', 'HARD', 'JOIN', 'SELECT u.nombre, p.total FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario WHERE p.estado = ''completado'' AND p.total > 100', true, NOW()),

-- GROUP BY (12)
(gen_random_uuid(), 'GROUP BY COUNT', 'Cuenta cuántos usuarios hay por ciudad.', 'EASY', 'GROUP_BY', 'SELECT ciudad, COUNT(*) FROM usuarios GROUP BY ciudad', true, NOW()),
(gen_random_uuid(), 'GROUP BY SUM', 'Obtén la suma total de ventas por vendedor.', 'EASY', 'GROUP_BY', 'SELECT id_vendedor, SUM(total) FROM ventas GROUP BY id_vendedor', true, NOW()),
(gen_random_uuid(), 'GROUP BY AVG', 'Obtén el promedio de edad por ciudad.', 'EASY', 'GROUP_BY', 'SELECT ciudad, AVG(edad) FROM usuarios GROUP BY ciudad', true, NOW()),
(gen_random_uuid(), 'GROUP BY MIN', 'Obtén la edad mínima por ciudad.', 'MEDIUM', 'GROUP_BY', 'SELECT ciudad, MIN(edad) FROM usuarios GROUP BY ciudad', true, NOW()),
(gen_random_uuid(), 'GROUP BY MAX', 'Obtén la edad máxima por ciudad.', 'MEDIUM', 'GROUP_BY', 'SELECT ciudad, MAX(edad) FROM usuarios GROUP BY ciudad', true, NOW()),
(gen_random_uuid(), 'GROUP BY con WHERE', 'Cuenta cuántos usuarios activos hay por ciudad.', 'MEDIUM', 'GROUP_BY', 'SELECT ciudad, COUNT(*) FROM usuarios WHERE activo = true GROUP BY ciudad', true, NOW()),
(gen_random_uuid(), 'GROUP BY multi-columna', 'Cuenta cuántos usuarios hay por ciudad y por rol.', 'MEDIUM', 'GROUP_BY', 'SELECT ciudad, rol, COUNT(*) FROM usuarios GROUP BY ciudad, rol', true, NOW()),
(gen_random_uuid(), 'GROUP BY con ORDER BY', 'Obtén las ciudades ordenadas por cantidad de usuarios de mayor a menor.', 'HARD', 'GROUP_BY', 'SELECT ciudad, COUNT(*) FROM usuarios GROUP BY ciudad ORDER BY COUNT(*) DESC', true, NOW()),
(gen_random_uuid(), 'GROUP BY con HAVING', 'Obtén las ciudades que tienen más de 5 usuarios.', 'HARD', 'GROUP_BY', 'SELECT ciudad, COUNT(*) FROM usuarios GROUP BY ciudad HAVING COUNT(*) > 5', true, NOW()),
(gen_random_uuid(), 'GROUP BY con múltiples agregaciones', 'Obtén por ciudad: cantidad, edad promedio, edad mínima y máxima.', 'HARD', 'GROUP_BY', 'SELECT ciudad, COUNT(*), AVG(edad), MIN(edad), MAX(edad) FROM usuarios GROUP BY ciudad', true, NOW()),
(gen_random_uuid(), 'GROUP BY con JOIN', 'Obtén por usuario la cantidad y el total de sus pedidos.', 'HARD', 'GROUP_BY', 'SELECT u.nombre, COUNT(p.id) AS cantidad, SUM(p.total) AS total FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario GROUP BY u.nombre', true, NOW()),

-- HAVING (9)
(gen_random_uuid(), 'HAVING con COUNT', 'Obtén las ciudades que tienen más de 5 usuarios.', 'EASY', 'HAVING', 'SELECT ciudad, COUNT(*) FROM usuarios GROUP BY ciudad HAVING COUNT(*) > 5', true, NOW()),
(gen_random_uuid(), 'HAVING con SUM', 'Obtén los vendedores con ventas totales mayores a 10000.', 'EASY', 'HAVING', 'SELECT id_vendedor, SUM(total) FROM ventas GROUP BY id_vendedor HAVING SUM(total) > 10000', true, NOW()),
(gen_random_uuid(), 'HAVING con AVG', 'Obtén las ciudades con edad promedio mayor a 25.', 'MEDIUM', 'HAVING', 'SELECT ciudad, AVG(edad) FROM usuarios GROUP BY ciudad HAVING AVG(edad) > 25', true, NOW()),
(gen_random_uuid(), 'HAVING con WHERE', 'Obtén las ciudades con más de 3 usuarios activos.', 'MEDIUM', 'HAVING', 'SELECT ciudad, COUNT(*) FROM usuarios WHERE activo = true GROUP BY ciudad HAVING COUNT(*) > 3', true, NOW()),
(gen_random_uuid(), 'HAVING con MIN', 'Obtén las ciudades donde la edad mínima sea mayor a 15.', 'MEDIUM', 'HAVING', 'SELECT ciudad, MIN(edad) FROM usuarios GROUP BY ciudad HAVING MIN(edad) > 15', true, NOW()),
(gen_random_uuid(), 'HAVING con MAX', 'Obtén las ciudades donde la edad máxima sea menor a 50.', 'MEDIUM', 'HAVING', 'SELECT ciudad, MAX(edad) FROM usuarios GROUP BY ciudad HAVING MAX(edad) < 50', true, NOW()),
(gen_random_uuid(), 'HAVING con ORDER BY', 'Obtén los vendedores con ventas mayores a 5000 ordenados de mayor a menor.', 'HARD', 'HAVING', 'SELECT id_vendedor, SUM(total) FROM ventas GROUP BY id_vendedor HAVING SUM(total) > 5000 ORDER BY SUM(total) DESC', true, NOW()),
(gen_random_uuid(), 'HAVING múltiples condiciones', 'Obtén las ciudades con más de 3 usuarios y edad promedio mayor a 20.', 'HARD', 'HAVING', 'SELECT ciudad, COUNT(*), AVG(edad) FROM usuarios GROUP BY ciudad HAVING COUNT(*) > 3 AND AVG(edad) > 20', true, NOW()),
(gen_random_uuid(), 'HAVING con JOIN', 'Obtén los usuarios con más de 2 pedidos y total mayor a 500.', 'HARD', 'HAVING', 'SELECT u.nombre, COUNT(p.id), SUM(p.total) FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario GROUP BY u.nombre HAVING COUNT(p.id) > 2 AND SUM(p.total) > 500', true, NOW()),

-- SUBQUERY (12)
(gen_random_uuid(), 'Subconsulta escalar', 'Obtén los usuarios que viven en la misma ciudad que el usuario con id 1.', 'EASY', 'SUBQUERY', 'SELECT * FROM usuarios WHERE ciudad = (SELECT ciudad FROM usuarios WHERE id = 1)', true, NOW()),
(gen_random_uuid(), 'Subconsulta con IN', 'Obtén los usuarios que tienen al menos un pedido registrado.', 'EASY', 'SUBQUERY', 'SELECT * FROM usuarios WHERE id IN (SELECT id_usuario FROM pedidos)', true, NOW()),
(gen_random_uuid(), 'Subconsulta con NOT IN', 'Obtén los usuarios que no tienen ningún pedido.', 'EASY', 'SUBQUERY', 'SELECT * FROM usuarios WHERE id NOT IN (SELECT id_usuario FROM pedidos)', true, NOW()),
(gen_random_uuid(), 'Subconsulta con EXISTS', 'Obtén los usuarios que tienen al menos un pedido mayor a 500.', 'MEDIUM', 'SUBQUERY', 'SELECT * FROM usuarios WHERE EXISTS (SELECT 1 FROM pedidos WHERE pedidos.id_usuario = usuarios.id AND pedidos.total > 500)', true, NOW()),
(gen_random_uuid(), 'Subconsulta con NOT EXISTS', 'Obtén los usuarios que no tienen pedidos completados.', 'MEDIUM', 'SUBQUERY', 'SELECT * FROM usuarios WHERE NOT EXISTS (SELECT 1 FROM pedidos WHERE pedidos.id_usuario = usuarios.id AND pedidos.estado = ''completado'')', true, NOW()),
(gen_random_uuid(), 'Subconsulta en SELECT', 'Obtén el nombre del usuario y la cantidad total de pedidos como columna.', 'MEDIUM', 'SUBQUERY', 'SELECT nombre, (SELECT COUNT(*) FROM pedidos WHERE pedidos.id_usuario = usuarios.id) AS total_pedidos FROM usuarios', true, NOW()),
(gen_random_uuid(), 'Subconsulta con ANY', 'Obtén los usuarios cuya edad sea mayor que cualquiera de los usuarios de "La Paz".', 'HARD', 'SUBQUERY', 'SELECT * FROM usuarios WHERE edad > ANY (SELECT edad FROM usuarios WHERE ciudad = ''La Paz'')', true, NOW()),
(gen_random_uuid(), 'Subconsulta con ALL', 'Obtén los usuarios cuya edad sea mayor que todos los usuarios de "La Paz".', 'HARD', 'SUBQUERY', 'SELECT * FROM usuarios WHERE edad > ALL (SELECT edad FROM usuarios WHERE ciudad = ''La Paz'')', true, NOW()),
(gen_random_uuid(), 'Subconsulta correlacionada', 'Obtén los usuarios que tienen un pedido con total mayor al promedio de todos sus pedidos.', 'HARD', 'SUBQUERY', 'SELECT DISTINCT u.* FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario WHERE p.total > (SELECT AVG(p2.total) FROM pedidos p2 WHERE p2.id_usuario = u.id)', true, NOW()),
(gen_random_uuid(), 'Subconsulta en FROM', 'Obtén el promedio de totales por usuario a partir de una subconsulta.', 'HARD', 'SUBQUERY', 'SELECT AVG(total_usuario) FROM (SELECT SUM(total) AS total_usuario FROM pedidos GROUP BY id_usuario) AS sub', true, NOW()),
(gen_random_uuid(), 'Subconsulta con JOIN', 'Obtén los usuarios con pedidos cuyo total supere el promedio general.', 'HARD', 'SUBQUERY', 'SELECT u.nombre, p.total FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario WHERE p.total > (SELECT AVG(total) FROM pedidos)', true, NOW()),

-- LIKE (9)
(gen_random_uuid(), 'LIKE empieza con', 'Obtén los usuarios cuyo nombre empiece con "A".', 'EASY', 'SELECT', 'SELECT * FROM usuarios WHERE nombre LIKE ''A%''', true, NOW()),
(gen_random_uuid(), 'LIKE termina con', 'Obtén los usuarios cuyo email termine en "@gmail.com".', 'EASY', 'SELECT', 'SELECT * FROM usuarios WHERE email LIKE ''%@gmail.com''', true, NOW()),
(gen_random_uuid(), 'LIKE contiene', 'Obtén los usuarios cuyo nombre contenga "an".', 'EASY', 'SELECT', 'SELECT * FROM usuarios WHERE nombre LIKE ''%an%''', true, NOW()),
(gen_random_uuid(), 'LIKE con underscore', 'Obtén los usuarios cuyo nombre tenga exactamente 5 caracteres.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE nombre LIKE ''_____''', true, NOW()),
(gen_random_uuid(), 'LIKE con NOT', 'Obtén los usuarios cuyo nombre no empiece con "A".', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE nombre NOT LIKE ''A%''', true, NOW()),
(gen_random_uuid(), 'LIKE con AND', 'Obtén los usuarios activos cuyo email contenga "admin".', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE email LIKE ''%admin%'' AND activo = true', true, NOW()),
(gen_random_uuid(), 'LIKE múltiples patrones', 'Obtén los usuarios cuyo nombre empiece con "A" o "M", ordenados por nombre.', 'HARD', 'SELECT', 'SELECT * FROM usuarios WHERE nombre LIKE ''A%'' OR nombre LIKE ''M%'' ORDER BY nombre ASC', true, NOW()),
(gen_random_uuid(), 'LIKE con ORDER BY', 'Obtén los usuarios con email de "hotmail.com" ordenados por nombre.', 'HARD', 'SELECT', 'SELECT * FROM usuarios WHERE email LIKE ''%@hotmail.com'' ORDER BY nombre', true, NOW()),
(gen_random_uuid(), 'LIKE con COUNT', 'Cuenta cuántos usuarios tienen email de "yahoo.com".', 'HARD', 'SELECT', 'SELECT COUNT(*) FROM usuarios WHERE email LIKE ''%@yahoo.com''', true, NOW()),

-- BETWEEN (6)
(gen_random_uuid(), 'BETWEEN edades', 'Obtén los usuarios cuya edad esté entre 18 y 30.', 'EASY', 'SELECT', 'SELECT * FROM usuarios WHERE edad BETWEEN 18 AND 30', true, NOW()),
(gen_random_uuid(), 'BETWEEN NOT', 'Obtén los usuarios cuya edad NO esté entre 18 y 65.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE edad NOT BETWEEN 18 AND 65', true, NOW()),
(gen_random_uuid(), 'BETWEEN fechas', 'Obtén los pedidos creados entre el 2024-01-01 y 2024-12-31.', 'MEDIUM', 'SELECT', 'SELECT * FROM pedidos WHERE fecha BETWEEN ''2024-01-01'' AND ''2024-12-31''', true, NOW()),
(gen_random_uuid(), 'BETWEEN con AND', 'Obtén los usuarios con edad entre 18 y 30 que estén activos.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE edad BETWEEN 18 AND 30 AND activo = true', true, NOW()),
(gen_random_uuid(), 'BETWEEN con ORDER BY', 'Obtén los pedidos con total entre 100 y 500 ordenados de mayor a menor.', 'HARD', 'SELECT', 'SELECT * FROM pedidos WHERE total BETWEEN 100 AND 500 ORDER BY total DESC', true, NOW()),
(gen_random_uuid(), 'BETWEEN con JOIN', 'Obtén los usuarios y sus pedidos con total entre 50 y 200.', 'HARD', 'SELECT', 'SELECT u.nombre, p.total FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario WHERE p.total BETWEEN 50 AND 200', true, NOW()),

-- IS NULL (9)
(gen_random_uuid(), 'IS NULL email', 'Obtén los usuarios que no tengan email registrado.', 'EASY', 'SELECT', 'SELECT * FROM usuarios WHERE email IS NULL', true, NOW()),
(gen_random_uuid(), 'IS NOT NULL', 'Obtén los usuarios que tengan email registrado.', 'EASY', 'SELECT', 'SELECT * FROM usuarios WHERE email IS NOT NULL', true, NOW()),
(gen_random_uuid(), 'IS NULL ciudad', 'Obtén los usuarios que no tengan ciudad registrada.', 'EASY', 'SELECT', 'SELECT * FROM usuarios WHERE ciudad IS NULL', true, NOW()),
(gen_random_uuid(), 'IS NULL con AND', 'Obtén los usuarios sin email y sin ciudad.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE email IS NULL AND ciudad IS NULL', true, NOW()),
(gen_random_uuid(), 'IS NULL con OR', 'Obtén los usuarios sin email o sin ciudad.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE email IS NULL OR ciudad IS NULL', true, NOW()),
(gen_random_uuid(), 'IS NULL con COUNT', 'Cuenta cuántos usuarios no tienen email.', 'MEDIUM', 'SELECT', 'SELECT COUNT(*) FROM usuarios WHERE email IS NULL', true, NOW()),
(gen_random_uuid(), 'COALESCE con NULL', 'Obtén el nombre y la ciudad, mostrando "Sin ciudad" si es NULL.', 'HARD', 'SELECT', 'SELECT nombre, COALESCE(ciudad, ''Sin ciudad'') AS ciudad FROM usuarios', true, NOW()),
(gen_random_uuid(), 'IS NULL con LEFT JOIN', 'Obtén los usuarios que no tienen pedidos.', 'HARD', 'SELECT', 'SELECT u.nombre FROM usuarios u LEFT JOIN pedidos p ON u.id = p.id_usuario WHERE p.id IS NULL', true, NOW()),
(gen_random_uuid(), 'IS NULL con GROUP BY', 'Cuenta cuántos usuarios tienen email NULL por ciudad.', 'HARD', 'SELECT', 'SELECT ciudad, COUNT(*) FROM usuarios WHERE email IS NULL GROUP BY ciudad', true, NOW()),

-- ORDER BY (9)
(gen_random_uuid(), 'ORDER BY ASC', 'Obtén todos los usuarios ordenados por nombre A-Z.', 'EASY', 'SELECT', 'SELECT * FROM usuarios ORDER BY nombre ASC', true, NOW()),
(gen_random_uuid(), 'ORDER BY DESC', 'Obtén todos los usuarios ordenados por edad de mayor a menor.', 'EASY', 'SELECT', 'SELECT * FROM usuarios ORDER BY edad DESC', true, NOW()),
(gen_random_uuid(), 'ORDER BY con WHERE', 'Obtén los usuarios activos ordenados por nombre.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE activo = true ORDER BY nombre ASC', true, NOW()),
(gen_random_uuid(), 'ORDER BY múltiples columnas', 'Obtén los usuarios ordenados por ciudad y luego por nombre.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios ORDER BY ciudad ASC, nombre ASC', true, NOW()),
(gen_random_uuid(), 'ORDER BY DESC y ASC', 'Obtén los usuarios ordenados por ciudad ASC y edad DESC.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios ORDER BY ciudad ASC, edad DESC', true, NOW()),
(gen_random_uuid(), 'ORDER BY con LIMIT', 'Obtén los 3 usuarios más jóvenes.', 'HARD', 'SELECT', 'SELECT * FROM usuarios ORDER BY edad ASC LIMIT 3', true, NOW()),
(gen_random_uuid(), 'ORDER BY con expresión', 'Obtén los usuarios ordenados por la longitud de su nombre.', 'HARD', 'SELECT', 'SELECT * FROM usuarios ORDER BY LENGTH(nombre) DESC', true, NOW()),
(gen_random_uuid(), 'ORDER BY con COUNT', 'Obtén las ciudades ordenadas por cantidad de usuarios.', 'HARD', 'SELECT', 'SELECT ciudad, COUNT(*) FROM usuarios GROUP BY ciudad ORDER BY COUNT(*) DESC', true, NOW()),

-- DISTINCT (6)
(gen_random_uuid(), 'DISTINCT ciudades', 'Obtén las ciudades distintas de las que hay usuarios.', 'EASY', 'SELECT', 'SELECT DISTINCT ciudad FROM usuarios', true, NOW()),
(gen_random_uuid(), 'DISTINCT roles', 'Obtén los roles distintos de usuarios.', 'EASY', 'SELECT', 'SELECT DISTINCT rol FROM usuarios', true, NOW()),
(gen_random_uuid(), 'DISTINCT con WHERE', 'Obtén las ciudades distintas de usuarios activos.', 'MEDIUM', 'SELECT', 'SELECT DISTINCT ciudad FROM usuarios WHERE activo = true', true, NOW()),
(gen_random_uuid(), 'DISTINCT con COUNT', 'Cuenta cuántas ciudades distintas hay.', 'MEDIUM', 'SELECT', 'SELECT COUNT(DISTINCT ciudad) FROM usuarios', true, NOW()),
(gen_random_uuid(), 'DISTINCT con ORDER BY', 'Obtén las ciudades distintas ordenadas alfabéticamente.', 'HARD', 'SELECT', 'SELECT DISTINCT ciudad FROM usuarios ORDER BY ciudad ASC', true, NOW()),
(gen_random_uuid(), 'DISTINCT múltiples columnas', 'Obtén las combinaciones distintas de ciudad y rol.', 'HARD', 'SELECT', 'SELECT DISTINCT ciudad, rol FROM usuarios', true, NOW()),

-- DDL (12)
(gen_random_uuid(), 'CREATE TABLE simple', 'Crea una tabla llamada productos con id, nombre y precio.', 'EASY', 'DDL', 'CREATE TABLE productos (id SERIAL PRIMARY KEY, nombre VARCHAR(100), precio DECIMAL(10,2))', true, NOW()),
(gen_random_uuid(), 'CREATE TABLE con DEFAULT', 'Crea una tabla llamada empleados con salario por defecto 0.', 'EASY', 'DDL', 'CREATE TABLE empleados (id SERIAL PRIMARY KEY, nombre VARCHAR(100), salario DECIMAL(10,2) DEFAULT 0)', true, NOW()),
(gen_random_uuid(), 'CREATE TABLE con NOT NULL', 'Crea una tabla llamada libros con nombre obligatorio.', 'EASY', 'DDL', 'CREATE TABLE libros (id SERIAL PRIMARY KEY, nombre VARCHAR(200) NOT NULL, anio INT)', true, NOW()),
(gen_random_uuid(), 'ALTER TABLE ADD COLUMN', 'Agrega la columna stock de tipo INT a la tabla productos.', 'MEDIUM', 'DDL', 'ALTER TABLE productos ADD COLUMN stock INT', true, NOW()),
(gen_random_uuid(), 'ALTER TABLE ADD CONSTRAINT', 'Agrega una constraint UNIQUE al email en la tabla usuarios.', 'MEDIUM', 'DDL', 'ALTER TABLE usuarios ADD CONSTRAINT unique_email UNIQUE (email)', true, NOW()),
(gen_random_uuid(), 'ALTER TABLE ADD CHECK', 'Agrega un CHECK para que el precio sea mayor a 0 en productos.', 'MEDIUM', 'DDL', 'ALTER TABLE productos ADD CHECK (precio > 0)', true, NOW()),
(gen_random_uuid(), 'CREATE TABLE con FK', 'Crea una tabla pedidos con clave foránea a usuarios.', 'HARD', 'DDL', 'CREATE TABLE pedidos (id SERIAL PRIMARY KEY, id_usuario INT REFERENCES usuarios(id), total DECIMAL(10,2))', true, NOW()),
(gen_random_uuid(), 'CREATE TABLE con CHECK', 'Crea una tabla empleados con salario CHECK > 0 y edad CHECK >= 18.', 'HARD', 'DDL', 'CREATE TABLE empleados (id SERIAL PRIMARY KEY, nombre VARCHAR(100), salario DECIMAL(10,2) CHECK (salario > 0), edad INT CHECK (edad >= 18))', true, NOW()),
(gen_random_uuid(), 'ALTER TABLE DROP COLUMN', 'Elimina la columna stock de la tabla productos.', 'HARD', 'DDL', 'ALTER TABLE productos DROP COLUMN stock', true, NOW()),
(gen_random_uuid(), 'DROP TABLE IF EXISTS', 'Elimina la tabla temporal temp_ventas si existe.', 'HARD', 'DDL', 'DROP TABLE IF EXISTS temp_ventas', true, NOW()),
(gen_random_uuid(), 'ALTER TABLE RENAME COLUMN', 'Renombra la columna nombre a nombre_completo en usuarios.', 'HARD', 'DDL', 'ALTER TABLE usuarios RENAME COLUMN nombre TO nombre_completo', true, NOW()),
(gen_random_uuid(), 'ALTER TABLE SET DEFAULT', 'Cambia el valor por defecto de activo a true en usuarios.', 'HARD', 'DDL', 'ALTER TABLE usuarios ALTER COLUMN activo SET DEFAULT true', true, NOW()),

-- DCL (6)
(gen_random_uuid(), 'GRANT SELECT', 'Otorga permiso de SELECT sobre la tabla usuarios al usuario invitado.', 'EASY', 'DCL', 'GRANT SELECT ON usuarios TO invitado', true, NOW()),
(gen_random_uuid(), 'GRANT INSERT', 'Otorga permiso de INSERT sobre la tabla pedidos al usuario vendedor.', 'EASY', 'DCL', 'GRANT INSERT ON pedidos TO vendedor', true, NOW()),
(gen_random_uuid(), 'GRANT SELECT, INSERT', 'Otorga permisos de SELECT e INSERT sobre la tabla pedidos al usuario vendedor.', 'MEDIUM', 'DCL', 'GRANT SELECT, INSERT ON pedidos TO vendedor', true, NOW()),
(gen_random_uuid(), 'GRANT ALL', 'Otorga todos los permisos sobre la tabla usuarios al usuario admin.', 'MEDIUM', 'DCL', 'GRANT ALL ON usuarios TO admin', true, NOW()),
(gen_random_uuid(), 'REVOKE SELECT', 'Revoca el permiso de SELECT sobre usuarios al usuario invitado.', 'HARD', 'DCL', 'REVOKE SELECT ON usuarios FROM invitado', true, NOW()),
(gen_random_uuid(), 'REVOKE ALL', 'Revoca todos los permisos sobre la tabla usuarios al usuario invitado.', 'HARD', 'DCL', 'REVOKE ALL ON usuarios FROM invitado', true, NOW()),

-- TCL (9)
(gen_random_uuid(), 'COMMIT básico', 'Confirma la transacción actual.', 'EASY', 'TCL', 'COMMIT', true, NOW()),
(gen_random_uuid(), 'ROLLBACK básico', 'Deshace todos los cambios de la transacción actual.', 'EASY', 'TCL', 'ROLLBACK', true, NOW()),
(gen_random_uuid(), 'BEGIN TRANSACTION', 'Inicia una nueva transacción.', 'MEDIUM', 'TCL', 'BEGIN TRANSACTION', true, NOW()),
(gen_random_uuid(), 'SAVEPOINT', 'Crea un punto de guardado llamado punto1.', 'MEDIUM', 'TCL', 'SAVEPOINT punto1', true, NOW()),
(gen_random_uuid(), 'ROLLBACK TO SAVEPOINT', 'Deshace los cambios hasta el punto de guardado sp1.', 'MEDIUM', 'TCL', 'ROLLBACK TO SAVEPOINT sp1', true, NOW()),
(gen_random_uuid(), 'BEGIN + COMMIT', 'Inicia una transacción, hace un INSERT y confirma.', 'HARD', 'TCL', 'BEGIN TRANSACTION; INSERT INTO usuarios (nombre, email) VALUES (''Test'', ''test@email.com''); COMMIT', true, NOW()),
(gen_random_uuid(), 'SAVEPOINT y ROLLBACK parcial', 'Crea un savepoint sp1, inserta un registro y haz ROLLBACK hasta sp1.', 'HARD', 'TCL', 'SAVEPOINT sp1; INSERT INTO usuarios (nombre, email) VALUES (''Temp'', ''temp@email.com''); ROLLBACK TO SAVEPOINT sp1', true, NOW()),
(gen_random_uuid(), 'SAVEPOINT y COMMIT', 'Crea un savepoint, inserta un registro, haz rollback al savepoint y luego confirma la transacción.', 'HARD', 'TCL', 'SAVEPOINT sp1; INSERT INTO usuarios (nombre, email) VALUES (''Temp'', ''temp@email.com''); ROLLBACK TO SAVEPOINT sp1; COMMIT', true, NOW()),

-- AGGREGATE (12)
(gen_random_uuid(), 'COUNT básico', 'Cuenta el total de usuarios registrados.', 'EASY', 'AGGREGATE', 'SELECT COUNT(*) FROM usuarios', true, NOW()),
(gen_random_uuid(), 'COUNT con WHERE', 'Cuenta cuántos usuarios están activos.', 'EASY', 'AGGREGATE', 'SELECT COUNT(*) FROM usuarios WHERE activo = true', true, NOW()),
(gen_random_uuid(), 'COUNT DISTINCT', 'Cuenta cuántas ciudades distintas hay en usuarios.', 'EASY', 'AGGREGATE', 'SELECT COUNT(DISTINCT ciudad) FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SUM simple', 'Obtén la suma total de todos los pedidos.', 'MEDIUM', 'AGGREGATE', 'SELECT SUM(total) FROM pedidos', true, NOW()),
(gen_random_uuid(), 'AVG simple', 'Obtén el promedio de edad de los usuarios.', 'MEDIUM', 'AGGREGATE', 'SELECT AVG(edad) FROM usuarios', true, NOW()),
(gen_random_uuid(), 'MIN y MAX', 'Obtén la edad mínima y máxima de los usuarios.', 'MEDIUM', 'AGGREGATE', 'SELECT MIN(edad), MAX(edad) FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SUM y AVG con GROUP BY', 'Obtén la suma total y el promedio de ventas por vendedor.', 'HARD', 'AGGREGATE', 'SELECT id_vendedor, SUM(total), AVG(total) FROM ventas GROUP BY id_vendedor', true, NOW()),
(gen_random_uuid(), 'COUNT con HAVING', 'Obtén las ciudades con más de 3 usuarios.', 'HARD', 'AGGREGATE', 'SELECT ciudad, COUNT(*) FROM usuarios GROUP BY ciudad HAVING COUNT(*) > 3', true, NOW()),
(gen_random_uuid(), 'MAX y MIN con GROUP BY', 'Obtén el máximo y mínimo de edad por ciudad.', 'HARD', 'AGGREGATE', 'SELECT ciudad, MAX(edad), MIN(edad) FROM usuarios GROUP BY ciudad', true, NOW()),
(gen_random_uuid(), 'COUNT y SUM juntos', 'Obtén la cantidad de pedidos y el total acumulado por usuario.', 'HARD', 'AGGREGATE', 'SELECT id_usuario, COUNT(*), SUM(total) FROM pedidos GROUP BY id_usuario', true, NOW()),
(gen_random_uuid(), 'AVG con WHERE y GROUP BY', 'Obtén el promedio de edad de usuarios activos por ciudad.', 'HARD', 'AGGREGATE', 'SELECT ciudad, AVG(edad) FROM usuarios WHERE activo = true GROUP BY ciudad', true, NOW()),
(gen_random_uuid(), 'Múltiples agregaciones', 'Obtén COUNT, SUM, AVG, MIN y MAX de total de pedidos.', 'HARD', 'AGGREGATE', 'SELECT COUNT(*), SUM(total), AVG(total), MIN(total), MAX(total) FROM pedidos', true, NOW()),

-- UNION (6)
(gen_random_uuid(), 'UNION simple', 'Obtén todas las ciudades de usuarios y clientes sin duplicados.', 'EASY', 'SELECT', 'SELECT ciudad FROM usuarios UNION SELECT ciudad FROM clientes', true, NOW()),
(gen_random_uuid(), 'UNION ALL', 'Obtén todas las ciudades de usuarios y clientes con duplicados.', 'EASY', 'SELECT', 'SELECT ciudad FROM usuarios UNION ALL SELECT ciudad FROM clientes', true, NOW()),
(gen_random_uuid(), 'UNION con WHERE', 'Obtén los nombres de usuarios activos y clientes activos.', 'MEDIUM', 'SELECT', 'SELECT nombre FROM usuarios WHERE activo = true UNION SELECT nombre FROM clientes WHERE activo = true', true, NOW()),
(gen_random_uuid(), 'UNION con ORDER BY', 'Obtén todos los nombres de usuarios y clientes ordenados.', 'MEDIUM', 'SELECT', 'SELECT nombre FROM usuarios UNION SELECT nombre FROM clientes ORDER BY nombre ASC', true, NOW()),
(gen_random_uuid(), 'UNION ALL con WHERE', 'Obtén los emails de usuarios y clientes con dominio gmail.', 'HARD', 'SELECT', 'SELECT email FROM usuarios WHERE email LIKE ''%@gmail.com'' UNION ALL SELECT email FROM clientes WHERE email LIKE ''%@gmail.com''', true, NOW()),
(gen_random_uuid(), 'UNION con COUNT', 'Cuenta cuántos nombres distintos hay entre usuarios y clientes.', 'HARD', 'SELECT', 'SELECT COUNT(*) FROM (SELECT nombre FROM usuarios UNION SELECT nombre FROM clientes) AS nombres_unicos', true, NOW()),

-- CTE / WITH (6)
(gen_random_uuid(), 'WITH simple', 'Crea una CTE llamada usuarios_activos y selecciona todos sus registros.', 'EASY', 'SELECT', 'WITH usuarios_activos AS (SELECT * FROM usuarios WHERE activo = true) SELECT * FROM usuarios_activos', true, NOW()),
(gen_random_uuid(), 'WITH con WHERE', 'Crea una CTE de usuarios mayores de edad y cuéntalos.', 'MEDIUM', 'SELECT', 'WITH mayores_edad AS (SELECT * FROM usuarios WHERE edad >= 18) SELECT COUNT(*) FROM mayores_edad', true, NOW()),
(gen_random_uuid(), 'WITH con JOIN', 'Crea una CTE de pedidos recientes y haz JOIN con usuarios.', 'MEDIUM', 'SELECT', 'WITH pedidos_recientes AS (SELECT * FROM pedidos WHERE fecha >= ''2024-01-01'') SELECT u.nombre, p.total FROM usuarios u INNER JOIN pedidos_recientes p ON u.id = p.id_usuario', true, NOW()),
(gen_random_uuid(), 'WITH múltiples CTEs', 'Crea 2 CTEs: una de usuarios activos y otra de pedidos, y combínalas.', 'HARD', 'SELECT', 'WITH activos AS (SELECT * FROM usuarios WHERE activo = true), total_pedidos AS (SELECT id_usuario, COUNT(*) AS cantidad FROM pedidos GROUP BY id_usuario) SELECT a.nombre, COALESCE(t.cantidad, 0) FROM activos a LEFT JOIN total_pedidos t ON a.id = t.id_usuario', true, NOW()),
(gen_random_uuid(), 'WITH con GROUP BY', 'Crea una CTE agrupando ventas por vendedor y filtra con WHERE.', 'HARD', 'SELECT', 'WITH ventas_vendedor AS (SELECT id_vendedor, SUM(total) AS total_ventas FROM ventas GROUP BY id_vendedor) SELECT * FROM ventas_vendedor WHERE total_ventas > 1000', true, NOW()),
(gen_random_uuid(), 'WITH RECURSIVE', 'Crea una CTE recursiva que genere números del 1 al 10.', 'HARD', 'SELECT', 'WITH RECURSIVE numeros(n) AS (SELECT 1 UNION ALL SELECT n + 1 FROM numeros WHERE n < 10) SELECT * FROM numeros', true, NOW()),

-- WINDOW / OVER (6)
(gen_random_uuid(), 'ROW_NUMBER OVER', 'Asigna un número de fila a cada usuario ordenado por edad.', 'EASY', 'SELECT', 'SELECT nombre, edad, ROW_NUMBER() OVER (ORDER BY edad DESC) AS posicion FROM usuarios', true, NOW()),
(gen_random_uuid(), 'RANK OVER', 'Asigna un ranking a usuarios por edad, manejando empates.', 'MEDIUM', 'SELECT', 'SELECT nombre, edad, RANK() OVER (ORDER BY edad DESC) AS ranking FROM usuarios', true, NOW()),
(gen_random_uuid(), 'ROW_NUMBER PARTITION BY', 'Asigna un número de fila por ciudad ordenado por edad.', 'MEDIUM', 'SELECT', 'SELECT nombre, ciudad, edad, ROW_NUMBER() OVER (PARTITION BY ciudad ORDER BY edad DESC) AS pos_ciudad FROM usuarios', true, NOW()),
(gen_random_uuid(), 'SUM OVER ORDER BY', 'Obtén un acumulado de total de pedidos ordenado por fecha.', 'HARD', 'SELECT', 'SELECT id, fecha, total, SUM(total) OVER (ORDER BY fecha) AS acumulado FROM pedidos', true, NOW()),
(gen_random_uuid(), 'AVG OVER PARTITION BY', 'Obtén el total por pedido y el promedio por ciudad del usuario.', 'HARD', 'SELECT', 'SELECT u.nombre, u.ciudad, p.total, AVG(p.total) OVER (PARTITION BY u.ciudad) AS promedio_ciudad FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario', true, NOW()),
(gen_random_uuid(), 'RANK PARTITION BY', 'Rankea los usuarios por edad dentro de cada ciudad.', 'HARD', 'SELECT', 'SELECT nombre, ciudad, edad, RANK() OVER (PARTITION BY ciudad ORDER BY edad DESC) AS rank_ciudad FROM usuarios', true, NOW()),

-- CASE (6)
(gen_random_uuid(), 'CASE simple', 'Obtén el nombre y una columna "mayoria_edad" que diga "Mayor" si edad >= 18 o "Menor" si no.', 'EASY', 'SELECT', 'SELECT nombre, CASE WHEN edad >= 18 THEN ''Mayor'' ELSE ''Menor'' END AS mayoria_edad FROM usuarios', true, NOW()),
(gen_random_uuid(), 'CASE con ELSE', 'Obtén el nombre del usuario y clasifícalo por edad: "Joven", "Adulto" o "Adulto Mayor".', 'EASY', 'SELECT', 'SELECT nombre, CASE WHEN edad < 18 THEN ''Joven'' WHEN edad < 60 THEN ''Adulto'' ELSE ''Adulto Mayor'' END AS categoria FROM usuarios', true, NOW()),
(gen_random_uuid(), 'CASE en WHERE', 'Obtén los usuarios donde el CASE devuelva "Adulto Mayor".', 'MEDIUM', 'SELECT', 'SELECT * FROM (SELECT *, CASE WHEN edad >= 60 THEN ''Adulto Mayor'' WHEN edad >= 18 THEN ''Adulto'' ELSE ''Joven'' END AS categoria FROM usuarios) AS sub WHERE sub.categoria = ''Adulto Mayor''', true, NOW()),
(gen_random_uuid(), 'CASE con ORDER BY', 'Obtén usuarios ordenados por categoría de edad.', 'MEDIUM', 'SELECT', 'SELECT nombre, edad, CASE WHEN edad >= 60 THEN 3 WHEN edad >= 18 THEN 2 ELSE 1 END AS prioridad FROM usuarios ORDER BY prioridad DESC', true, NOW()),
(gen_random_uuid(), 'CASE anidado con JOIN', 'Obtén el usuario, su pedido y el total como "Bajo", "Medio" o "Alto".', 'HARD', 'SELECT', 'SELECT u.nombre, p.total, CASE WHEN p.total < 100 THEN ''Bajo'' WHEN p.total BETWEEN 100 AND 500 THEN ''Medio'' ELSE ''Alto'' END AS categoria FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario', true, NOW()),
(gen_random_uuid(), 'CASE con agregación', 'Cuenta cuántos usuarios hay en cada categoría de edad.', 'HARD', 'SELECT', 'SELECT CASE WHEN edad < 18 THEN ''Menor'' WHEN edad < 60 THEN ''Adulto'' ELSE ''Adulto Mayor'' END AS categoria, COUNT(*) FROM usuarios GROUP BY categoria', true, NOW()),

-- CAST (6)
(gen_random_uuid(), 'CAST a TEXT', 'Obtén el nombre y convierte la edad a texto.', 'EASY', 'SELECT', 'SELECT nombre, CAST(edad AS TEXT) FROM usuarios', true, NOW()),
(gen_random_uuid(), 'CAST a INTEGER', 'Convierte el total de pedido a entero.', 'MEDIUM', 'SELECT', 'SELECT CAST(total AS INTEGER) FROM pedidos', true, NOW()),
(gen_random_uuid(), 'CAST con WHERE', 'Obtén usuarios donde CAST(edad AS TEXT) LIKE 2%', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE CAST(edad AS TEXT) LIKE ''2%''', true, NOW()),
(gen_random_uuid(), 'CAST con ORDER BY', 'Obtén pedidos ordenados por total convertido a texto.', 'MEDIUM', 'SELECT', 'SELECT *, CAST(total AS TEXT) AS total_texto FROM pedidos ORDER BY total_texto', true, NOW()),
(gen_random_uuid(), 'CAST en SELECT', 'Obtén el total como texto concatenado con la moneda.', 'HARD', 'SELECT', 'SELECT CONCAT(''$'', CAST(total AS TEXT)) AS total_formateado FROM pedidos', true, NOW()),
(gen_random_uuid(), 'CAST con JOIN', 'Obtén usuarios y pedidos uniendo por CAST del id.', 'HARD', 'SELECT', 'SELECT u.nombre, p.total FROM usuarios u INNER JOIN pedidos p ON CAST(u.id AS TEXT) = CAST(p.id_usuario AS TEXT)', true, NOW()),

-- CREATE INDEX (3)
(gen_random_uuid(), 'CREATE INDEX simple', 'Crea un índice en la columna email de la tabla usuarios.', 'EASY', 'DDL', 'CREATE INDEX idx_email ON usuarios (email)', true, NOW()),
(gen_random_uuid(), 'CREATE UNIQUE INDEX', 'Crea un índice único en la columna email de usuarios.', 'MEDIUM', 'DDL', 'CREATE UNIQUE INDEX idx_unique_email ON usuarios (email)', true, NOW()),
(gen_random_uuid(), 'CREATE INDEX compuesto', 'Crea un índice compuesto en ciudad y edad de usuarios.', 'HARD', 'DDL', 'CREATE INDEX idx_ciudad_edad ON usuarios (ciudad, edad)', true, NOW()),

-- CREATE VIEW (3)
(gen_random_uuid(), 'CREATE VIEW básica', 'Crea una vista que muestre usuarios activos.', 'EASY', 'DDL', 'CREATE VIEW vista_usuarios_activos AS SELECT * FROM usuarios WHERE activo = true', true, NOW()),
(gen_random_uuid(), 'CREATE VIEW con JOIN', 'Crea una vista de usuarios con su total de pedidos.', 'MEDIUM', 'DDL', 'CREATE VIEW vista_pedidos_usuario AS SELECT u.nombre, COUNT(p.id) AS cantidad FROM usuarios u LEFT JOIN pedidos p ON u.id = p.id_usuario GROUP BY u.nombre', true, NOW()),
(gen_random_uuid(), 'CREATE VIEW con WHERE y ORDER', 'Crea una vista de los 10 mejores clientes por gasto total.', 'HARD', 'DDL', 'CREATE VIEW vista_top_clientes AS SELECT u.nombre, SUM(p.total) AS gasto_total FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario GROUP BY u.nombre ORDER BY gasto_total DESC LIMIT 10', true, NOW()),

-- LIMIT / OFFSET (6)
(gen_random_uuid(), 'LIMIT básico', 'Obtén los primeros 5 usuarios.', 'EASY', 'SELECT', 'SELECT * FROM usuarios LIMIT 5', true, NOW()),
(gen_random_uuid(), 'LIMIT con WHERE', 'Obtén los primeros 3 usuarios activos.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE activo = true LIMIT 3', true, NOW()),
(gen_random_uuid(), 'LIMIT con ORDER BY', 'Obtén los 5 usuarios más jóvenes.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios ORDER BY edad ASC LIMIT 5', true, NOW()),
(gen_random_uuid(), 'LIMIT con OFFSET', 'Obtén 5 usuarios saltando los primeros 3.', 'HARD', 'SELECT', 'SELECT * FROM usuarios LIMIT 5 OFFSET 3', true, NOW()),
(gen_random_uuid(), 'OFFSET simple', 'Obtén todos los usuarios saltando los primeros 10.', 'HARD', 'SELECT', 'SELECT * FROM usuarios OFFSET 10', true, NOW()),
(gen_random_uuid(), 'LIMIT con páginación', 'Obtén los usuarios de la página 3 (10 por página).', 'HARD', 'SELECT', 'SELECT * FROM usuarios LIMIT 10 OFFSET 20', true, NOW()),

-- MERGE (3)
(gen_random_uuid(), 'MERGE básico', 'Fusiona los datos de clientes en usuarios si el email coincide.', 'EASY', 'SELECT', 'MERGE INTO usuarios u USING clientes c ON u.email = c.email WHEN MATCHED THEN UPDATE SET nombre = c.nombre WHEN NOT MATCHED THEN INSERT (nombre, email) VALUES (c.nombre, c.email)', true, NOW()),
(gen_random_uuid(), 'MERGE con UPDATE', 'Actualiza los usuarios existentes desde clientes.', 'MEDIUM', 'SELECT', 'MERGE INTO usuarios u USING clientes c ON u.email = c.email WHEN MATCHED THEN UPDATE SET u.nombre = c.nombre, u.ciudad = c.ciudad', true, NOW()),
(gen_random_uuid(), 'MERGE con DELETE', 'Fusiona y elimina los usuarios que no están en clientes.', 'HARD', 'SELECT', 'MERGE INTO usuarios u USING clientes c ON u.email = c.email WHEN NOT MATCHED BY SOURCE THEN DELETE', true, NOW()),

-- TRUNCATE (3)
(gen_random_uuid(), 'TRUNCATE TABLE', 'Elimina todos los registros de la tabla temp_ventas.', 'EASY', 'DDL', 'TRUNCATE TABLE temp_ventas', true, NOW()),
(gen_random_uuid(), 'TRUNCATE RESTART IDENTITY', 'Elimina los registros de temp_logs y reinicia el contador de ID.', 'MEDIUM', 'DDL', 'TRUNCATE TABLE temp_logs RESTART IDENTITY', true, NOW()),
(gen_random_uuid(), 'TRUNCATE CASCADE', 'Elimina todos los registros de la tabla categorías y sus dependientes.', 'HARD', 'DDL', 'TRUNCATE TABLE categorias CASCADE', true, NOW()),

-- EXPLAIN (3)
(gen_random_uuid(), 'EXPLAIN básico', 'Muestra el plan de ejecución de un SELECT básico.', 'EASY', 'SELECT', 'EXPLAIN SELECT * FROM usuarios', true, NOW()),
(gen_random_uuid(), 'EXPLAIN con WHERE', 'Muestra el plan de ejecución de un SELECT con WHERE.', 'MEDIUM', 'SELECT', 'EXPLAIN SELECT * FROM usuarios WHERE edad > 18', true, NOW()),
(gen_random_uuid(), 'EXPLAIN con JOIN', 'Muestra el plan de ejecución de un SELECT con JOIN.', 'HARD', 'SELECT', 'EXPLAIN SELECT u.nombre, p.total FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario', true, NOW()),

-- COMMENT (3)
(gen_random_uuid(), 'COMMENT ON TABLE', 'Agrega un comentario a la tabla usuarios.', 'EASY', 'DDL', 'COMMENT ON TABLE usuarios IS ''Tabla principal de usuarios del sistema''', true, NOW()),
(gen_random_uuid(), 'COMMENT ON COLUMN', 'Agrega un comentario a la columna email de la tabla usuarios.', 'MEDIUM', 'DDL', 'COMMENT ON COLUMN usuarios.email IS ''Correo electrónico único del usuario''', true, NOW()),
(gen_random_uuid(), 'COMMENT múltiple', 'Agrega comentarios a las columnas nombre y edad de usuarios.', 'HARD', 'DDL', 'COMMENT ON COLUMN usuarios.nombre IS ''Nombre completo del usuario''; COMMENT ON COLUMN usuarios.edad IS ''Edad en años''', true, NOW()),

-- Ejercicios combinados EXTRA (10+)
(gen_random_uuid(), 'SELECT + JOIN + GROUP BY', 'Obtén el nombre del usuario y la cantidad de pedidos completados.', 'HARD', 'SELECT', 'SELECT u.nombre, COUNT(p.id) FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario WHERE p.estado = ''completado'' GROUP BY u.nombre', true, NOW()),
(gen_random_uuid(), 'SELECT + JOIN + HAVING', 'Obtén los usuarios con más de 3 pedidos.', 'HARD', 'SELECT', 'SELECT u.nombre, COUNT(p.id) FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario GROUP BY u.nombre HAVING COUNT(p.id) > 3', true, NOW()),
(gen_random_uuid(), 'SELECT + LIKE + ORDER BY', 'Obtén usuarios cuyo nombre contenga "an", ordenados por edad.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE nombre LIKE ''%an%'' ORDER BY edad DESC', true, NOW()),
(gen_random_uuid(), 'SELECT + BETWEEN + JOIN', 'Obtén usuarios con edad entre 25 y 40 y sus pedidos.', 'MEDIUM', 'SELECT', 'SELECT u.nombre, u.edad, p.total FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario WHERE u.edad BETWEEN 25 AND 40', true, NOW()),
(gen_random_uuid(), 'SELECT + IN + ORDER BY', 'Obtén usuarios de tres ciudades específicas ordenados por nombre.', 'MEDIUM', 'SELECT', 'SELECT * FROM usuarios WHERE ciudad IN (''La Paz'', ''Cochabamba'', ''Santa Cruz'') ORDER BY nombre ASC', true, NOW()),
(gen_random_uuid(), 'INSERT SELECT con JOIN', 'Inserta en clientes los usuarios con pedidos mayores a 1000.', 'HARD', 'INSERT', 'INSERT INTO clientes (nombre, email) SELECT DISTINCT u.nombre, u.email FROM usuarios u INNER JOIN pedidos p ON u.id = p.id_usuario WHERE p.total > 1000', true, NOW()),
(gen_random_uuid(), 'UPDATE con CASE y WHERE', 'Actualiza el estado según la edad: activo true si >= 18.', 'HARD', 'UPDATE', 'UPDATE usuarios SET activo = CASE WHEN edad >= 18 THEN true ELSE false END', true, NOW()),
(gen_random_uuid(), 'DELETE con subquery múltiple', 'Elimina usuarios sin pedidos y sin comentarios.', 'HARD', 'DELETE', 'DELETE FROM usuarios WHERE id NOT IN (SELECT id_usuario FROM pedidos) AND id NOT IN (SELECT id_usuario FROM comentarios)', true, NOW()),
(gen_random_uuid(), 'SELECT con múltiples subqueries', 'Obtén nombre, total_pedidos y promedio_gasto del usuario.', 'HARD', 'SELECT', 'SELECT nombre, (SELECT COUNT(*) FROM pedidos WHERE id_usuario = usuarios.id) AS total_pedidos, (SELECT AVG(total) FROM pedidos WHERE id_usuario = usuarios.id) AS promedio_gasto FROM usuarios', true, NOW()),
(gen_random_uuid(), 'FULL OUTER JOIN con NULL', 'Obtén todos los usuarios y pedidos identificando los que no tienen correspondencia.', 'HARD', 'SELECT', 'SELECT u.nombre, p.id AS pedido_id FROM usuarios u FULL OUTER JOIN pedidos p ON u.id = p.id_usuario WHERE u.id IS NULL OR p.id IS NULL', true, NOW()),
(gen_random_uuid(), 'SELECT + GROUP BY + HAVING + ORDER BY', 'Obtén las ciudades con más de 2 usuarios activos ordenadas.', 'HARD', 'SELECT', 'SELECT ciudad, COUNT(*) FROM usuarios WHERE activo = true GROUP BY ciudad HAVING COUNT(*) > 2 ORDER BY COUNT(*) DESC', true, NOW()),
(gen_random_uuid(), 'SELF JOIN empleados-jefes', 'Obtén todos los empleados y el nombre de su jefe.', 'HARD', 'SELECT', 'SELECT e.nombre AS empleado, j.nombre AS jefe FROM empleados e LEFT JOIN empleados j ON e.id_jefe = j.id', true, NOW()),
(gen_random_uuid(), 'UPDATE con JOIN y cálculo', 'Actualiza el total de pedidos sumando un 10% si pertenecen a usuarios VIP.', 'HARD', 'UPDATE', 'UPDATE pedidos SET total = total * 1.1 WHERE id_usuario IN (SELECT id FROM usuarios WHERE rol = ''vip'')', true, NOW()),
(gen_random_uuid(), 'SELECT + COALESCE + JOIN', 'Obtén el nombre del usuario y el total del pedido, mostrando 0 si no tiene.', 'HARD', 'SELECT', 'SELECT u.nombre, COALESCE(SUM(p.total), 0) FROM usuarios u LEFT JOIN pedidos p ON u.id = p.id_usuario GROUP BY u.nombre', true, NOW()),
(gen_random_uuid(), 'WITH RECURSIVE jerarquía', 'Crea una CTE recursiva para listar la jerarquía de empleados desde un jefe específico.', 'HARD', 'SELECT', 'WITH RECURSIVE jerarquia AS (SELECT id, nombre, id_jefe, 1 AS nivel FROM empleados WHERE id_jefe IS NULL UNION ALL SELECT e.id, e.nombre, e.id_jefe, j.nivel + 1 FROM empleados e INNER JOIN jerarquia j ON e.id_jefe = j.id) SELECT * FROM jerarquia ORDER BY nivel', true, NOW());
