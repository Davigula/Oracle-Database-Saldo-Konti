SELECT constraint_name,
       search_condition
FROM user_constraints
WHERE table_name = 'ORDERS'
  AND constraint_type = 'C';


ALTER TABLE orders
DROP CONSTRAINT orders_status_ck;

ALTER TABLE orders
ADD CONSTRAINT orders_status_ck
CHECK (
    order_status IN (
        'NEW',
        'PAID',
        'CANCELLED',
        'SHIPPED'
    )
);