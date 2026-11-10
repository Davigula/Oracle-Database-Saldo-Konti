SELECT product_id,
       product_name,
       unit_price,
       stock_quantity
FROM products
ORDER BY product_id
FETCH FIRST 10 ROWS ONLY;

CREATE OR REPLACE PACKAGE product_pkg AS

    FUNCTION check_stock (
        p_product_id IN products.product_id%TYPE
    )
    RETURN products.stock_quantity%TYPE;


    FUNCTION check_stock (
        p_product_id IN products.product_id%TYPE,
        p_quantity   IN products.stock_quantity%TYPE
    )
    RETURN BOOLEAN;

END product_pkg;
/

CREATE OR REPLACE PACKAGE BODY product_pkg AS


    FUNCTION check_stock (
        p_product_id IN products.product_id%TYPE
    )
    RETURN products.stock_quantity%TYPE
    IS
        l_stock products.stock_quantity%TYPE;
    BEGIN

        SELECT stock_quantity
          INTO l_stock
          FROM products
         WHERE product_id = p_product_id;

        RETURN l_stock;

    END check_stock;


    FUNCTION check_stock (
        p_product_id IN products.product_id%TYPE,
        p_quantity   IN products.stock_quantity%TYPE
    )
    RETURN BOOLEAN
    IS
        l_stock products.stock_quantity%TYPE;
    BEGIN

        l_stock := check_stock(
            p_product_id => p_product_id
        );

        RETURN l_stock >= p_quantity;

    END check_stock;


END product_pkg;
/

DECLARE
    l_stock products.stock_quantity%TYPE;
BEGIN

    l_stock := product_pkg.check_stock(
        p_product_id => 10
    );

    DBMS_OUTPUT.PUT_LINE(
        'Trenutna zaliha: ' || l_stock
    );

END;
/

BEGIN

    IF product_pkg.check_stock(
        p_product_id => 10,
        p_quantity   => 5
    )
    THEN

        DBMS_OUTPUT.PUT_LINE(
            'Ima dovoljno proizvoda.'
        );

    ELSE

        DBMS_OUTPUT.PUT_LINE(
            'Nema dovoljno proizvoda.'
        );

    END IF;

END;
/
