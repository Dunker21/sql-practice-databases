show databases;

use sql_store;

use sql_invoicing;

use sql_inventory;

use sql_hr;


SELECT c.name AS client_name,
       COUNT(i.invoice_id) AS total_invoices,
       SUM(i.invoice_total) AS total_billed,
       SUM(i.payment_total) AS total_paid
FROM clients c
JOIN invoices i ON c.client_id = i.client_id
GROUP BY c.client_id, c.name
ORDER BY total_billed DESC;


SELECT c.first_name, c.last_name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) > 1
ORDER BY order_count DESC;

SELECT o.order_id, o.order_date,
       SUM(oi.quantity * oi.unit_price) AS order_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_date
ORDER BY order_revenue DESC;

SELECT invoice_id, client_id, invoice_total, payment_total,
       (invoice_total - payment_total) AS outstanding_balance,
       due_date
FROM invoices
WHERE (invoice_total - payment_total) > 0
ORDER BY outstanding_balance DESC;

SELECT o.city, COUNT(e.employee_id) AS employee_count
FROM offices o
JOIN employees e ON o.office_id = e.office_id
GROUP BY o.city
ORDER BY employee_count DESC;

SELECT ROUND(AVG(order_revenue), 2) AS avg_order_value
FROM (
  SELECT order_id, SUM(quantity * unit_price) AS order_revenue
  FROM order_items
  GROUP BY order_id
) AS order_totals;

SELECT pm.name AS payment_method,
       COUNT(p.payment_id) AS transaction_count,
       SUM(p.amount) AS total_collected
FROM payments p
JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY pm.payment_method_id, pm.name
ORDER BY total_collected DESC;

SELECT c.first_name, c.last_name, o.order_id, o.order_date, o.status
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 2
ORDER BY c.last_name, o.order_date;

SELECT office_id,
       ROUND(AVG(salary), 2) AS avg_salary,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary,
       COUNT(*) AS headcount
FROM employees
GROUP BY office_id
ORDER BY avg_salary DESC;

SELECT c.name AS client_name, c.phone,
       i.invoice_id, i.invoice_total, i.due_date
FROM clients c
JOIN invoices i ON c.client_id = i.client_id
WHERE i.payment_date IS NULL
  AND i.due_date < CURDATE()
ORDER BY i.due_date ASC;