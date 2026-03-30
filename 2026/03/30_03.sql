-- Zašto NE commit u proceduri

CREATE OR REPLACE PROCEDURE create_order (
    p_customer_id NUMBER
) AS
BEGIN
    INSERT INTO orders (customer_id)
    VALUES (p_customer_id);

    COMMIT; 
END;
/

BEGIN
    create_order(1);
    
    INSERT INTO audit_log VALUES (...);

    RAISE_APPLICATION_ERROR(-20001, 'Error');
END;

BEGIN
    create_order(1);
    
    INSERT INTO audit_log VALUES (...);

    COMMIT; -- ✅ sve ili ništa
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END;