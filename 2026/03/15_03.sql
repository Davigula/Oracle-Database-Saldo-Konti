CREATE OR REPLACE PROCEDURE archive_old_orders
IS

    CURSOR c_orders IS
        SELECT order_id
        FROM orders
        WHERE order_status = 'COMPLETE'
        AND order_datetime < SYSDATE - 30;

    v_order_id david_order.order_id%TYPE;

BEGIN

    OPEN c_orders;

    LOOP

        FETCH c_orders INTO v_order_id;

        EXIT WHEN c_orders%NOTFOUND;

        UPDATE orders
        SET order_status = 'ARCHIVED'
        WHERE order_id = v_order_id;

        DBMS_OUTPUT.PUT_LINE('Archived order: ' || v_order_id);

    END LOOP;

    CLOSE c_orders;

    COMMIT;

END;
/

BEGIN 
    archive_old_orders;
END;

SELECT *
FROM user_constraints
WHERE table_name = 'ORDERS'
--AND constraint_type = 'C';

ALTER TABLE orders
DROP CONSTRAINT ORDER_STATUS_C;

ALTER TABLE orders
ADD CONSTRAINT ORDER_STATUS_C
CHECK (order_status IN ('NEW','PROCESSING','COMPLETE','CANCELLED','ARCHIVED'));