
-- DELIMITER //

-- CREATE FUNCTION set_days(fecha DATE, dias INT)
-- RETURNS DATE 
-- READS SQL DATA
-- DETERMINISTIC
-- BEGIN
--     RETURN fecha + INTERVAL dias DAY;
-- END//

-- DELIMITER ;

DELIMITER //

CREATE FUNCTION obtener_paginas()
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    SET @paginas = (SELECT (ROUND( RAND() * 100) * 4));
    RETURN @PAGINAS;
END //

CREATE FUNCTION obtener_VENTAS()
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    SET @paginas = (SELECT (ROUND( RAND() * 100) * 8));
    RETURN @PAGINAS;
END //

DELIMITER ;

UPDATE libros SET paginas = obtener_paginas();

UPDATE libros SET ventas = obtener_ventas();
