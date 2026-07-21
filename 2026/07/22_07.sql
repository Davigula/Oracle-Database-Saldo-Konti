-- Bulk processing koristimo kada trebamo obraditi veći broj podataka. Umjesto da pomoću FOR LOOP petlje izvršavamo SQL naredbu red po red, možemo koristiti FORALL i kolekciju podataka. Time smanjujemo broj prijelaza između PL/SQL i SQL enginea i možemo značajno poboljšati performanse.

-- Zamislimo da imamo 1000 pisama koja moramo odnijeti u poštu. FOR LOOP je kao da svako pismo nosimo zasebno, dok je FORALL kao da sva pisma stavimo u jednu vreću i odnesemo ih zajedno.

DECLARE
    TYPE t_order_ids IS TABLE OF NUMBER;

    l_order_ids t_order_ids :=
        t_order_ids(500324, 500325, 500326);
BEGIN

    FOR i IN 1 .. l_order_ids.COUNT LOOP

        UPDATE orders
           SET order_status = 'SHIPPED'
         WHERE order_id = l_order_ids(i);

    END LOOP;

END;
/

DECLARE
    TYPE t_order_ids IS TABLE OF NUMBER;

    l_order_ids t_order_ids :=
        t_order_ids(500324, 500325, 500326);
BEGIN

    FORALL i IN 1 .. l_order_ids.COUNT

        UPDATE orders
           SET order_status = 'SHIPPED'
         WHERE order_id = l_order_ids(i);

END;
/