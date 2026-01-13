USE session_09;
-- EX5:
-- TẠo bảng orders và thêm 20 dữ liệu
CREATE TABLE orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    quantity INT NOT NULL CHECK ( quantity > 0 ),
    total_amount DECIMAL(5,2) NOT NULL CHECK ( total_amount > 0 ),
    status ENUM('Pending','Success','Cancel') DEFAULT 'Pending'
);
INSERT INTO orders(customer_id, product_id, quantity, total_amount,status)
VALUES (1, 1, 1, 899.99, 'Success'),
       (2, 2, 2, 799.50, 'Pending'),
       (3, 3, 1, 749.00, 'Success'),
       (4, 4, 1, 999.99, 'Pending'),
       (5, 5, 3, 46.50, 'Success'),
       (6, 6, 2, 36.00, 'Success'),
       (7, 7, 1, 189.99, 'Pending'),
       (8, 8, 1, 259.50, 'Cancel'),
       (9, 9, 1, 299.99, 'Success'),
       (10, 10, 2, 119.98, 'Pending'),

       (1, 11, 1, 129.99, 'Success'),
       (2, 12, 1, 89.50, 'Success'),
       (3, 13, 5, 64.95, 'Pending'),
       (4, 14, 3, 73.50, 'Success'),
       (5, 15, 1, 69.99, 'Cancel'),
       (6, 16, 1, 99.99, 'Success'),
       (7, 17, 2, 239.00, 'Pending'),
       (8, 18, 1, 49.99, 'Success'),
       (9, 19, 1, 179.99, 'Pending'),
       (10, 20, 1, 109.50, 'Success');
-- Tạo view hiển thị thông tin khách hàng và tổng số tiền họ đã chi
CREATE VIEW vw_customer_spending
AS
    SELECT c.customer_id,
           c.customer_name,
           COUNT(o.order_id) AS 'total_orders',
           SUM(o.total_amount) AS 'total_spent'
    FROM customers c JOIN orders o on c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name ;
-- truy vấn view
SELECT * FROM vw_customer_spending;