DECLARE
    l_sql VARCHAR2(1000);
BEGIN

    l_sql := 'UPDATE orders
              SET order_status = ''SHIPPED''
              WHERE order_id = 500324';

    EXECUTE IMMEDIATE l_sql;

END;
/

DECLARE
    l_table_name VARCHAR2(30) := 'ORDERS';
    l_sql        VARCHAR2(1000);
BEGIN

    l_sql := 'DELETE FROM ' || l_table_name ||
             ' WHERE order_status = ''CANCELLED''';

    EXECUTE IMMEDIATE l_sql;

END;
/

DECLARE
    l_table_name VARCHAR2(30) := 'ORDERS';
    l_sql        VARCHAR2(1000);
    l_order_id  number:= 500324;
BEGIN

    l_sql :=
    'UPDATE orders
     SET order_status = ''SHIPPED''
     WHERE order_id = ' || l_order_id;

    EXECUTE IMMEDIATE l_sql;

END;
/

DECLARE
    l_sql      VARCHAR2(1000);
    l_order_id NUMBER := 500324;
BEGIN

    l_sql :=
        'UPDATE orders
         SET order_status = ''SHIPPED''
         WHERE order_id = :order_id';

    EXECUTE IMMEDIATE l_sql
        USING l_order_id;

END;
/

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