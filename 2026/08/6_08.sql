CREATE OR REPLACE PACKAGE transaction_api AS

    PROCEDURE commit_transaction;

    PROCEDURE rollback_transaction;

END;
/

CREATE OR REPLACE PACKAGE BODY transaction_api AS

    PROCEDURE commit_transaction IS
    BEGIN

        COMMIT;

    END;

    PROCEDURE rollback_transaction IS
    BEGIN

        ROLLBACK;

    END;

END;
/

Transaction committed
Vrijeme: 10:42:15
Korisnik: DAVID
Modul: ORDER_PROCESSING