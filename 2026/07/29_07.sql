-- SQL — dohvat podataka

-- Prošli smo:

-- INNER JOIN i LEFT JOIN
-- EXISTS
-- COUNT, SUM i agregacije
-- GROUP BY
-- duplicate rows
-- LEFT JOIN + WHERE zamke
-- spajanje više tablica
-- indekse i osnove performansi
-- refaktoriranje sporijih upita

SELECT c.full_name,
       COUNT(o.order_id) AS broj_narudzbi
FROM customers c
LEFT JOIN orders o
    ON o.customer_id = c.customer_id
GROUP BY c.full_name;