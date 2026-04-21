DECLARE
    v_name customers.full_name%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('START');

    -- 🔵 BLOK 1 (ima grešku, nema handler)
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Blok 1');

        SELECT full_name
        INTO v_name
        FROM customers
        WHERE customer_id = 999; -- ❌ NO_DATA_FOUND

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Greška uhvaćena u VANJSKOM bloku');

        DBMS_OUTPUT.PUT_LINE('Ovo se NE izvrši');
    END;

    DBMS_OUTPUT.PUT_LINE('Ovo se preskače');


END