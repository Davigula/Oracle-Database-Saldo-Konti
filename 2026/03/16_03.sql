-- Napiši view koji računa proizvod narudžbe veći od prosječne količine

select * from order_items

CREATE OR REPLACE VIEW vw_large_order_items AS
SELECT
    line_item_id,
    order_id,
    product_id,
    quantity,
    unit_price
FROM order_items
WHERE quantity >
      (SELECT AVG(quantity) FROM order_items);

      SELECT *
FROM vw_large_order_items;