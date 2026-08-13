-- imamo proceduru za otkazivanje narudžbe:
UPDATE orders
SET order_status = 'CANCELLED'
WHERE order_id = p_order_id;

-- Na drugom mjestu:
IF l_status = 'CANCELLED' THEN
    ...
END IF;

-- Na trećem:
WHERE order_status <> 'CANCELLED'

-- Ako pogriješimo i  napišemo: 'CANCELED'

CREATE OR REPLACE PACKAGE david_constants AS

    c_status_cancelled CONSTANT VARCHAR2(20) := 'CANCELLED';
    c_status_shipped   CONSTANT VARCHAR2(20) := 'SHIPPED';

END david_constants;
/

UPDATE orders
SET order_status = david_constants.c_status_cancelled
WHERE order_id = p_order_id;

IF l_status = david_constants.c_status_cancelled THEN
    ...
END IF;

-- Konfiguracija
c_large_order_limit CONSTANT NUMBER := 500;

CREATE TABLE app_config (
    config_name  VARCHAR2(100) PRIMARY KEY,
    config_value VARCHAR2(100)
);

UPDATE app_config
SET config_value = '750'
WHERE config_name = 'LARGE_ORDER_LIMIT';

COMMIT;