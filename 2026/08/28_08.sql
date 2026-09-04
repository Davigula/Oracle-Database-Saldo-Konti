CREATE OR REPLACE PACKAGE BODY order_pkg AS

    PROCEDURE validate_customer (
        p_customer_id NUMBER
    )
    IS
    l_customer_count NUMBER;
    BEGIN
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
    END;


    PROCEDURE validate_quantity(
        p_quantity NUMBER)    
    IS
    BEGIN
        IF p_quantity <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Količina mora biti veća od 0'
        );
        END IF;

    END;


    PROCEDURE create_order (
        p_customer_id NUMBER
    )
    IS
    l_order_id number;
    BEGIN
        INSERT INTO orders (
        order_id,
        customer_id,
        order_status,
        order_datetime
    )
    VALUES (
        111,
        p_customer_id,
        'OPEN',
        SYSDATE
    )
    RETURNING order_id INTO l_order_id;
    END;


    PROCEDURE write_log (
        p_order_id NUMBER
    )
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(
        'Kreirana narudžba: ' || p_order_id
    );

    END;


    PROCEDURE process_order (
        p_order_id NUMBER,
        p_customer_id NUMBER
    )
    IS
    BEGIN

        validate_customer(p_customer_id);

        calculate_total(p_order_id);

        create_order(p_customer_id);

        write_log(p_order_id);

    END process_order;

END order_pkg;
/