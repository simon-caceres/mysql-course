SELECT 
    libros.titulo ,
    CONCAT(autores.nombre , " ", autores.apellido) AS autor,
    libros.fecha_creacion
FROM libros 
INNER JOIN autores 
ON libros.autor_id = autores.autor_id;