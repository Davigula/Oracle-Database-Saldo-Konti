CREATE OR REPLACE FUNCTION get_order_total (p_order_id NUMBER)
RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT SUM(quantity * unit_price)
    INTO v_total
    FROM order_items
    WHERE order_id = p_order_id;

    RETURN v_total;
END;
/

SELECT 
    o.order_id,
    get_order_total(o.order_id) AS total
FROM orders o;

CREATE OR REPLACE FUNCTION bad_function (p_order_id NUMBER)
RETURN NUMBER
IS
BEGIN
    UPDATE orders
    SET order_status = 'PAID'
    WHERE order_id = p_order_id;

    RETURN 1;
END;
/

SELECT bad_function(order_id)
FROM orders;

CREATE OR REPLACE FUNCTION get_item_count (p_order_id NUMBER)
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM order_items
    WHERE order_id = p_order_id;

    RETURN v_count;
END;
/

SELECT 
    order_id,
    get_item_count(order_id) AS broj_stavki
FROM orders;

Pitaj ga:

“Što misliš — koliko puta će se function pozvati u ovom SELECT-u?”

👉 Točan odgovor:

“Za svaki red”