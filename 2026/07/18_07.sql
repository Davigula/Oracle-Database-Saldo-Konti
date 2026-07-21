--funkcija unutar SELECT-a
CREATE OR REPLACE FUNCTION get_customer_name (
    p_customer_id NUMBER
)
RETURN VARCHAR2
IS
    l_full_name customers.full_name%TYPE;
BEGIN
    SELECT full_name
      INTO l_full_name
      FROM customers
     WHERE customer_id = p_customer_id;

    RETURN l_full_name;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Nepoznati kupac';
END;
/

SELECT order_id,
       order_datetime,
       get_customer_name(customer_id) AS customer_name
FROM orders;