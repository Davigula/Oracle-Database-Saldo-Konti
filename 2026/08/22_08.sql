

DECLARE
    l_sql       VARCHAR2(1000);
    l_order_id  NUMBER       := 500324;
    l_status    VARCHAR2(20) := 'SHIPPED';
BEGIN

    l_sql :=
        'UPDATE orders
         SET order_status = :status
         WHERE order_id = :order_id';

    EXECUTE IMMEDIATE l_sql
        USING l_status,
              l_order_id;

END;
/