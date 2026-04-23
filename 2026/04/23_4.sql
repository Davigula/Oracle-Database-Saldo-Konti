BEGIN
    UPDATE products
    SET unit_price = unit_price * 0.9
    WHERE product_id = 9991;

    IF SQL%ROWCOUNT = 0 THEN
        dbms_output.put_line('Danas');
    END IF;
            
END;

select * from products where product_id = 9991;

UPDATE david_products
SET price = price * 0.9
WHERE product_id = 999;