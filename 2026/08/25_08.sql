CREATE OR REPLACE PACKAGE order_pkg AS

    PROCEDURE update_order_status (
        p_order_id NUMBER,
        p_status   VARCHAR2
    );

    PROCEDURE update_order_status (
    p_order_id  NUMBER,
    p_status    VARCHAR2,
    p_changed_by VARCHAR2
);

END order_pkg;
/

CREATE OR REPLACE PACKAGE BODY order_pkg AS

PROCEDURE update_order_status (
    p_order_id NUMBER,
    p_status   VARCHAR2
)
IS
BEGIN

    UPDATE orders
       SET order_status = p_status
     WHERE order_id = p_order_id;

END;
END order_pkg;
/

BEGIN
    order_pkg.update_order_status(
        500,
        'SHIPPED'
    );
END;
/

select * from orders where order_id =500;