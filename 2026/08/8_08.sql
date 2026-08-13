--  CURSOR
DECLARE

    l_order orders%ROWTYPE;

BEGIN

    SELECT *
    INTO l_order
    FROM orders
    WHERE order_id = 100;

    DBMS_OUTPUT.PUT_LINE(
        l_order.order_status
    );

END;
/

DECLARE

    l_order_id       david_orders.order_id%TYPE;
    l_customer_id    david_orders.customer_id%TYPE;
    l_order_date     david_orders.order_date%TYPE;
    l_order_status   david_orders.order_status%TYPE;

BEGIN

    SELECT order_id,
           customer_id,
           order_date,
           order_status
    INTO   l_order_id,
           l_customer_id,
           l_order_date,
           l_order_status
    FROM david_orders
    WHERE order_id = 100;

END;
/