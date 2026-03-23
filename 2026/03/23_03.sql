SELECT count(c.full_name) --, COUNT(oi.line_item_id) AS laptop_count
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
  ON o.order_id = oi.order_id
LEFT JOIN products p
  ON oi.product_id = p.product_id
WHERE p.product_name like '%oodie%'
--GROUP BY c.full_name;

SELECT count(c.full_name) --, COUNT(oi.line_item_id) AS laptop_count
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
  ON o.order_id = oi.order_id
LEFT JOIN products p
  ON oi.product_id = p.product_id
 AND p.product_name like '%oodie%'
-- GROUP BY c.full_name;