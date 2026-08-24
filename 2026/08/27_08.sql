CREATE OR REPLACE PROCEDURE process_order (
    p_customer_id NUMBER,
    p_product_id  NUMBER,
    p_quantity    NUMBER
)
IS
    l_customer_count NUMBER;
    l_price          NUMBER;
    l_total          NUMBER;
    l_order_id       NUMBER;
BEGIN

    -- 1. Provjeri kupca
    SELECT COUNT(*)
    INTO l_customer_count
    FROM customers
    WHERE customer_id = p_customer_id;

    IF l_customer_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Customer ne postoji'
        );
    END IF;


    -- 2. Dohvati proizvod i cijenu
    SELECT unit_price
    INTO l_price
    FROM products
    WHERE product_id = p_product_id;


    -- 3. Validiraj količinu
    IF p_quantity <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Količina mora biti veća od 0'
        );
    END IF;


    -- 4. Izračunaj ukupnu cijenu
    l_total := l_price * p_quantity;


    -- 5. Kreiraj order
    INSERT INTO orders (
        order_id,
        customer_id,
        order_status,
        order_datetime
    )
    VALUES (
        orders_seq.NEXTVAL,
        p_customer_id,
        'OPEN',
        SYSDATE
    )
    RETURNING order_id INTO l_order_id;


    -- 6. Kreiraj order item
    INSERT INTO order_items (
        order_id,
        product_id,
        quantity,
        unit_price
    )
    VALUES (
        l_order_id,
        p_product_id,
        p_quantity,
        l_price
    );


    -- 7. Logging
    DBMS_OUTPUT.PUT_LINE(
        'Kreirana narudžba: ' || l_order_id
    );


    -- 8. Još poslovne logike...
    -- update stock
    -- calculate discount
    -- check limits
    -- notification
    -- audit
    -- ...

END;
/


CREATE OR REPLACE PROCEDURE process_order (
    p_customer_id NUMBER,
    p_product_id  NUMBER,
    p_quantity    NUMBER
)
IS
BEGIN

    validate_customer(p_customer_id);

    validate_product(p_product_id);

    validate_quantity(p_quantity);

    create_order(
        p_customer_id,
        p_product_id,
        p_quantity
    );

    log_order_creation(p_customer_id);

END;
/