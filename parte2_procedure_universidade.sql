USE universidade;

DELIMITER $$

CREATE PROCEDURE sp_manage_students (
    IN p_option INT,
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_course VARCHAR(100)
)
BEGIN
    IF p_option = 1 THEN
        -- Inserção de novo estudante
        INSERT INTO students (id, name, course) VALUES (p_id, p_name, p_course);
    
    ELSEIF p_option = 2 THEN
        -- Atualização de estudante existente
        UPDATE students SET name = p_name, course = p_course WHERE id = p_id;
    
    ELSEIF p_option = 3 THEN
        -- Remoção de estudante
        DELETE FROM students WHERE id = p_id;
    
    ELSEIF p_option = 4 THEN
        -- Consulta de estudante
        SELECT * FROM students WHERE id = p_id;
    
    ELSE
        -- Opção inválida
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Opção inválida. Use 1 (INSERT), 2 (UPDATE), 3 (DELETE) ou 4 (SELECT).';
    END IF;
END$$

DELIMITER ;

-- Chamada de exemplo (INSERT):
CALL sp_manage_students(1, 101, 'Carlos Silva', 'Engenharia');
