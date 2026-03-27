-- Sažetak + 3 najčešće greške

SELECT *
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id;

--1
SELECT c.full_name
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
WHERE o.order_status = 'COMPLETE';

SELECT c.full_name
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
 AND o.order_status = 'COMPLETE';

--2
SELECT c.full_name, COUNT(*)
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.full_name;

SELECT c.full_name, COUNT(o.order_id)
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
WHERE FULL_NAME LIKE '%Test%'
GROUP BY c.full_name;

--3
SELECT count(o.order_id)
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON oi.order_id = o.order_id

SELECT COUNT(DISTINCT o.order_id)
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON oi.order_id = o.order_id
