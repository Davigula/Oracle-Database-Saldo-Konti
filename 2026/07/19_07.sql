--iako funkcija unutar selecta zvuči odlično, ponekad nije najoptimalnije, pa za puno obrade malo rezultata. Kada funkcija u selectu ima smisla? Upit vraća malo redaka, logika se ne može izvršiti s SQL-om
-- funkcija ne izvršava dodatne upite, čitljivost važnija od brzine

CREATE OR REPLACE FUNCTION get_order_total (
    p_order_id NUMBER
)
RETURN NUMBER
IS
    l_total NUMBER;
BEGIN
    SELECT SUM(oi.quantity * oi.unit_price)
      INTO l_total
      FROM order_items oi
     WHERE oi.order_id = p_order_id;

    RETURN NVL(l_total, 0);
END;
/

SELECT order_id,
       get_order_total(order_id) AS order_total
FROM orders;

SELECT o.order_id,
       NVL(
           SUM(oi.quantity * oi.unit_price),
           0
       ) AS order_total
FROM orders o
LEFT JOIN order_items oi
  ON oi.order_id = o.order_id
GROUP BY o.order_id;