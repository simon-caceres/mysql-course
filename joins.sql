SELECT 
    libros.titulo ,
    CONCAT(autores.nombre , " ", autores.apellido) AS autor,
    libros.fecha_creacion
FROM libros 
INNER JOIN autores 
ON libros.autor_id = autores.autor_id 
    AND autores.pseudonimo IS NOT NULL;

-- si tienen el mismo nombre podemos utilizar la subclausla using

SELECT 
    libros.titulo ,
    CONCAT(autores.nombre , " ", autores.apellido) AS autor,
    libros.fecha_creacion
FROM libros 
INNER JOIN autores 
USING(autor_id);

-- LEFT JOIN

SELECT 
    CONCAT (nombre, "  ", apellido) AS nombre,
    libros_usuarios.libro_id
FROM usuarios
LEFT JOIN libros_usuarios 
ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.libro_id IS NOT NULL;

-- RIGHT JOIN

SELECT 
    CONCAT (nombre, "  ", apellido) AS nombre,
    libros_usuarios.libro_id
FROM libros_usuarios
RIGHT JOIN usuarios
ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.libro_id IS NULL;

-- MULTIPLE JOINS

SELECT DISTINCT
    CONCAT (usuarios.nombre, " ", usuarios.apellido) AS nombre_usuario
FROM usuarios
INNER JOIN libros_usuarios 
    ON usuarios.usuario_id = libros_usuarios.usuario_id 
        AND DATE(libros_usuarios.fecha_creacion) = CURDATE()
INNER JOIN libros 
    ON libros_usuarios.libro_id = libros.libro_id
INNER JOIN autores
    ON libros.autor_id = autores.autor_id
        AND autores.pseudonimo IS NOT NULL;

-- CROS JOIN

SELECT usuarios.username, libros.titulo 
    FROM usuarios 
CROSS JOIN libros;