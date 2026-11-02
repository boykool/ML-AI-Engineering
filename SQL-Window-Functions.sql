-- Active: 1792964804739@@127.0.0.1@3306
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

SELECT patient_id,
       first_name,
       weight,
       SUM(weight) OVER (ORDER BY patient_id) AS rolling_sum
FROM patients
--WHERE rolling_sum < 1000
;


SELECT patient_id,
       province_id,
       FIRST_VALUE(birth_date)
                   OVER (
                       PARTITION BY province_id -- групує за province_id
                       ORDER BY birth_date -- сортує за birth_date для визначення першого значення
                       ) AS oldest_birth_date
FROM patients
ORDER BY patient_id
;


SELECT patient_id,
       province_id,
       weight,
       RANK()
               OVER (
                   PARTITION BY province_id -- групує пацієнтів за province_id
                   ORDER BY weight DESC -- сортує за спаданням ваги
                   ) AS weight_rank
FROM patients
ORDER BY province_id, weight_rank
;



SELECT patient_id,
       province_id,
       weight,
       DENSE_RANK()
               OVER (
                   PARTITION BY province_id -- групує пацієнтів за province_id
                   ORDER BY weight DESC -- сортує за спаданням ваги
                   ) AS weight_dense_rank
FROM patients
ORDER BY province_id, weight_dense_rank
;

