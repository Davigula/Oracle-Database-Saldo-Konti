-- Bulk processing

select * from order_items where order_id = 226;


DECLARE
    TYPE kolekcija IS TABLE OF NUMBER;

    l_item_ids kolekcija :=
        kolekcija(501);
BEGIN

    FOR i IN 1 .. l_item_ids.COUNT LOOP

        DELETE FROM order_items
        WHERE order_id = l_item_ids(i);

    END LOOP;

END;