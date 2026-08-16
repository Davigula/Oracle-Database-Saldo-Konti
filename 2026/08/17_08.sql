DECLARE

    CURSOR c_orders IS
        SELECT order_id,
               order_status
        FROM orders;

    l_order c_orders%ROWTYPE;

BEGIN

    OPEN c_orders;

    FETCH c_orders INTO l_order;

    IF c_orders%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Pronađena je narudžba.');
    END IF;

    CLOSE c_orders;

END;
/

