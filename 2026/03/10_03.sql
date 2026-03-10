CREATE OR REPLACE TRIGGER trg_orders_bi
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF :NEW.order_date IS NULL THEN
        :NEW.order_date := SYSDATE;
    END IF;
END;
/