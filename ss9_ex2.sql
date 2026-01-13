USE session_09;
-- EX2:
-- Hãy tạo một View có tên view_customer_contact chỉ chứa các thông tin: customer_id, customer_name, email, và phone.
CREATE VIEW vw_customer_contact
AS
    SELECT customer_id,customer_name,email,phone
    FROM customers;
-- truy vấn view
SELECT * FROM vw_customer_contact;