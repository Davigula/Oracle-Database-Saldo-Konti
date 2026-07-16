-- SQLCODE → broj kvara.
-- SQLERRM → opis kvara.
-- FORMAT_ERROR_STACK → popis svih problema koji su se dogodili.
-- FORMAT_ERROR_BACKTRACE → kaže u kojem je dijelu motora kvar nastao.


BEGIN
    INSERT INTO orders (order_id, customer_id, order_datetime, order_status, store_id)
    VALUES (10011, 9999, sysdate, 'COMPLETE', 1);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Kod greške: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
         DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
END;

select * from orders

