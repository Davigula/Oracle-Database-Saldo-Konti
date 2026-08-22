CREATE OR REPLACE PROCEDURE find_orders (
    p_status VARCHAR2
)
IS
    l_sql VARCHAR2(1000);
BEGIN

    l_sql :=
        'SELECT COUNT(*)
           FROM orders
          WHERE order_status = '''
        || p_status || '''';

    DBMS_OUTPUT.PUT_LINE(l_sql);

END;
/


BEGIN
    find_orders('SHIPPED');
END;
/


CREATE OR REPLACE PROCEDURE find_orders (
    p_status VARCHAR2
)
IS
    l_sql   VARCHAR2(1000);
    l_count NUMBER;
    l_table varchar2(30) := 'ORDERS';
BEGIN

    l_sql :=
        'SELECT COUNT(*)
           FROM :table
          WHERE order_status = :status';

    EXECUTE IMMEDIATE l_sql
        INTO l_count
        USING l_table, p_status;

    DBMS_OUTPUT.PUT_LINE(
        'Broj narudžbi: ' || l_count
    );

END;
/