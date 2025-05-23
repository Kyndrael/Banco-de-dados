USE ecommerce;

DELIMITER $$

CREATE PROCEDURE sp_manage_products (
    IN p_option INT,
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10, 2)
)
BEGIN
    CASE p_option
        WHEN 1 THEN
            INSERT INTO products (id, name, price) VALUES (p_id, p_name, p_price);
        WHEN 2 THEN
            UPDATE products SET name = p_name, price = p_price WHERE id = p_id;
        WHEN 3 THEN
            DELETE FROM products WHERE id = p_id;
        WHEN 4 THEN
            SELECT * FROM products WHERE id = p_id;
    END CASE;
END$$

DELIMITER ;

-- Chamada de exemplo:
CALL sp_manage_products(2, 205, 'Teclado Mecânico', 299.99);
