-- Isolation (osnovno objašnjenje)

-- stock -> 10

-- korisnik A 
UPDATE products
SET stock = stock - 2
WHERE product_id = 1; -- stock = 8

-- korisnik B
SELECT stock FROM products WHERE product_id = 1; -- stock = 10

COMMIT;