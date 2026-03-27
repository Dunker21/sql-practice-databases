show databases;

use sql_store;

use sql_invoicing;

use sql_inventory;

use sql_hr;


SELECT first_name, last_name, city , phone
FROM customers
WHERE state = 'TX';


select product_id, name, quantity_in_stock, unit_price
from products
where quantity_in_stock<20
order by quantity_in_stock asc;



select invoice_id, client_id, invoice_total, due_date 
from invoices
where payment_date is null
order by due_date asc;

SELECT order_id, customer_id, order_date, status
FROM orders
WHERE YEAR(order_date) = 2019
ORDER BY order_date;

SELECT client_id, name, city, state, phone
FROM clients
WHERE state IN ('CA', 'OR');

SELECT product_id, name, unit_price, quantity_in_stock
FROM products
ORDER BY unit_price DESC;

SELECT order_id, customer_id, order_date, shipped_date, shipper_id
FROM orders
WHERE status = 2
ORDER BY shipped_date;

SELECT first_name, last_name, job_title, salary
FROM employees
WHERE salary > 90000
ORDER BY salary DESC;

SELECT payment_id, client_id, invoice_id, date, amount
FROM payments
WHERE payment_method = 1
ORDER BY date;

SELECT office_id, address, city, state
FROM offices
WHERE state = 'OH';