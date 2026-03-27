show databases;

use sql_store;

use sql_invoicing;

use sql_inventory;

use sql_hr;

SELECT c.name AS client_name,
       COUNT(i.invoice_id) AS invoice_count,
       ROUND(SUM(i.invoice_total), 2) AS total_billed,
       ROUND(SUM(i.payment_total), 2) AS total_paid,
       ROUND(SUM(i.invoice_total - i.payment_total), 2) AS outstanding,
       ROUND(SUM(i.payment_total)/SUM(i.invoice_total)*100, 1) AS pct_paid
FROM clients c
LEFT JOIN invoices i ON c.client_id = i.client_id
GROUP BY c.client_id, c.name
ORDER BY outstanding DESC;

SELECT customer_id, first_name, last_name, product_name, total_spend, rnk
FROM (
  SELECT c.customer_id, c.first_name, c.last_name,
         p.name AS product_name,
         SUM(oi.quantity * oi.unit_price) AS total_spend,
         RANK() OVER (PARTITION BY c.customer_id
                      ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS rnk
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  GROUP BY c.customer_id, c.first_name, c.last_name, p.product_id, p.name
) ranked
WHERE rnk <= 3
ORDER BY customer_id, rnk;

SELECT e.employee_id,
       CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
       e.job_title,
       e.salary,
       CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM employees e
LEFT JOIN employees m ON e.reports_to = m.employee_id
ORDER BY manager_name, e.last_name;

SELECT s.name AS shipper_name,
       COUNT(DISTINCT o.order_id) AS shipments_handled,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue_shipped
FROM shippers s
JOIN orders o ON s.shipper_id = o.shipper_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY s.shipper_id, s.name
ORDER BY total_revenue_shipped DESC;

SELECT c.name AS client_name, c.phone,
       i.invoice_id,
       i.invoice_total,
       i.payment_total,
       ROUND(i.invoice_total - i.payment_total, 2) AS remaining
FROM clients c
JOIN invoices i ON c.client_id = i.client_id
WHERE i.payment_total > 0
  AND i.payment_total < i.invoice_total
ORDER BY remaining DESC;