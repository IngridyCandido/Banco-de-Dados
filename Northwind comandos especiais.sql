select * from customers;

SELECT c.company_name, o.order_id
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

SELECT 
    c.company_name,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_vendas
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.company_name
ORDER BY total_vendas DESC;

SELECT 
    p.product_name,
    SUM(od.quantity) AS total_vendido
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_vendido DESC
LIMIT 1;

SELECT 
    e.first_name,
    e.last_name,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_vendas
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY e.first_name, e.last_name
ORDER BY total_vendas DESC
LIMIT 1;

SELECT 
    DATE_TRUNC('month', o.order_date) AS mes,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_vendas
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY mes
ORDER BY mes;

SELECT * 
FROM customers
WHERE country = 'Brazil';

SELECT * 
FROM orders
WHERE order_date BETWEEN '1997-01-01' AND '1997-12-31';

SELECT * 
FROM customers
WHERE country = 'Brazil' AND city = 'São Paulo';

SELECT * 
FROM products
WHERE NOT unit_price > 50;

SELECT * 
FROM customers
WHERE region IS NULL;

SELECT 
    c.company_name,
    o.order_id
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.country = 'Brazil'
AND o.order_date BETWEEN '1997-01-01' AND '1997-12-31';

SELECT * 
FROM products
where unit_price between '30' and '50';

SELECT * 
FROM customers
where contact_name like 'Maria%';