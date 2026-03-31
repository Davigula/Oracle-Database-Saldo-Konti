--Atomicity

BEGIN
    -- 1. kreiraš order
    INSERT INTO orders (order_id, customer_id, order_status, store_id)
    VALUES (10011, 1, 'COMPLETE', 1);

    -- 2. dodaješ stavku
    INSERT INTO order_items (order_id, product_id, line_item_id, unit_price, quantity)
    VALUES (10011, 10, 1, 9.99, 14);

    -- 💥 ovdje se dogodi greška
    RAISE_APPLICATION_ERROR(-20001, 'Greška');

    -- 3. smanjuješ stock
    UPDATE order_items SET quantity = quantity - 1 WHERE product_id = 10;

    COMMIT;
END;

select * from orders where order_id = 10011