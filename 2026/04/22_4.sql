-- WHEN OTHERS – dobra i loša praksa

BEGIN
    INSERT INTO orders (order_id, customer_id, order_status, store_id)
    VALUES (1111, 999, 'COMPLETE', 1); 

    EXCEPTION
        WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('Nešto je pošlo krivo' || SQLERRM);

          RAISE;

END;