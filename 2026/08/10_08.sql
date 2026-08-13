DECLARE

    CURSOR c_expensive_orders IS
        SELECT o.order_id,
               c.full_name,
               p.product_name,
               p.unit_price
        FROM orders o
        JOIN customers c
          ON c.customer_id = o.customer_id
        JOIN order_items oi
          ON oi.order_id = o.order_id
        JOIN products p
          ON p.product_id = oi.product_id
        WHERE p.unit_price > 100;

    l_order c_expensive_orders%ROWTYPE;

BEGIN

    OPEN c_expensive_orders;

    LOOP

        FETCH c_expensive_orders
        INTO l_order;

        EXIT WHEN c_expensive_orders%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Narudžba: ' || l_order.order_id ||
            ' | Kupac: ' || l_order.full_name ||
            ' | Proizvod: ' || l_order.product_name ||
            ' | Cijena: ' || l_order.unit_price
        );

    END LOOP;

    CLOSE c_expensive_orders;

END;
/