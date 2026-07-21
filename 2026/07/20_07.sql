-- Refaktoriranje sporog upita

-- Refaktoriranje SQL upita radimo kako bi kod bio čitljiviji, lakši za održavanje i, kada je potrebno, učinkovitiji. Kada dohvaćamo povezane podatke iz više tablica, često je bolje koristiti JOIN nego izvršavati dodatne upite za svaki pojedini red. Međutim, JOIN nije automatski brži u svakoj situaciji – performanse ovise o količini podataka, indeksima i execution planu. Kod upita koji obrađuju vrlo mali broj redaka, optimizacija performansi često nije prioritet, ali refaktoriranje i dalje može imati smisla zbog kvalitete koda.

SELECT o.order_id,
       o.order_datetime,
       (
           SELECT c.full_name
           FROM customers c
           WHERE c.customer_id = o.customer_id
       ) AS customer_name
FROM orders o;

SELECT o.order_id,
       o.order_datetime,
       c.full_name
FROM orders o
JOIN customers c
  ON c.customer_id = o.customer_id;

