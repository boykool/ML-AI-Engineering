-- Active: 1792938177308@@127.0.0.1@3306
/*

SQL: Window Functions

https://hannapylieva.notion.site/SQL-Window-Functions-16194835849480929a7ee2528eb47f4e

*/

SELECT AVG(weight) AS avg_weight
FROM patients
;

SELECT first_name,
       last_name,
       weight,
       AVG(weight) OVER () AS avg_weight
FROM patients
;

WITH rolling_sum_table AS (SELECT patient_id,
                                  first_name,
                                  weight,
                                  SUM(weight) OVER (ORDER BY patient_id) AS rolling_sum
                           FROM patients)
SELECT *
FROM rolling_sum_table
WHERE rolling_sum < 1000
;


SELECT *
FROM (SELECT patient_id,
             first_name,
             weight,
             SUM(weight) OVER (ORDER BY patient_id) AS rolling_sum
      FROM patients)
WHERE rolling_sum < 1000
;


