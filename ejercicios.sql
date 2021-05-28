SELECT 
    autor_id, titulo 
FROM libros 
WHERE autor_id IN (
    SELECT 
        autor_id 
    FROM autores 
    WHERE pseudonimo IS NOT NULL
);

SELECT 
    autor_id, titulo
FROM libros
WHERE autor_id IN (
    SELECT 
        autor_id
    FROM autores
    WHERE pseudonimo IS NOT NULL 
    AND fecha_nacimiento < '1965-01-01'
);

UPDATE 
    libros 
SET descripcion = 'NO DISPONIBLE' 
WHERE fecha_publicacion < '2000-01-01';

SELECT 
    libro_id
FROM libros
WHERE descripcion != 'NO DISPONIBLE';

SELECT 
    titulo
FROM libros
WHERE autor_id = 2
ORDER BY fecha_publicacion DESC
LIMIT 0, 3;