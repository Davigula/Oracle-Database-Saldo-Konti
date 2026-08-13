DECLARE

    CURSOR c_orders IS
        SELECT o.order_id,
               o.order_status,
               c.full_name
        FROM orders o
        JOIN customers c
          ON c.customer_id = o.customer_id
        WHERE o.order_status = 'SHIPPED';

    l_order c_orders%ROWTYPE;

BEGIN

    OPEN c_orders;

    LOOP

        FETCH c_orders INTO l_order;

        EXIT WHEN c_orders%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            l_order.order_id || ' - ' ||
            l_order.full_name
        );

    END LOOP;

    CLOSE c_orders;

END;
/



DECLARE

    CURSOR c_orders IS
        SELECT o.order_id,
               o.order_status,
               c.full_name
        FROM orders o
        JOIN customers c
          ON c.customer_id = o.customer_id
        WHERE o.order_status = 'SHIPPED';

BEGIN

    FOR l_order IN c_orders
    LOOP

        DBMS_OUTPUT.PUT_LINE(
            l_order.order_id || ' - ' ||
            l_order.full_name
        );

    END LOOP;

END;
/


BEGIN

    FOR l_order IN (
        SELECT o.order_id,
               o.order_status,
               c.full_name
        FROM orders o
        JOIN customers c
          ON c.customer_id = o.customer_id
        WHERE o.order_status = 'SHIPPED'
    )
    LOOP

        DBMS_OUTPUT.PUT_LINE(
            l_order.order_id || ' - ' ||
            l_order.full_name
        );

    END LOOP;

END;
/