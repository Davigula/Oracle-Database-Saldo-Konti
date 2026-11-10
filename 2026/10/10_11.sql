-- Izaberi studenta s najviše ambicija. Prikaži student_id za studente koji su upisani u najviše sekcija

SELECT student_id,
       COUNT(*) AS broj_sekcija
FROM enrollment
GROUP BY student_id
HAVING COUNT(*) =
(
    SELECT MAX(COUNT(*))
    FROM enrollment
    GROUP BY student_id
);
