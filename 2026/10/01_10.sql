-- napiši SQL izjavu koja prikazuje ime i prezime studenta koji je registriran prvi

SELECT s.FIRST_name, s.LAST_NAME, s.REGISTRATION_DATE 
FROM STUDENT s 
WHERE s.REGISTRATION_DATE = (SELECT  min(registration_date) FROM student);

-- Prikažite sekcije s najnižom cijenom tečaja i kapacitetom jednakim ili manjim od prosječnog kapaciteta
SELECT s.section_id,
       s.course_no,
       s.capacity,
       (SELECT COUNT(*)
          FROM enrollment e
         WHERE e.section_id = s.section_id) AS number_enrolled
FROM section s
WHERE (SELECT COUNT(*)
         FROM enrollment e
        WHERE e.section_id = s.section_id) > s.capacity;

--Odaberite broj kolegija i ukupan kapacitet za svaki kolegij. Prikažite samo one kolegije čiji je ukupan kapacitet manji od prosječnog kapaciteta svih sekcija.
SELECT COUNT(*)
FROM student s
WHERE EXISTS (
    SELECT 1
   FROM enrollment e
    WHERE e.student_id = s.student_id
);