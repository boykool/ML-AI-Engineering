-- Домашнє завдання: SQL-практика - ORDER BY, LIMIT, INSERT, UPDATE, DELETE

/*

https://hannapylieva.notion.site/SQL-ORDER-BY-LIMIT-INSERT-UPDATE-DELETE-1d094835849480c5a5fcee6b2183d261

Виконайте ці завдання на платформі sql-practice.com (https://sql-practice.com/),
використовуючи базу Northwind.

Формат здачі:
- Google Doc або Notion-сторінка з завданням, розвʼязком і скріншотами результатів -
  те, що повернула база, так аби чітко було видно, що запит відпрацював коректно.

Запити виконано на локальній базі Northwind (PostgreSQL 17).

 */


-- =====================================================================
-- 🔹 Сортування (ORDER BY)
-- =====================================================================


-- ---------------------------------------------------------------------
-- ORDER BY 1. Виведіть список товарів, відсортованих за зростанням ціни.
-- ---------------------------------------------------------------------

SELECT product_name
     , unit_price
FROM products
ORDER BY unit_price ASC
;

/* Результат:

           product_name           | unit_price 
----------------------------------+------------
 Geitost                          |        2.5
 Guaraná Fantástica               |        4.5
 Konbu                            |          6
 Filo Mix                         |          7
 Tourtière                        |       7.45
 Rhönbräu Klosterbier             |       7.75
 Tunnbröd                         |          9
 Teatime Chocolate Biscuits       |        9.2
 Zaanse koeken                    |        9.5
 Rogede sild                      |        9.5
 Jack's New England Clam Chowder  |       9.65
 Longlife Tofu                    |         10
 Aniseed Syrup                    |         10
 Sir Rodney's Scones              |         10
 Spegesild                        |         12
 Gorgonzola Telino                |       12.5
 Scottish Longbreads              |       12.5
 Chocolade                        |      12.75
 Original Frankfurter grüne Soße  |         13
 Genen Shouyu                     |         13
 Escargots de Bourgogne           |      13.25
 Sasquatch Ale                    |         14
 Laughing Lumberjack Lager        |         14
 NuNuCa Nuß-Nougat-Creme          |         14
 Singaporean Hokkien Fried Mee    |         14
 Röd Kaviar                       |         15
 Outback Lager                    |         15
 Valkoinen suklaa                 |      16.25
 Louisiana Hot Spiced Okra        |         17
 Pavlova                          |      17.45
 Chartreuse verte                 |         18
 Steeleye Stout                   |         18
 Chai                             |         18
 Lakkalikööri                     |         18
 Boston Crab Meat                 |       18.4
 Inlagd Sill                      |         19
 Chang                            |         19
 Gula Malacca                     |      19.45
 Ravioli Angelo                   |       19.5
 Maxilaku                         |         20
 Queso Cabrales                   |         21
 Gustaf's Knäckebröd              |         21
 Louisiana Fiery Hot Pepper Sauce |      21.05
 Chef Anton's Gumbo Mix           |      21.35
 Flotemysost                      |       21.5
 Chef Anton's Cajun Seasoning     |         22
 Tofu                             |      23.25
 Pâté chinois                     |         24
 Grandma's Boysenberry Spread     |         25
 Nord-Ost Matjeshering            |      25.89
 Gravad lax                       |         26
 Sirop d'érable                   |       28.5
 Uncle Bob's Organic Dried Pears  |         30
 Ikura                            |         31
 Gumbär Gummibärchen              |      31.23
 Mascarpone Fabioli               |         32
 Perth Pasties                    |       32.8
 Wimmers gute Semmelknödel        |      33.25
 Camembert Pierrot                |         34
 Mozzarella di Giovanni           |       34.8
 Gudbrandsdalsost                 |         36
 Gnocchi di nonna Alice           |         38
 Queso Manchego La Pastora        |         38
 Alice Mutton                     |         39
 Northwoods Cranberry Sauce       |         40
 Schoggi Schokolade               |       43.9
 Vegie-spread                     |       43.9
 Rössle Sauerkraut                |       45.6
 Ipoh Coffee                      |         46
 Tarte au sucre                   |       49.3
 Manjimup Dried Apples            |         53
 Raclette Courdavault             |         55
 Carnarvon Tigers                 |       62.5
 Sir Rodney's Marmalade           |         81
 Mishi Kobe Niku                  |         97
 Thüringer Rostbratwurst          |     123.79
 Côte de Blaye                    |      263.5
(77 rows)

*/


-- ---------------------------------------------------------------------
-- ORDER BY 2. Виведіть працівників у алфавітному порядку за прізвищем (таблиця employees).
-- ---------------------------------------------------------------------

SELECT last_name
     , first_name
     , title
FROM employees
ORDER BY last_name ASC
;

/* Результат:

 last_name | first_name |          title           
-----------+------------+--------------------------
 Buchanan  | Steven     | Sales Manager
 Callahan  | Laura      | Inside Sales Coordinator
 Davolio   | Nancy      | Sales Representative
 Dodsworth | Anne       | Sales Representative
 Fuller    | Andrew     | Vice President, Sales
 King      | Robert     | Sales Representative
 Leverling | Janet      | Sales Representative
 Peacock   | Margaret   | Sales Representative
 Suyama    | Michael    | Sales Representative
(9 rows)

*/


-- =====================================================================
-- 🔹 Обмеження результатів (LIMIT)
-- =====================================================================


-- ---------------------------------------------------------------------
-- LIMIT 1. Виведіть 5 найдорожчих товарів.
-- ---------------------------------------------------------------------

SELECT product_name
     , unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5
;

/* Результат:

      product_name       | unit_price 
-------------------------+------------
 Côte de Blaye           |      263.5
 Thüringer Rostbratwurst |     123.79
 Mishi Kobe Niku         |         97
 Sir Rodney's Marmalade  |         81
 Carnarvon Tigers        |       62.5
(5 rows)

*/


-- ---------------------------------------------------------------------
-- LIMIT 2. Покажіть 3 перших клієнтів зі списку клієнтів,
--          відсортованого за назвою компанії.
-- ---------------------------------------------------------------------

SELECT customer_id
     , company_name
     , contact_name
     , country
FROM customers
ORDER BY company_name ASC
LIMIT 3
;

/* Результат:

 customer_id |            company_name            |  contact_name  | country 
-------------+------------------------------------+----------------+---------
 ALFKI       | Alfreds Futterkiste                | Maria Anders   | Germany
 ANATR       | Ana Trujillo Emparedados y helados | Ana Trujillo   | Mexico
 ANTON       | Antonio Moreno Taquería            | Antonio Moreno | Mexico
(3 rows)

*/


-- =====================================================================
-- 🔹 Вставка, оновлення та видалення
-- =====================================================================

/*
Оскільки ми працюємо в сервісі sql-practice.com - ми не зможемо внести зміни в базу назавжди,
але можемо побачити зміни одразу після запиту. Тому після кожного запиту разом з ним
виконуйте SELECT для перевірки чи внеслись потрібні зміни і показати це як результат
виконання завдань.

Примітка: щоб так само не змінювати базу назавжди, усі завдання цього розділу
виконуються в одній транзакції (BEGIN ... ROLLBACK). Завдання виконуються послідовно,
тому кожне наступне бачить зміни попередніх.
*/

BEGIN;


-- ---------------------------------------------------------------------
-- DML 1. Додайте нову категорію до таблиці categories, але не таку, як була в лекції.
--        (у лекції була 'Drinks', тут - 'Snacks')
-- ---------------------------------------------------------------------

INSERT INTO categories (category_id, category_name, description)
VALUES (9, 'Snacks', 'Chips, nuts, crackers and other snacks')
;

-- Перевірка:
SELECT category_id
     , category_name
     , description
FROM categories
ORDER BY category_id
;

/* Результат:

INSERT 0 1
 category_id | category_name  |                        description                         
-------------+----------------+------------------------------------------------------------
           1 | Beverages      | Soft drinks, coffees, teas, beers, and ales
           2 | Condiments     | Sweet and savory sauces, relishes, spreads, and seasonings
           3 | Confections    | Desserts, candies, and sweet breads
           4 | Dairy Products | Cheeses
           5 | Grains/Cereals | Breads, crackers, pasta, and cereal
           6 | Meat/Poultry   | Prepared meats
           7 | Produce        | Dried fruit and bean curd
           8 | Seafood        | Seaweed and fish
           9 | Snacks         | Chips, nuts, crackers and other snacks
(9 rows)

*/


-- ---------------------------------------------------------------------
-- DML 2. Змініть опис цієї категорії з id=1 на 'Soft drinks and juices'.
-- ---------------------------------------------------------------------

UPDATE categories
SET description = 'Soft drinks and juices'
WHERE category_id = 1
;

-- Перевірка:
SELECT category_id
     , category_name
     , description
FROM categories
WHERE category_id = 1
;

/* Результат:

UPDATE 1
 category_id | category_name |      description       
-------------+---------------+------------------------
           1 | Beverages     | Soft drinks and juices
(1 row)

*/


-- ---------------------------------------------------------------------
-- DML 3. Видаліть категорії з id 3 та 4 з бази.
-- ---------------------------------------------------------------------

-- На категорії 3 і 4 посилаються товари (зовнішній ключ fk_products_categories),
-- тому просто DELETE видасть помилку. Спочатку дивимось, скільки таких товарів:
SELECT category_id
     , COUNT(*) AS products_cnt
FROM products
WHERE category_id IN (3, 4)
GROUP BY category_id
ORDER BY category_id
;

/* Результат:

 category_id | products_cnt 
-------------+--------------
           3 |           13
           4 |           10
(2 rows)

*/

-- Відвʼязуємо товари від цих категорій, потім видаляємо категорії:
UPDATE products
SET category_id = NULL
WHERE category_id IN (3, 4)
;

DELETE FROM categories
WHERE category_id IN (3, 4)
;

-- Перевірка:
SELECT category_id
     , category_name
     , description
FROM categories
ORDER BY category_id
;

/* Результат:

UPDATE 23
DELETE 2
 category_id | category_name  |                        description                         
-------------+----------------+------------------------------------------------------------
           1 | Beverages      | Soft drinks and juices
           2 | Condiments     | Sweet and savory sauces, relishes, spreads, and seasonings
           5 | Grains/Cereals | Breads, crackers, pasta, and cereal
           6 | Meat/Poultry   | Prepared meats
           7 | Produce        | Dried fruit and bean curd
           8 | Seafood        | Seaweed and fish
           9 | Snacks         | Chips, nuts, crackers and other snacks
(7 rows)

*/


-- ---------------------------------------------------------------------
-- DML 4. Підвищте ціни на 10% для всіх товарів поставників з supplier_id 3, 4, 7.
-- ---------------------------------------------------------------------

-- Ціни ДО оновлення:
SELECT product_id
     , product_name
     , supplier_id
     , unit_price
FROM products
WHERE supplier_id IN (3, 4, 7)
ORDER BY supplier_id, product_id
;

/* Результат:

 product_id |          product_name           | supplier_id | unit_price 
------------+---------------------------------+-------------+------------
          6 | Grandma's Boysenberry Spread    |           3 |         25
          7 | Uncle Bob's Organic Dried Pears |           3 |         30
          8 | Northwoods Cranberry Sauce      |           3 |         40
          9 | Mishi Kobe Niku                 |           4 |         97
         10 | Ikura                           |           4 |         31
         74 | Longlife Tofu                   |           4 |         10
         16 | Pavlova                         |           7 |      17.45
         17 | Alice Mutton                    |           7 |         39
         18 | Carnarvon Tigers                |           7 |       62.5
         63 | Vegie-spread                    |           7 |       43.9
         70 | Outback Lager                   |           7 |         15
(11 rows)

*/

UPDATE products
SET unit_price = unit_price * 1.1
WHERE supplier_id IN (3, 4, 7)
;

-- Перевірка (ціни ПІСЛЯ оновлення):
SELECT product_id
     , product_name
     , supplier_id
     , unit_price
FROM products
WHERE supplier_id IN (3, 4, 7)
ORDER BY supplier_id, product_id
;

/* Результат:

UPDATE 11
 product_id |          product_name           | supplier_id | unit_price 
------------+---------------------------------+-------------+------------
          6 | Grandma's Boysenberry Spread    |           3 |       27.5
          7 | Uncle Bob's Organic Dried Pears |           3 |         33
          8 | Northwoods Cranberry Sauce      |           3 |         44
          9 | Mishi Kobe Niku                 |           4 |      106.7
         10 | Ikura                           |           4 |       34.1
         74 | Longlife Tofu                   |           4 |         11
         16 | Pavlova                         |           7 |  19.195002
         17 | Alice Mutton                    |           7 |       42.9
         18 | Carnarvon Tigers                |           7 |      68.75
         63 | Vegie-spread                    |           7 |      48.29
         70 | Outback Lager                   |           7 |       16.5
(11 rows)

*/


-- ---------------------------------------------------------------------
-- DML 5. Видаліть усі товари, у яких кількість на складі = 0
--        (попередньо перевірте їх SELECTом).
-- ---------------------------------------------------------------------

-- Попередня перевірка:
SELECT product_id
     , product_name
     , units_in_stock
FROM products
WHERE units_in_stock = 0
ORDER BY product_id
;

/* Результат:

 product_id |      product_name       | units_in_stock 
------------+-------------------------+----------------
          5 | Chef Anton's Gumbo Mix  |              0
         17 | Alice Mutton            |              0
         29 | Thüringer Rostbratwurst |              0
         31 | Gorgonzola Telino       |              0
         53 | Perth Pasties           |              0
(5 rows)

*/

-- На ці товари посилаються рядки замовлень (fk_order_details_products),
-- тому спочатку видаляємо їх з order_details, потім самі товари:
DELETE FROM order_details
WHERE product_id IN (SELECT product_id FROM products WHERE units_in_stock = 0)
;

DELETE FROM products
WHERE units_in_stock = 0
;

-- Перевірка:
SELECT product_id
     , product_name
     , units_in_stock
FROM products
WHERE units_in_stock = 0
;

SELECT COUNT(*) AS products_left
FROM products
;

/* Результат:

DELETE 160
DELETE 5
 product_id | product_name | units_in_stock 
------------+--------------+----------------
(0 rows)

 products_left 
---------------
            72
(1 row)

*/


-- Відкат усіх змін, щоб база залишилась у початковому стані:
ROLLBACK;
