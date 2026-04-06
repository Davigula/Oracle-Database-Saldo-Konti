-- Race condition (2 usera, isti stock)

-- stock -> 1

--korisnik A
UPDATE products
SET stock = stock - 1
WHERE product_id = 1;

--korisnik B
UPDATE products
SET stock = stock - 1
WHERE product_id = 1;

SELECT stock
FROM products
WHERE product_id = 1
FOR UPDATE;