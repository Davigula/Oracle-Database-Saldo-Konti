CREATE OR REPLACE PROCEDURE process_order (
    p_order_id   NUMBER,
    p_store_id   NUMBER,
    p_validate   BOOLEAN,
    p_send_email BOOLEAN
)
IS
BEGIN

    DBMS_OUTPUT.PUT_LINE(
        'Order: ' || p_order_id
    );

    IF p_validate THEN
        DBMS_OUTPUT.PUT_LINE('Validacija uključena');
    END IF;

    IF p_send_email THEN
        DBMS_OUTPUT.PUT_LINE('Email će biti poslan');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Email se neće poslati');
    END IF;

END;
/


BEGIN

    process_order(
        500011,
        10,
        TRUE,
        FALSE
    );

END;
/

BEGIN

    process_order(
        p_order_id   => 500011,
        p_store_id   => 10,
        p_validate   => TRUE,
        p_send_email => FALSE
    );

END;
/