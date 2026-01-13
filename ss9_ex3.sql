USE session_09;
-- EX3:
-- Tạo bảng products và thêm dữ liệu
CREATE TABLE products(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL ,
    price DECIMAL(5,2) NOT NULL CHECK ( price > 0 ),
    stock INT NOT NULL CHECK ( stock > 0 )
);
INSERT INTO products(product_name, price, stock)
VALUES  ('Laptop Dell Inspiron', 899.99, 15),
        ('Laptop HP Pavilion', 799.50, 20),
        ('Laptop Asus VivoBook', 749.00, 18),
        ('MacBook Air M1', 999.99, 10),
        ('Chuột Logitech M185', 15.50, 100),
        ('Bàn phím Logitech K120', 18.00, 80),
        ('Màn hình Samsung 24inch', 189.99, 25),
        ('Màn hình LG 27inch', 259.50, 12),
        ('Tai nghe Sony WH-1000XM4', 299.99, 8),
        ('Tai nghe JBL Tune 510BT', 59.99, 40),
        ('Ổ cứng SSD Samsung 1TB', 129.99, 30),
        ('Ổ cứng HDD WD 2TB', 89.50, 22),
        ('USB Kingston 64GB', 12.99, 150),
        ('USB Sandisk 128GB', 24.50, 90),
        ('Router TP-Link Archer C6', 69.99, 35),
        ('Webcam Logitech C920', 99.99, 14),
        ('Loa Bluetooth JBL Flip 5', 119.50, 27),
        ('Pin sạc dự phòng Anker 20000mAh', 49.99, 45),
        ('Máy in Canon LBP2900', 179.99, 9),
        ('Máy scan Epson V39', 109.50, 11);
SELECT * FROM products;
-- tạo một Stored Procedure có tên get_high_value_products để lấy về danh sách tất cả các sản phẩm có giá lớn hơn 100 USD
DELIMITER //
    CREATE PROCEDURE p_get_high_value_products()
    BEGIN
       SELECT * FROM products WHERE price > 100;
    END //
DELIMITER ;
-- Truy vấn thủ tục
CALl p_get_high_value_products();