CREATE DATABASE session_09;
USE session_09;
-- EX1: Tối ưu hóa tốc độ tìm kiếm khách hàng (Index)
-- Tạo bảng customers và thêm dữ liệu
CREATE TABLE customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL ,
    phone VARCHAR(15) NOT NULL ,
    address VARCHAR(255) NOT NULL
);
INSERT INTO customers(customer_name, email, phone, address)
VALUES ('Nguyễn Văn An', 'an.nguyen@gmail.com', '0912345678', 'Hà Nội'),
       ('Trần Thị Bình', 'binh.tran@gmail.com', '0987654321', 'TP Hồ Chí Minh'),
       ('Lê Văn Cường', 'cuong.le@gmail.com', '0903456789', 'Đà Nẵng'),
       ('Phạm Thị Dung', 'dung.pham@gmail.com', '0934567890', 'Hải Phòng'),
       ('Hoàng Văn Em', 'em.hoang@gmail.com', '0945678901', 'Cần Thơ'),
       ('Vũ Thị Hoa', 'hoa.vu@gmail.com', '0967890123', 'Nghệ An'),
       ('Đặng Văn Hùng', 'hung.dang@gmail.com', '0978901234', 'Thanh Hóa'),
       ('Bùi Thị Lan', 'lan.bui@gmail.com', '0923456789', 'Bắc Ninh'),
       ('Đỗ Văn Minh', 'minh.do@gmail.com', '0956789012', 'Quảng Ninh'),
       ('Phan Thị Ngọc', 'ngoc.phan@gmail.com', '0991234567', 'Bình Dương');
SHOW INDEXES FROM customers;
-- Tạo một Unique Index cho cột email (vì email không được trùng).
CREATE UNIQUE INDEX idx_email ON customers(email);
-- Tạo một Index thường (Non-Unique) cho cột phone
CREATE INDEX idx_phone ON customers(phone);
EXPLAIN SELECT * FROM customers WHERE email='em.hoang@gmail.com';
EXPLAIN SELECT * FROM customers WHERE phone='0991234567';
