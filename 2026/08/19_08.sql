CREATE OR REPLACE PACKAGE david_order_pkg AS

    g_orders_processed NUMBER := 0;

    PROCEDURE process_order (
        p_order_id NUMBER
    );

END david_order_pkg;
/

CREATE OR REPLACE PACKAGE BODY david_order_pkg AS

    PROCEDURE process_order (
        p_order_id NUMBER
    )
    IS
    BEGIN

        DBMS_OUTPUT.PUT_LINE(
            'Obrađujem order: ' || p_order_id
        );

        g_orders_processed := g_orders_processed + 1;

    END process_order;

END david_order_pkg;
/

BEGIN
    david_order_pkg.process_order(500324);
    david_order_pkg.process_order(500325);
    david_order_pkg.process_order(500326);

    DBMS_OUTPUT.PUT_LINE(
        'Ukupno: ' ||
        david_order_pkg.g_orders_processed
    );
END;
/