CREATE OR REPLACE FUNCTION get_customer_name (
    p_customer_id NUMBER
)
RETURN VARCHAR2
IS
    l_name customers.full_name%TYPE;
BEGIN

    IF p_customer_id IS NULL THEN
        RETURN NULL;
    END IF;


    SELECT full_name
      INTO l_name
      FROM customers
     WHERE customer_id = p_customer_id;


    RETURN l_name;

END;
/