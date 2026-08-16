SELECT CASE
         WHEN EXISTS (
             SELECT 1
             FROM orders
             WHERE customer_id = 10
         )
         THEN 'TRUE'
         ELSE 'FALSE'
       END AS postoji
FROM dual;