USE ecommerce;

DELIMITER $$

CREATE PROCEDURE sp_manage_products (
    IN p_option INT,
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10, 2)
)
BEGIN
    IF p_option = 1 THEN
        INSERT INTO products (id, name, price) VALUES (p_id, p_name, p_price);
        
    ELSEIF p_option = 2 THEN
        UPDATE products SET name = p_name, price = p_price WHERE id = p_id;
        
    ELSEIF p_option = 3 THEN
        DELETE FROM products WHERE id = p_id;
        
    ELSEIF p_option = 4 THEN
        SELECT * FROM products WHERE id = p_id;
        
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Opção inválida. Use 1 (INSERT), 2 (UPDATE), 3 (DELETE) ou 4 (SELECT).';
    END IF;
END$$

DELIMITER ;

-- Chamada de exemplo (UPDATE):
CALL sp_manage_products(2, 205, 'Teclado Mecânico', 299.99);
