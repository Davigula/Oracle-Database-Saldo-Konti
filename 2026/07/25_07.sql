DECLARE
    l_customer_count NUMBER;
    l_stock          NUMBER;
    l_quantity       NUMBER := 3;
BEGIN

    -- 1. Postoji li kupac?
    SELECT COUNT(*)
      INTO l_customer_count
      FROM customers
     WHERE customer_id = 10;

    IF l_customer_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Kupac ne postoji.'
        );
    END IF;


    -- 2. Provjeri stanje proizvoda
    SELECT stock_quantity
      INTO l_stock
      FROM products
     WHERE product_id = 20;


    -- 3. Ima li dovoljno proizvoda?
    IF l_stock < l_quantity THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Nema dovoljno proizvoda na stanju.'
        );
    END IF;


    -- 4. Rezerviraj robu
    UPDATE products
       SET stock_quantity = stock_quantity - l_quantity
     WHERE product_id = 20;


    -- 5. Dodaj proizvod u narudžbu
    INSERT INTO order_items (
        order_id,
        product_id,
        quantity,
        line_item_id,
        unit_price
    )
    VALUES (
        126,
        20,
        l_quantity,
        1,
        20
    );


    COMMIT;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        ROLLBACK;

        RAISE_APPLICATION_ERROR(
            -20003,
            'Proizvod ne postoji.'
        );

    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;

END;
/
select * from products

select * from order_items where order_id = 500

SELECT *
FROM order_items
WHERE product_id = 20;

select * from products

ALTER TABLE products
ADD stock_quantity NUMBER;

UPDATE products
SET stock_quantity = 10;

COMMIT;