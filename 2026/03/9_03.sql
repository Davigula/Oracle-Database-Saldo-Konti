CREATE OR REPLACE PROCEDURE cancel_order(p_order_id NUMBER)
IS
BEGIN

    UPDATE orders
    SET ORDER_status = 'CANCELLED'
    WHERE order_id = p_order_id;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20022, 'nO ORDER FOUND');
        
END;
/

BEGIN 
    CANCEL_ORDER(700);
END;