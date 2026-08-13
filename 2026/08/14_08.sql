DECLARE

    CURSOR c_old_orders IS
        SELECT order_id
        FROM orders
        WHERE order_status = 'OPEN'
          AND order_datetime < SYSDATE - 130;

BEGIN

    FOR l_order IN c_old_orders
    LOOP

        UPDATE orders
           SET order_status = 'CANCELLED'
         WHERE order_id = l_order.order_id;

    END LOOP;

END;


UPDATE orders
   SET order_status = 'CANCELLED'
 WHERE order_status = 'OPEN'
   AND order_datetime < SYSDATE - 30;