USE universidade;

DELIMITER $$

CREATE PROCEDURE sp_manage_students (
    IN p_option INT,
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_course VARCHAR(100)
)
BEGIN
    CASE p_option
        WHEN 1 THEN -- INSERT
            INSERT INTO students (id, name, course) VALUES (p_id, p_name, p_course);
        WHEN 2 THEN -- UPDATE
            UPDATE students SET name = p_name, course = p_course WHERE id = p_id;
        WHEN 3 THEN -- DELETE
            DELETE FROM students WHERE id = p_id;
        WHEN 4 THEN -- SELECT
            SELECT * FROM students WHERE id = p_id;
    END CASE;
END$$

DELIMITER ;

-- Chamada de exemplo:
CALL sp_manage_students(1, 101, 'Carlos Silva', 'Engenharia');
