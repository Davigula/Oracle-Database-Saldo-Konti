DECLARE
    l_error_code    NUMBER;
    l_error_message VARCHAR2(4000);
BEGIN

    RAISE_APPLICATION_ERROR(
        -20001,
        'Namjerno izazvana greška'
    );

EXCEPTION
    WHEN OTHERS THEN

        l_error_code    := SQLCODE;
        l_error_message := SQLERRM;

        INSERT INTO error_log (
            log_date,
            module_name,
            error_code,
            error_message
        )
        VALUES (
            SYSDATE,
            'TEST_ERROR',
            l_error_code,
            l_error_message
        );

        ROLLBACK;
        RAISE;

END;
/

select * from error_log

CREATE OR REPLACE PROCEDURE log_error (
    p_module_name   VARCHAR2,
    p_error_code    NUMBER,
    p_error_message VARCHAR2
)
IS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

    INSERT INTO error_log (
        log_date,
        module_name,
        error_code,
        error_message
    )
    VALUES (
        SYSDATE,
        p_module_name,
        p_error_code,
        p_error_message
    );

    COMMIT;

END;
/


BEGIN

    RAISE_APPLICATION_ERROR(
        -20001,
        'Namjerno izazvana greška'
    );

EXCEPTION
    WHEN OTHERS THEN

        log_error(
            'update_order_status',
            SQLCODE,
            SQLERRM
        );

        ROLLBACK;
        RAISE;

END;
/


select * from error_log