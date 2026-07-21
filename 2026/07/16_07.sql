select * from orders;

insert into orders (order_id, order_datetime, customer_id, order_status, store_id)
values (312, sysdate, 43, 'NEW', 1)

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