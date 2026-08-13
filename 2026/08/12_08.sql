DECLARE

    CURSOR c_orders IS
        SELECT o.order_id,
               o.order_status,
               c.full_name
        FROM orders o
        JOIN customers c
          ON c.customer_id = o.customer_id;

    l_order_id     orders.order_id%TYPE;
    l_status       orders.order_status%TYPE;
    l_customer     customers.full_name%TYPE;

BEGIN

    OPEN c_orders;

    LOOP

        FETCH c_orders
        INTO l_order_id,
             l_status,
             l_customer;

        EXIT WHEN c_orders%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            l_order_id || ' - ' ||
            l_customer || ' - ' ||
            l_status
        );

    END LOOP;

    CLOSE c_orders;

END;
/

DECLARE

    CURSOR c_orders IS
        SELECT o.order_id,
               o.order_datetime,
               o.order_status,
               c.full_name
        FROM orders o
        JOIN customers c
          ON c.customer_id = o.customer_id;

    l_order c_orders%ROWTYPE;

BEGIN

    OPEN c_orders;

    LOOP

        FETCH c_orders INTO l_order;

        EXIT WHEN c_orders%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            l_order.order_id || ' - ' ||
            l_order.full_name || ' - ' ||
            l_order.order_status
        );

    END LOOP;

    CLOSE c_orders;

END;
/