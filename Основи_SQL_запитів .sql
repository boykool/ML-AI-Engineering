-- Active: 1792342679007@@127.0.0.1@55432@northwind@public
/*

Основи баз даних та SQL
https://hannapylieva.notion.site/ebd//1cd94835849480f3a6d4fa007773cc87

===

Розділ 1. Вступ до баз даних
https://hannapylieva.notion.site/ebd//1cf94835849480e8a5ade7bb86377efd

Learn SQL - Online SQL Terminal - Practice SQL Queries
https://www.sql-practice.com/

===

Розділ 2. Знайомство з SQL та реляційними базами даних
https://hannapylieva.notion.site/ebd//1cf9483584948063af48e9a01a635b54


Розділ 3. Основні операції з даними
https://hannapylieva.notion.site/ebd//1cf94835849480a980c4fd9505d6123f

Розділ 4. Просунуті запити
https://hannapylieva.notion.site/ebd//1cf94835849480739965e8d37ec54826

Розділ 5. Зв’язки між таблицями
https://hannapylieva.notion.site/ebd//1cf94835849480f0987bc70ee0a46069

 */


-- Розділ 3. Основні операції з даними
-- https://hannapylieva.notion.site/ebd//1cf94835849480a980c4fd9505d6123f

SELECT product_name
FROM products;

SELECT first_name,
       last_name,
       title
FROM employees;

SELECT *
FROM products;

SELECT *
FROM products
WHERE discontinued = 1;

SELECT product_id
     , product_name
     , supplier_id
     , discontinued
FROM products
WHERE discontinued = 1
;


SELECT product_id
     , product_name
--      , supplier_id
     , discontinued
FROM products
WHERE discontinued = 0
;

SELECT *
FROM employees
WHERE title = 'Sales Representative'
;

SELECT product_name
     , unit_price
FROM products
WHERE unit_price > 100
;

SELECT product_name
     , unit_price
     , units_in_stock
FROM products
WHERE unit_price > 10
  AND unit_price < 200
  AND units_in_stock > 0
;


SELECT *
FROM employees
WHERE country != 'USA';


SELECT employee_id
     , country
FROM employees
WHERE country != 'USA';


SELECT *
FROM customers
WHERE city = 'London'
   OR city = 'Paris'
;

SELECT *
FROM customers
WHERE NOT (city = 'London' OR city = 'Paris')
;

SELECT city
FROM customers
WHERE NOT (city = 'London' OR city = 'Paris')
;

SELECT city
FROM customers
WHERE NOT city = 'London'
   OR city = 'Paris'
;

SELECT COUNT(*)
FROM customers
WHERE NOT (city = 'London' OR city = 'Paris')
;

SELECT COUNT(*)
FROM customers
WHERE NOT city = 'London'
   OR city = 'Paris'
;

SELECT *
FROM customers
WHERE NOT city = 'London'
   OR city = 'Paris'
ORDER BY city
;


SELECT *
FROM customers
WHERE NOT (city = 'London' OR city = 'Paris')
ORDER BY city
;

SELECT COUNT(*)
FROM customers
WHERE NOT (city IN ('London', 'Paris'))
-- ORDER BY city
;

SELECT *
FROM customers
WHERE city IN ('London', 'Paris', 'Portland')
ORDER BY city
;

SELECT *
FROM customers
WHERE city IN ('london', 'Paris', 'Portland')
ORDER BY city
;

SELECT *
FROM customers
WHERE city = 'London'
ORDER BY city
;


SELECT product_name, unit_price
FROM products
WHERE unit_price BETWEEN 20 AND 30
;


SELECT product_name, unit_price
FROM products
WHERE unit_price >= 20
  AND unit_price <= 30;


SELECT *
FROM customers
WHERE contact_name LIKE 'A%'
;

SELECT *
FROM customers
WHERE contact_name LIKE '%n'
;

SELECT *
FROM customers
WHERE contact_name LIKE '_a%'
;

SELECT *
FROM customers
WHERE LOWER(city) = 'london'
;

SELECT *
FROM employees
WHERE LOWER(city) = 'london'
;

SELECT LOWER(city)
FROM employees
;

SELECT customer_id, company_name, contact_name
FROM customers
WHERE contact_name LIKE '__a%'
;

SELECT customer_id, LOWER(company_name), contact_name
FROM customers
WHERE contact_name LIKE '__a%'
;

SELECT *
FROM customers
WHERE region IS NULL
;

SELECT *
FROM customers
WHERE region IS NOT NULL
;


SELECT *
FROM customers
WHERE region IS NOT NULL
  AND fax IS NOT NULL
;


SELECT product_name, unit_price, units_in_stock
FROM products
WHERE unit_price > 50
  AND units_in_stock > 0
  AND discontinued = 0
;

/*

Домашнє завдання: SQL-практика - SELECT, WHERE

https://hannapylieva.notion.site/SQL-SELECT-WHERE-1d09483584948088871bcc039a7a63c5


 */

