declare
    l_phone number;
BEGIN
    SELECT phone_number
      INTO l_phone
      FROM customer_phones
     WHERE customer_id = 10;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        l_phone := 'Nije naveden';
END;

SELECT * FROM CUSTOMERS;