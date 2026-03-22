-- LEFT JOIN na više tablica

SELECT c.full_name, o.order_id, oi.product_id
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
  ON o.order_id = oi.order_id;

SELECT c.full_name, COUNT(DISTINCT o.order_id)
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.full_name;

SELECT c.full_name,
       (SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.customer_id) AS broj_narudzbi,
       (SELECT COUNT(*)
        FROM orders o
        JOIN order_items oi ON o.order_id = oi.order_id
        WHERE o.customer_id = c.customer_id) AS broj_stavki
FROM customers c;