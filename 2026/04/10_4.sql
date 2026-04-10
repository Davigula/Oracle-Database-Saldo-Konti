CREATE OR REPLACE FUNCTION get_order_total (p_order_id NUMBER)
RETURN NUMBER
IS
    v_total NUMBER := 0;
BEGIN
    SELECT SUM(oi.quantity * oi.unit_price)
    INTO v_total
    FROM order_items oi
    WHERE oi.order_id = p_order_id;

    RETURN v_total;
END;
/

SELECT get_order_total(1)
FROM dual;

CREATE OR REPLACE PROCEDURE mark_order_shipped (p_order_id NUMBER)
IS
BEGIN
    UPDATE orders
    SET order_status = 'COMPLETE'
    WHERE order_id = p_order_id;

    COMMIT;
END;
/

BEGIN
    mark_order_shipped(1);
END;
/

“Ako želim samo VIDJETI podatak — što koristim?”
👉 Function

“Ako želim PROMIJENITI podatak — što koristim?”