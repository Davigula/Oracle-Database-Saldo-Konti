CREATE OR REPLACE PROCEDURE update_order_status (
    p_order_id NUMBER
)
IS
BEGIN

    UPDATE orders
       SET order_status = 'SHIPPED'
     WHERE order_id = p_order_id;

    COMMIT;

END;
/

BEGIN

    update_order_status(500324);

    UPDATE products
       SET stock_quantity = stock_quantity - 1
     WHERE product_id = 20;

END;
/

CREATE OR REPLACE PROCEDURE update_order_status (
    p_order_id NUMBER
)
IS
BEGIN

    UPDATE orders
       SET order_status = 'SHIPPED'
     WHERE order_id = p_order_id;

END;
/

BEGIN

    update_order_status(500324);

    UPDATE products
       SET stock_quantity = stock_quantity - 1
     WHERE product_id = 20;

    COMMIT;

EXCEPTION

    WHEN OTHERS THEN

        ROLLBACK;
        RAISE;

END;
/