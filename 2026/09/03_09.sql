CREATE OR REPLACE FUNCTION customer_has_orders (
    p_customer_id IN customers.customer_id%TYPE
)
RETURN BOOLEAN
IS
    l_count NUMBER;
BEGIN

    SELECT COUNT(*)
      INTO l_count
      FROM orders
     WHERE customer_id = p_customer_id;

    RETURN l_count > 0;

END;
/