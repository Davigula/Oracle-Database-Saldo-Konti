SELECT c.full_name, COUNT(*)
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
where c.full_name = 'Test Kupac Bez Narudzbe'
GROUP BY c.full_name;

SELECT c.full_name
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;