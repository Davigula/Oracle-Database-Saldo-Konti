CREATE OR REPLACE PROCEDURE archive_old_orders
IS

    CURSOR c_orders IS
        SELECT order_id
        FROM david_order
        WHERE status = 'COMPLETED'
        AND order_date < SYSDATE - 30;

    v_order_id david_order.order_id%TYPE;

BEGIN

    OPEN c_orders;

    LOOP

        FETCH c_orders INTO v_order_id;

        EXIT WHEN c_orders%NOTFOUND;

        UPDATE david_order
        SET status = 'ARCHIVED'
        WHERE order_id = v_order_id;

        DBMS_OUTPUT.PUT_LINE('Archived order: ' || v_order_id);

    END LOOP;

    CLOSE c_orders;

    COMMIT;

END;
/