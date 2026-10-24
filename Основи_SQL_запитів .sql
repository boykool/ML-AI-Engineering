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


SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
;


SELECT first_name, last_name
FROM employees
ORDER BY last_name --ASC
;

SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5
;

SELECT *
FROM categories
;

INSERT INTO categories (category_id, category_name, description)
VALUES (9, 'Drinks', 'Non-alcoholic beverages')
;

SELECT *
FROM categories
;


UPDATE products
SET unit_price = 25
WHERE product_id = 1;

SELECT *
FROM products
WHERE product_id = 1
;

UPDATE products
SET unit_price = 25
WHERE product_id IN (1, 2, 4)
;

SELECT *
FROM products
WHERE product_id IN (1, 2, 4)
;

UPDATE products
SET unit_price = unit_price * 1.1
WHERE category_id = 4
;


SELECT *
FROM products
WHERE category_id = 4
;

/*

DELETE FROM products
WHERE units_in_stock = 0;

SELECT * FROM products;

*/

/*
Домашнє завдання: SQL-практика: ORDER BY, LIMIT, INSERT, UPDATE, DELETE
https://hannapylieva.notion.site/SQL-ORDER-BY-LIMIT-INSERT-UPDATE-DELETE-1d094835849480c5a5fcee6b2183d261
*/

SELECT COUNT(*) AS total_products
FROM products
;

SELECT COUNT(*) AS total_emp
FROM employees
;

SELECT AVG(unit_price) AS avg_unit_price
FROM products
;

SELECT AVG(units_in_stock) AS avg_unit_price
FROM products
;

SELECT AVG(unit_price),
       AVG(units_in_stock),
       AVG(units_on_order)
           AS avg_unit_price
FROM products
;

SELECT AVG(unit_price)     AS avg_price,
       AVG(units_in_stock) AS avg_uis,
       AVG(units_on_order) AS avg_unit_price
FROM products
;


SELECT category_id
     , AVG(unit_price) AS avg_price
FROM products
GROUP BY category_id
;

SELECT AVG(unit_price)
FROM products;


SELECT category_id
     , AVG(unit_price) AS avg_price
     , MIN(unit_price) AS min_price
     , MAX(unit_price) AS max_price
FROM products
GROUP BY category_id
;


SELECT c.category_id,
       c.category_name,
       COUNT(*)                                                  AS n_products,
       AVG(p.unit_price)                                         AS avg_price,
       MODE() WITHIN GROUP (ORDER BY p.unit_price)               AS mode_price,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY p.unit_price) AS median_price,
       MIN(p.unit_price)                                         AS min_price,
       MAX(p.unit_price)                                         AS max_price
FROM products p
         JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY avg_price
;

SELECT supplier_id,
       category_id,
       --category_name,
       COUNT(1)        AS n_products,
       AVG(unit_price) AS avg_price
FROM products
GROUP BY supplier_id, category_id
ORDER BY avg_price
;

SELECT supplier_id,
       category_id,
--    category_name,
       COUNT(1)        AS n_products,
       AVG(unit_price) AS avg_price
FROM products
GROUP BY supplier_id, category_id
;


SELECT supplier_id,
       category_id,
--    category_name,
       COUNT(1)        AS n_products,
       AVG(unit_price) AS avg_price
FROM products
WHERE category_id IN (1, 2)
GROUP BY supplier_id, category_id
ORDER BY supplier_id, category_id
;

SELECT category_id,
       supplier_id,
       COUNT(1)        AS n_products,
       AVG(unit_price) AS avg_price
FROM products
WHERE category_id IN (1, 2)
GROUP BY category_id, supplier_id
ORDER BY avg_price
;


SELECT category_id,
       supplier_id,
       COUNT(1)        AS n_products,
       AVG(unit_price) AS avg_price
FROM products
WHERE category_id IN (1, 2)
GROUP BY category_id, supplier_id
HAVING AVG(unit_price) > 10
;


SELECT category_id, AVG(unit_price) AS avg_price
FROM products
WHERE units_in_stock > 0
GROUP BY category_id
--HAVING AVG(unit_price) > 50
;

SELECT category_id, AVG(unit_price) AS avg_price
FROM products
WHERE units_in_stock > 0
GROUP BY category_id
--HAVING AVG(unit_price) > 50
;

SELECT category_id, COUNT(1) AS n_items
FROM products
WHERE units_in_stock = 0
GROUP BY category_id
ORDER BY category_id
;

SELECT category_id, AVG(unit_price) AS avg_price
FROM products
WHERE units_in_stock > 0
GROUP BY category_id
HAVING AVG(unit_price) > 30
ORDER BY category_id
;

SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 10
;


SELECT customer_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders
;

SELECT customer_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 5
;


-- boo
SELECT AVG(unit_price)
FROM products
;


SELECT product_name, unit_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price)
                    FROM products)
;

-- boo
SELECT category_id, AVG(unit_price) AS avg_price
FROM products
GROUP BY category_id
;

SELECT category_id, avg_price
FROM (SELECT category_id, AVG(unit_price) AS avg_price
      FROM products
      GROUP BY category_id) AS sub
ORDER BY avg_price DESC;



SELECT category_id, avg_price
FROM (SELECT category_id, AVG(unit_price) AS avg_price
      FROM products
      GROUP BY category_id) AS sub
WHERE avg_price > 25
ORDER BY avg_price DESC;


SELECT category_id, AVG(unit_price) AS avg_price
FROM products
GROUP BY category_id
HAVING AVG(unit_price) > 25
ORDER BY avg_price DESC
;

WITH sub AS (SELECT category_id, AVG(unit_price) AS avg_price
             FROM products
             GROUP BY category_id)
SELECT category_id, avg_price
FROM sub
WHERE avg_price > 25
ORDER BY avg_price DESC
;

SELECT order_id
     , EXTRACT(YEAR FROM order_date)  AS order_year
     , EXTRACT(MONTH FROM order_date) AS order_month
     , EXTRACT(DAY FROM order_date)   AS order_day
--   , YEAR(order_date)               AS order_year
--   , MONTH(order_date)              AS order_month
--   , DAY(order_date)                AS order_day
FROM orders
--WHERE order_month IN (6,7,8);
WHERE EXTRACT(MONTH FROM order_date) IN (6, 7, 8)
;


SELECT product_name
     , category_name
FROM products p
         LEFT JOIN categories c
                   ON p.category_id = c.category_id
;


SELECT *
FROM products p
         LEFT JOIN categories c
                   ON p.category_id = c.category_id
WHERE category_name IS NULL;

SELECT COUNT(*)
FROM products p
         RIGHT JOIN order_details od
                    ON p.product_id = od.product_id;

SELECT p.product_id,
       p.product_name,
       COUNT(*) AS n_orders
FROM order_details od
         JOIN products p
              ON p.product_id = od.product_id
GROUP BY p.product_id
ORDER BY n_orders --DESC
--LIMIT 5
;
