
SELECT CONCAT(nombre, " ", apellido) 
AS autor_venta_promedio
FROM autores 
WHERE autor_id IN (
    SELECT
        autor_id
    FROM libros
    GROUP BY autor_id
    HAVING SUM(VENTAS) > (
        SELECT AVG(ventas) FROM libros
    )
);

SELECT IF(
    EXISTS(
        SELECT 
            libro_id 
        FROM libros 
        WHERE titulo = 'EL hobbit'
    ),
    'DISPONIBLE',
    'NO DISPONIBLE'
) AS mensaje;