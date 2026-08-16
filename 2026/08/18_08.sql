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

#NOTFOUND
LOOP

    FETCH c_orders INTO l_order;

    EXIT WHEN c_orders%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(l_order.order_id);

END LOOP;

#ROWCOUNT
LOOP

    FETCH c_orders INTO l_order;

    EXIT WHEN c_orders%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(
        'Redak broj: ' || c_orders%ROWCOUNT
    );

END LOOP;

#ISOPEN
BEGIN
    OPEN c_orders;

    IF c_orders%ISOPEN THEN
    DBMS_OUTPUT.PUT_LINE('Cursor je otvoren.');
    END IF;
    
    CLOSE c_orders;

END;
/