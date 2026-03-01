CREATE OR REPLACE PACKAGE order_management_pkg IS

    -- Custom exceptions
    ex_customer_not_found EXCEPTION;
    ex_product_not_found  EXCEPTION;
    ex_no_stock           EXCEPTION;
    ex_order_not_found    EXCEPTION;

    -- Functions
    FUNCTION get_order_total(p_order_id NUMBER)
        RETURN NUMBER;

    FUNCTION check_stock(
        p_product_id NUMBER,
        p_quantity   NUMBER
    ) RETURN BOOLEAN;

    -- Procedures
    PROCEDURE create_order(
        p_customer_id NUMBER,
        p_product_id  NUMBER,
        p_quantity    NUMBER
    );

    PROCEDURE cancel_order(
        p_order_id NUMBER
    );

END order_management_pkg;
/


CREATE OR REPLACE PACKAGE BODY order_management_pkg IS

    FUNCTION get_order_total(p_order_id NUMBER)
        RETURN NUMBER
    IS
        v_total NUMBER(10,2);
    BEGIN
        SELECT NVL(SUM(quantity * price_at_order), 0)
        INTO v_total
        FROM david_order_items
        WHERE order_id = p_order_id;

        RETURN v_total;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Order not found');
    END;

    FUNCTION check_stock(
    p_product_id NUMBER,
    p_quantity   NUMBER
    ) RETURN BOOLEAN
    IS
        v_stock david_products.stock_quantity%TYPE;
    BEGIN
        SELECT stock_quantity
        INTO v_stock
        FROM david_products
        WHERE product_id = p_product_id;

        IF v_stock < p_quantity THEN
            RAISE ex_no_stock;
        END IF;

        RETURN TRUE;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE ex_product_not_found;
    END;

        PROCEDURE create_order(
        p_customer_id NUMBER,
        p_product_id  NUMBER,
        p_quantity    NUMBER
    )
    IS
        v_order_id NUMBER;
        v_price    david_products.price%TYPE;
    BEGIN

        -- provjera kupca
        BEGIN
            SELECT 1
            INTO v_order_id
            FROM david_customers
            WHERE customer_id = p_customer_id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE ex_customer_not_found;
        END;

        -- uzmi cijenu
        SELECT price
        INTO v_price
        FROM david_products
        WHERE product_id = p_product_id;

        -- provjeri stock
        check_stock(p_product_id, p_quantity);

        -- generiraj order_id (pretpostavimo sekvencu)
        SELECT david_order_seq.NEXTVAL
        INTO v_order_id
        FROM dual;

        -- insert order
        INSERT INTO david_order (
            order_id,
            customer_id,
            order_date,
            status,
            total_amount
        )
        VALUES (
            v_order_id,
            p_customer_id,
            SYSDATE,
            'CREATED',
            0
        );

        -- insert order item
        INSERT INTO david_order_items (
            order_item_id,
            order_id,
            product_id,
            quantity,
            price_at_order
        )
        VALUES (
            david_order_items_seq.NEXTVAL,
            v_order_id,
            p_product_id,
            p_quantity,
            v_price
        );

        -- smanji stock
        UPDATE david_products
        SET stock_quantity = stock_quantity - p_quantity
        WHERE product_id = p_product_id;

        -- update total
        UPDATE david_order
        SET total_amount = get_order_total(v_order_id)
        WHERE order_id = v_order_id;

        COMMIT;

    EXCEPTION
        WHEN ex_customer_not_found THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20010, 'Customer not found');

        WHEN ex_product_not_found THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'Product not found');

        WHEN ex_no_stock THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20012, 'Not enough stock');

        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END;

        PROCEDURE cancel_order(
        p_order_id NUMBER
    )
    IS
    BEGIN

        -- vrati stock
        FOR rec IN (
            SELECT product_id, quantity
            FROM david_order_items
            WHERE order_id = p_order_id
        )
        LOOP
            UPDATE david_products
            SET stock_quantity = stock_quantity + rec.quantity
            WHERE product_id = rec.product_id;
        END LOOP;

        -- update status
        UPDATE david_order
        SET status = 'CANCELLED',
            total_amount = 0
        WHERE order_id = p_order_id;

        COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END;

END order_management_pkg;
/