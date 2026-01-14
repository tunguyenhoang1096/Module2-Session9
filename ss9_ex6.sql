USE session_09;
-- EX6:
-- Tạo Stored Procedure có tham số đầu vào cus_id, pro_id, quantity và tham số đâu ra message thông báo
DELIMITER //
    CREATE PROCEDURE p_add_order(in_customer_id INT,in_product_id INT,in_quantity INT, OUT o_message VARCHAR(100))
    BEGIN
        DECLARE current_stock INT;
        DECLARE current_price DECIMAL(5,2);
        DECLARE new_total_amount DECIMAL(10,2);
        -- Lấy số lượng tồn kho
        SELECT stock,price INTO current_stock, current_price
        FROM products
        WHERE product_id = in_product_id;
        -- Kiểm tra số lượng mua với số lượng tồn kho
        IF in_quantity <= 0 THEN
            SET o_message = 'Số lượng đặt hàng k hợp lệ';
        ELSEIF current_stock = 0 THEN
            SET o_message = 'Sản phẩm đã hết, không thể đặt hàng';
        ELSEIF current_stock < in_quantity THEN
            SET o_message = 'Không đủ số lượng để đặt hàng';
        ELSE
            -- Thêm mới đơn hàng
            SET new_total_amount = current_price * in_quantity;
            INSERT INTO orders(customer_id, product_id, quantity,total_amount)
            VALUES (in_customer_id,in_product_id,in_quantity,new_total_amount);
            -- update số lượng tồn kho
            UPDATE products
            SET stock = stock - in_quantity
            WHERE product_id = in_product_id;
            SET o_message = 'Thêm mới đơn hàng thành công';
        end if;
    END //
DELIMITER ;
DROP PROCEDURE p_add_order;
-- Gọi Stored Procedure để kiểm tra
-- thêm mới order thành công
CALL p_add_order(1, 1, 2, @msg);
-- số lượng mua hàng k hợp lệ
CALL p_add_order(1, 4, 0, @msg);
-- số lượng tồn kho k đủ
CALL p_add_order(1, 4, 20, @msg);
SELECT @msg AS result_message;
SHOW CREATE TABLE products;
