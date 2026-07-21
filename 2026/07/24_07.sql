-- Edge case-heavy scenarij (order flow) validacija exception handling rollback

DECLARE
    l_customer_count NUMBER;
    l_product_count  NUMBER;
BEGIN

    -- 1. VALIDACIJA KUPCA
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


    -- 2. VALIDACIJA PROIZVODA
    SELECT COUNT(*)
      INTO l_product_count
      FROM products
     WHERE product_id = 20;

    IF l_product_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Proizvod ne postoji.'
        );
    END IF;


    -- 3. KREIRANJE NARUDŽBE
    INSERT INTO orders (
        order_id,
        order_datetime,
        customer_id,
        order_status,
        store_id
    )
    VALUES (
        600001,
        SYSDATE,
        10,
        'SHIPPED',
        1
    );


    -- 4. KREIRANJE STAVKE
    INSERT INTO order_items (
        order_id,
        line_item_id,
        product_id,
        quantity, unit_price
    )
    VALUES (
        600001,
        1,
        20,
        2,
        20
    );


    COMMIT;

EXCEPTION
    WHEN OTHERS THEN

        ROLLBACK;

        RAISE;
END;
/