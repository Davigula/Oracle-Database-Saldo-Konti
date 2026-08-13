DECLARE
    l_order orders%ROWTYPE;
BEGIN

    SELECT *
    INTO l_order
    FROM orders
    WHERE order_id = 234;

    DBMS_OUTPUT.PUT_LINE(
        l_order.order_id || ' - ' ||
        l_order.order_status
    );

END;
/