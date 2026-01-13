USE session_09;
-- EX4:
-- tạo một Stored Procedure có tên insert_customer với các tham số sau : in_customer_name , in_email , in_phone , in_address.
DELIMITER //
    CREATE PROCEDURE p_insert_customer(
        in_customer_name VARCHAR(50),
        in_email VARCHAR(100),
        in_phone VARCHAR(15),
        in_address VARCHAR(255)
    )
    BEGIN
        INSERT INTO customers(customer_name,email,phone,address)
        VALUES (in_customer_name,in_email,in_phone,in_address);
        SELECT 'Thêm mới khách hàng thành công' AS message;
    END //
DELIMITER ;
-- truy vấn thủ tục, thêm 1 khách hàng mới vào bảng customers
CALL p_insert_customer('Nguyễn Hoàng Tú','tnh@gmail.com','090000000','HY');
SELECT * FROM customers;
