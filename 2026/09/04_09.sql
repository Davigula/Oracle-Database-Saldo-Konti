CREATE OR REPLACE PACKAGE order_pkg AS

    PROCEDURE cancel_order (
        p_order_id IN orders.order_id%TYPE
    );

    PROCEDURE cancel_order (
        p_order_id IN orders.order_id%TYPE,
        p_reason   IN VARCHAR2
    );

END order_pkg;
/

CREATE OR REPLACE PACKAGE BODY order_pkg AS

    PROCEDURE cancel_order (
        p_order_id IN orders.order_id%TYPE,
        p_reason   IN VARCHAR2
    )
    IS
    BEGIN

        UPDATE orders
           SET order_status = 'CANCELLED'
         WHERE order_id = p_order_id;

        DBMS_OUTPUT.PUT_LINE(
            'Order: ' || p_order_id ||
            ' cancelled. Reason: ' || p_reason
        );

    END cancel_order;


    PROCEDURE cancel_order (
        p_order_id IN orders.order_id%TYPE
    )
    IS
    BEGIN

        UPDATE orders
           SET order_status = 'CANCELLED'
         WHERE order_id = p_order_id;

        DBMS_OUTPUT.PUT_LINE(
            'Order: ' || p_order_id             
        );

    END cancel_order;

END order_pkg;
/

BEGIN

    order_pkg.cancel_order(
        p_order_id => 500011
    );

END;
/
