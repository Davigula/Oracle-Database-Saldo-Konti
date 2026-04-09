BEGIN
    INSERT INTO orders (order_id, customer_id)
    VALUES (10011, 1);

    INSERT INTO order_items (order_id, product_id)
    VALUES (10011, 10);

    RAISE_APPLICATION_ERROR(-20001, 'Greška'); -- 💥

    COMMIT;
END;

-- FK
INSERT INTO orders (order_id, customer_id)
VALUES (1001, 999); -- ❌ ne postoji

-- CHECK
INSERT INTO order_items (order_id, quantity)
VALUES (1001, -5); -- ❌ negativno

-- User A
UPDATE products SET stock = stock - 2 WHERE product_id = 1;

-- User B
SELECT stock FROM products WHERE product_id = 1; -- vidi staru vrijednost

COMMIT;

-- oba usera
UPDATE products SET stock = stock - 1 WHERE product_id = 1;

SELECT * FROM products
WHERE product_id = 1
FOR UPDATE;