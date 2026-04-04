-- order mora imati postojećeg kupca
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)

INSERT INTO orders (order_id, customer_id)
VALUES (1001, 999); -- kupac ne postoji

CHECK (quantity > 0)

INSERT INTO order_items (order_id, quantity)
VALUES (1001, -5);