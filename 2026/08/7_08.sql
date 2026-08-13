BEGIN

    FOR l_order IN (
        SELECT order_id,
               customer_id,
               order_status
        FROM orders
        ORDER BY order_id
    )
    LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Narudžba: ' || l_order.order_id ||
            ', kupac: ' || l_order.customer_id ||
            ', status: ' || l_order.order_status
        );

    END LOOP;

END;
/


