--Duplicate rows problem
SELECT c.full_name, o.order_id
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
where c.full_name  like '%everly%'
group by c.full_name;

SELECT DISTINCT c.full_name
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id;

SELECT c.full_name
FROM customers c
WHERE EXISTS (
  SELECT 1
  FROM orders o
  WHERE o.customer_id = c.customer_id
);
