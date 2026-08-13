--Hardcoding znači da neku vrijednost direktno upišemo u kod.

CREATE OR REPLACE PROCEDURE check_order_priority (
    p_order_id NUMBER,
    p_total    NUMBER
)
IS
    c_priority_limit CONSTANT NUMBER := 500;
BEGIN

    IF p_total >= c_priority_limit THEN

        UPDATE orders
           SET order_status = 'PRIORITY'
         WHERE order_id = p_order_id;

    END IF;

END;
/

IF l_count = 0 THEN
l_quantity := l_quantity + 1;