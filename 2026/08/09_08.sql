DECLARE

    CURSOR c_orders IS
        SELECT o.order_id,
               o.order_status,
               c.full_name
        FROM orders o
        JOIN customers c
          ON o.customer_id = c.customer_id
        ORDER BY o.order_id;

    l_order c_orders%ROWTYPE;

BEGIN

    OPEN c_orders;

    LOOP

        FETCH c_orders INTO l_order;

        EXIT WHEN c_orders%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Order ID: ' || l_order.order_id ||
            ', Customer: ' || l_order.full_name ||
            ', Status: ' || l_order.order_status
        );

    END LOOP;

    CLOSE c_orders;

END;
/