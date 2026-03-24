SELECT c.full_name, o.order_id
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id;

CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

select * from index
SELECT index_name
FROM user_indexes
WHERE table_name = 'ORDERS';

drop index ORDERS_CUSTOMER_ID_I