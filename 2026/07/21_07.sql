-- Refaktoriranje sporog upita part 2.

--Refaktoriranje SQL upita radimo kako bi kod bio čitljiviji, lakši za održavanje i, kada je potrebno, učinkovitiji. Kada dohvaćamo povezane podatke iz više tablica, često je bolje koristiti JOIN nego izvršavati dodatne upite za svaki pojedini red.

CREATE OR REPLACE FUNCTION get_customer_name (
    p_customer_id NUMBER
)
RETURN VARCHAR2
IS
    l_full_name customers.full_name%TYPE;
BEGIN
    SELECT full_name
      INTO l_full_name
      FROM customers
     WHERE customer_id = p_customer_id;

    RETURN l_full_name;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Nepoznati kupac';
END;



SELECT order_id,
       get_customer_name(customer_id)
FROM orders;

SELECT o.order_id,
       c.full_name
FROM orders o
JOIN customers c
  ON c.customer_id = o.customer_id;

  SELECT o.order_id,
       (
           SELECT COUNT(*)
           FROM order_items oi
           WHERE oi.order_id = o.order_id
       ) AS item_count
FROM orders o;

SELECT o.order_id,
       COUNT(oi.line_item_id) AS item_count
FROM orders o
LEFT JOIN order_items oi
       ON oi.order_id = o.order_id
GROUP BY o.order_id;
