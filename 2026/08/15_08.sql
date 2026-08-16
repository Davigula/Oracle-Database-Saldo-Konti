
DECLARE
    l_count NUMBER;
BEGIN

    SELECT COUNT(*)
      INTO l_count
      FROM orders
     WHERE customer_id = 10;

    IF l_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Kupac ima narudžbe.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Kupac nema narudžbi.');
    END IF;

END;
/


DECLARE
    l_exists NUMBER;
BEGIN

    SELECT 1
      INTO l_exists
      FROM orders
     WHERE customer_id = 10;

END;
/



DECLARE
    l_exists NUMBER;
BEGIN

    SELECT 1
      INTO l_exists
      FROM orders
     WHERE customer_id = 10
       AND ROWNUM = 1;

    DBMS_OUTPUT.PUT_LINE('Kupac ima narudžbu.');

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Kupac nema narudžbi.');

END;
/

SELECT c.customer_id,
       c.full_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);