-- Домашнє завдання: SQL-практика. JOINs

/*

https://hannapylieva.notion.site/SQL-JOINs-1d594835849480e19eaac37639cc4c9b

Виконайте ці завдання на платформі sql-practice.com (https://sql-practice.com/),
використовуючи базу Northwind.

Завдання побудовані так, ніби ви працюєте аналітиком у компанії:
витягуєте потрібні дані зі зв'язків між таблицями.

Формат здачі:
- Google Doc або Notion-сторінка з завданням, розвʼязком і скріншотами результатів -
  те, що повернула база, так аби чітко було видно, що запит відпрацював коректно.

Запити виконано на локальній базі Northwind (PostgreSQL 17).

Примітка: локальна версія Northwind трохи відрізняється від бази на sql-practice.com:
  - у suppliers.region немає значень 'North America' / 'Western Europe' (там штати/провінції),
  - працівників найнято у 1992-1994 роках, а не у 2013.
Тому для завдань 3 і 9 наведено запит строго за умовою (на sql-practice.com він поверне дані)
та додатковий адаптований варіант, що показує роботу тієї ж логіки на локальних даних.

 */


-- ---------------------------------------------------------------------
-- 1. Виведіть список усіх замовлень з ID замовлення, іменем та прізвищем
--    працівника, який його обробив.
-- ---------------------------------------------------------------------

SELECT o.order_id
     , e.first_name
     , e.last_name
FROM orders AS o
JOIN employees AS e
  ON o.employee_id = e.employee_id
ORDER BY o.order_id
;

/* Результат:

 order_id | first_name | last_name 
----------+------------+-----------
    10248 | Steven     | Buchanan
    10249 | Michael    | Suyama
    10250 | Margaret   | Peacock
    10251 | Janet      | Leverling
    10252 | Margaret   | Peacock
    10253 | Janet      | Leverling
    10254 | Steven     | Buchanan
    10255 | Anne       | Dodsworth
    10256 | Janet      | Leverling
    10257 | Margaret   | Peacock
    10258 | Nancy      | Davolio
    10259 | Margaret   | Peacock
   [ ... ]
    11066 | Robert     | King
    11067 | Nancy      | Davolio
    11068 | Laura      | Callahan
    11069 | Nancy      | Davolio
    11070 | Andrew     | Fuller
    11071 | Nancy      | Davolio
    11072 | Margaret   | Peacock
    11073 | Andrew     | Fuller
    11074 | Robert     | King
    11075 | Laura      | Callahan
    11076 | Margaret   | Peacock
    11077 | Nancy      | Davolio
(830 rows)

*/


-- ---------------------------------------------------------------------
-- 2. Виведіть замовлення разом з датою, ID замовлення і назвою компанії клієнта.
--    Відфільтруйте лише замовлення, зроблені в жовтні. Відсортуйте за зростанням дати.
-- ---------------------------------------------------------------------

SELECT o.order_date
     , o.order_id
     , c.company_name
FROM orders AS o
JOIN customers AS c
  ON o.customer_id = c.customer_id
WHERE EXTRACT(MONTH FROM o.order_date) = 10
ORDER BY o.order_date ASC
;

/* Результат:

 order_date | order_id |          company_name          
------------+----------+--------------------------------
 1996-10-01 |    10318 | Island Trading
 1996-10-02 |    10319 | Tortuga Restaurante
 1996-10-03 |    10321 | Island Trading
 1996-10-03 |    10320 | Wartian Herkku
 1996-10-04 |    10322 | Pericles Comidas clásicas
 1996-10-07 |    10323 | Königlich Essen
 1996-10-08 |    10324 | Save-a-lot Markets
 1996-10-09 |    10325 | Königlich Essen
 1996-10-10 |    10326 | Bólido Comidas preparadas
 1996-10-11 |    10327 | Folk och fä HB
 1996-10-14 |    10328 | Furia Bacalhau e Frutos do Mar
 1996-10-15 |    10329 | Split Rail Beer & Ale
   [ ... ]
 1997-10-22 |    10714 | Save-a-lot Markets
 1997-10-23 |    10715 | Bon app'
 1997-10-24 |    10716 | Rancho grande
 1997-10-24 |    10717 | Frankenversand
 1997-10-27 |    10719 | Let's Stop N Shop
 1997-10-27 |    10718 | Königlich Essen
 1997-10-28 |    10720 | Que Delícia
 1997-10-29 |    10721 | QUICK-Stop
 1997-10-29 |    10722 | Save-a-lot Markets
 1997-10-30 |    10724 | Mère Paillarde
 1997-10-30 |    10723 | White Clover Markets
 1997-10-31 |    10725 | Familia Arquibaldo
(64 rows)

*/


-- ---------------------------------------------------------------------
-- 3. Виведіть назви товарів разом з назвою постачальника та його регіоном,
--    але лише для тих постачальників, які знаходяться в регіонах "North America"
--    або "Western Europe". Відсортуйте результат за назвою постачальника
--    у зростаючому порядку.
-- ---------------------------------------------------------------------

-- Варіант 1: строго за умовою (для бази sql-practice.com)

SELECT p.product_name
     , s.company_name AS supplier_name
     , s.region
FROM products AS p
JOIN suppliers AS s
  ON p.supplier_id = s.supplier_id
WHERE s.region IN ('North America', 'Western Europe')
ORDER BY s.company_name ASC
;

/* Результат:

 product_name | supplier_name | region 
--------------+---------------+--------
(0 rows)


У локальній базі suppliers.region містить штати/провінції (OR, MA, Québec ...)
або NULL, тому запит повертає 0 рядків.
*/

-- Варіант 2: адаптація для локальної бази - регіон визначаємо за країною постачальника

SELECT p.product_name
     , s.company_name AS supplier_name
     , s.country
     , CASE
         WHEN s.country IN ('USA', 'Canada')                 THEN 'North America'
         WHEN s.country IN ('France', 'Germany', 'Netherlands') THEN 'Western Europe'
       END AS region
FROM products AS p
JOIN suppliers AS s
  ON p.supplier_id = s.supplier_id
WHERE s.country IN ('USA', 'Canada', 'France', 'Germany', 'Netherlands')
ORDER BY s.company_name ASC
       , p.product_name ASC
;

/* Результат:

           product_name           |             supplier_name              |   country   |     region     
----------------------------------+----------------------------------------+-------------+----------------
 Chartreuse verte                 | Aux joyeux ecclésiastiques             | France      | Western Europe
 Côte de Blaye                    | Aux joyeux ecclésiastiques             | France      | Western Europe
 Laughing Lumberjack Lager        | Bigfoot Breweries                      | USA         | North America
 Sasquatch Ale                    | Bigfoot Breweries                      | USA         | North America
 Steeleye Stout                   | Bigfoot Breweries                      | USA         | North America
 Escargots de Bourgogne           | Escargots Nouveaux                     | France      | Western Europe
 Sirop d'érable                   | Forêts d'érables                       | Canada      | North America
 Tarte au sucre                   | Forêts d'érables                       | Canada      | North America
 Camembert Pierrot                | Gai pâturage                           | France      | Western Europe
 Raclette Courdavault             | Gai pâturage                           | France      | Western Europe
 Grandma's Boysenberry Spread     | Grandma Kelly's Homestead              | USA         | North America
 Northwoods Cranberry Sauce       | Grandma Kelly's Homestead              | USA         | North America
 Uncle Bob's Organic Dried Pears  | Grandma Kelly's Homestead              | USA         | North America
 Gumbär Gummibärchen              | Heli Süßwaren GmbH & Co. KG            | Germany     | Western Europe
 NuNuCa Nuß-Nougat-Creme          | Heli Süßwaren GmbH & Co. KG            | Germany     | Western Europe
 Schoggi Schokolade               | Heli Süßwaren GmbH & Co. KG            | Germany     | Western Europe
 Pâté chinois                     | Ma Maison                              | Canada      | North America
 Tourtière                        | Ma Maison                              | Canada      | North America
 Boston Crab Meat                 | New England Seafood Cannery            | USA         | North America
 Jack's New England Clam Chowder  | New England Seafood Cannery            | USA         | North America
 Chef Anton's Cajun Seasoning     | New Orleans Cajun Delights             | USA         | North America
 Chef Anton's Gumbo Mix           | New Orleans Cajun Delights             | USA         | North America
 Louisiana Fiery Hot Pepper Sauce | New Orleans Cajun Delights             | USA         | North America
 Louisiana Hot Spiced Okra        | New Orleans Cajun Delights             | USA         | North America
 Nord-Ost Matjeshering            | Nord-Ost-Fisch Handelsgesellschaft mbH | Germany     | Western Europe
 Original Frankfurter grüne Soße  | Plutzer Lebensmittelgroßmärkte AG      | Germany     | Western Europe
 Rhönbräu Klosterbier             | Plutzer Lebensmittelgroßmärkte AG      | Germany     | Western Europe
 Rössle Sauerkraut                | Plutzer Lebensmittelgroßmärkte AG      | Germany     | Western Europe
 Thüringer Rostbratwurst          | Plutzer Lebensmittelgroßmärkte AG      | Germany     | Western Europe
 Wimmers gute Semmelknödel        | Plutzer Lebensmittelgroßmärkte AG      | Germany     | Western Europe
 Chocolade                        | Zaanse Snoepfabriek                    | Netherlands | Western Europe
 Zaanse koeken                    | Zaanse Snoepfabriek                    | Netherlands | Western Europe
(32 rows)

*/


-- ---------------------------------------------------------------------
-- 4. Виведіть список товарів, які коли-небудь були замовлені в магазині,
--    та для кожного товару виведіть:
--      - назву товару
--      - кількість замовлень, у яких цей товар зустрічається (n_orders)
--      - загальну кількість одиниць цього товару в усіх замовленнях (sum_quantity)
--    Відсортуйте результат за кількістю замовлень у зростаючому порядку.
-- ---------------------------------------------------------------------

SELECT p.product_name
     , COUNT(DISTINCT od.order_id) AS n_orders
     , SUM(od.quantity)            AS sum_quantity
FROM products AS p
JOIN order_details AS od
  ON p.product_id = od.product_id
GROUP BY p.product_id
       , p.product_name
ORDER BY n_orders ASC
       , p.product_name ASC
;

/* Результат:

           product_name           | n_orders | sum_quantity 
----------------------------------+----------+--------------
 Mishi Kobe Niku                  |        5 |           95
 Chocolade                        |        6 |          138
 Genen Shouyu                     |        6 |          122
 Gravad lax                       |        6 |          125
 Louisiana Hot Spiced Okra        |        8 |          239
 Schoggi Schokolade               |        9 |          365
 Chef Anton's Gumbo Mix           |       10 |          298
 Laughing Lumberjack Lager        |       10 |          184
 Valkoinen suklaa                 |       10 |          235
 Aniseed Syrup                    |       12 |          328
 Grandma's Boysenberry Spread     |       12 |          301
 Longlife Tofu                    |       13 |          297
   [ ... ]
 Boston Crab Meat                 |       41 |         1103
 Flotemysost                      |       42 |         1057
 Pavlova                          |       43 |         1158
 Chang                            |       44 |         1057
 Rhönbräu Klosterbier             |       46 |         1155
 Jack's New England Clam Chowder  |       47 |          981
 Tarte au sucre                   |       48 |         1083
 Gnocchi di nonna Alice           |       50 |         1263
 Camembert Pierrot                |       51 |         1577
 Gorgonzola Telino                |       51 |         1397
 Guaraná Fantástica               |       51 |         1125
 Raclette Courdavault             |       54 |         1496
(77 rows)

*/


-- ---------------------------------------------------------------------
-- 5. Знайдіть кількість замовлень для кожного клієнта. Виведіть назву клієнта,
--    кількість замовлень та відфільтруйте лише тих клієнтів, у кого замовлень більше 7.
-- ---------------------------------------------------------------------

SELECT c.company_name
     , COUNT(o.order_id) AS n_orders
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_id
       , c.company_name
HAVING COUNT(o.order_id) > 7
ORDER BY n_orders DESC
       , c.company_name ASC
;

/* Результат:

          company_name          | n_orders 
--------------------------------+----------
 Save-a-lot Markets             |       31
 Ernst Handel                   |       30
 QUICK-Stop                     |       28
 Folk och fä HB                 |       19
 Hungry Owl All-Night Grocers   |       19
 Berglunds snabbköp             |       18
 HILARION-Abastos               |       18
 Rattlesnake Canyon Grocery     |       18
 Bon app'                       |       17
 Frankenversand                 |       15
 Lehmanns Marktstand            |       15
 Wartian Herkku                 |       15
   [ ... ]
 Richter Supermarkt             |       10
 Tortuga Restaurante            |       10
 Victuailles en stock           |       10
 Gourmet Lanchonetes            |        9
 Que Delícia                    |        9
 Seven Seas Imports             |        9
 Split Rail Beer & Ale          |        9
 Wellington Importadora         |        9
 Chop-suey Chinese              |        8
 Eastern Connection             |        8
 Furia Bacalhau e Frutos do Mar |        8
 Lonesome Pine Restaurant       |        8
(48 rows)

*/


-- ---------------------------------------------------------------------
-- 6. Виведіть імена та прізвища працівників, які працюють у територіях,
--    назва яких починається з "Santa". Використовуйте таблиці employees,
--    employee_territories та territories.
-- ---------------------------------------------------------------------

SELECT e.first_name
     , e.last_name
     , t.territory_description
FROM employees AS e
JOIN employee_territories AS et
  ON e.employee_id = et.employee_id
JOIN territories AS t
  ON et.territory_id = t.territory_id
WHERE t.territory_description LIKE 'Santa%'
ORDER BY e.last_name
       , e.first_name
;

/* Результат:

 first_name | last_name | territory_description 
------------+-----------+-----------------------
 Robert     | King      | Santa Monica
 Robert     | King      | Santa Clara
 Robert     | King      | Santa Cruz
(3 rows)

*/


-- ---------------------------------------------------------------------
-- 7. Виведіть товари з ціною понад 20 за одиницю разом із ціною на одиницю
--    і назвою постачальника.
-- ---------------------------------------------------------------------

SELECT p.product_name
     , p.unit_price
     , s.company_name AS supplier_name
FROM products AS p
JOIN suppliers AS s
  ON p.supplier_id = s.supplier_id
WHERE p.unit_price > 20
ORDER BY p.unit_price DESC
;

/* Результат:

           product_name           | unit_price |             supplier_name              
----------------------------------+------------+----------------------------------------
 Côte de Blaye                    |      263.5 | Aux joyeux ecclésiastiques
 Thüringer Rostbratwurst          |     123.79 | Plutzer Lebensmittelgroßmärkte AG
 Mishi Kobe Niku                  |         97 | Tokyo Traders
 Sir Rodney's Marmalade           |         81 | Specialty Biscuits, Ltd.
 Carnarvon Tigers                 |       62.5 | Pavlova, Ltd.
 Raclette Courdavault             |         55 | Gai pâturage
 Manjimup Dried Apples            |         53 | G'day, Mate
 Tarte au sucre                   |       49.3 | Forêts d'érables
 Ipoh Coffee                      |         46 | Leka Trading
 Rössle Sauerkraut                |       45.6 | Plutzer Lebensmittelgroßmärkte AG
 Schoggi Schokolade               |       43.9 | Heli Süßwaren GmbH & Co. KG
 Vegie-spread                     |       43.9 | Pavlova, Ltd.
 Northwoods Cranberry Sauce       |         40 | Grandma Kelly's Homestead
 Alice Mutton                     |         39 | Pavlova, Ltd.
 Queso Manchego La Pastora        |         38 | Cooperativa de Quesos 'Las Cabras'
 Gnocchi di nonna Alice           |         38 | Pasta Buttini s.r.l.
 Gudbrandsdalsost                 |         36 | Norske Meierier
 Mozzarella di Giovanni           |       34.8 | Formaggi Fortini s.r.l.
 Camembert Pierrot                |         34 | Gai pâturage
 Wimmers gute Semmelknödel        |      33.25 | Plutzer Lebensmittelgroßmärkte AG
 Perth Pasties                    |       32.8 | G'day, Mate
 Mascarpone Fabioli               |         32 | Formaggi Fortini s.r.l.
 Gumbär Gummibärchen              |      31.23 | Heli Süßwaren GmbH & Co. KG
 Ikura                            |         31 | Tokyo Traders
 Uncle Bob's Organic Dried Pears  |         30 | Grandma Kelly's Homestead
 Sirop d'érable                   |       28.5 | Forêts d'érables
 Gravad lax                       |         26 | Svensk Sjöföda AB
 Nord-Ost Matjeshering            |      25.89 | Nord-Ost-Fisch Handelsgesellschaft mbH
 Grandma's Boysenberry Spread     |         25 | Grandma Kelly's Homestead
 Pâté chinois                     |         24 | Ma Maison
 Tofu                             |      23.25 | Mayumi's
 Chef Anton's Cajun Seasoning     |         22 | New Orleans Cajun Delights
 Flotemysost                      |       21.5 | Norske Meierier
 Chef Anton's Gumbo Mix           |      21.35 | New Orleans Cajun Delights
 Louisiana Fiery Hot Pepper Sauce |      21.05 | New Orleans Cajun Delights
 Queso Cabrales                   |         21 | Cooperativa de Quesos 'Las Cabras'
 Gustaf's Knäckebröd              |         21 | PB Knäckebröd AB
(37 rows)

*/


-- ---------------------------------------------------------------------
-- 8. Виведіть категорії, в яких є більше ніж 5 товарів, і вкажіть кількість цих товарів.
-- ---------------------------------------------------------------------

SELECT c.category_name
     , COUNT(p.product_id) AS n_products
FROM categories AS c
JOIN products AS p
  ON c.category_id = p.category_id
GROUP BY c.category_id
       , c.category_name
HAVING COUNT(p.product_id) > 5
ORDER BY n_products DESC
;

/* Результат:

 category_name  | n_products 
----------------+------------
 Confections    |         13
 Condiments     |         12
 Beverages      |         12
 Seafood        |         12
 Dairy Products |         10
 Grains/Cereals |          7
 Meat/Poultry   |          6
(7 rows)

*/


-- ---------------------------------------------------------------------
-- 9. Виведіть імена, прізвища та дату найму працівників, які були найняті у 2013 році,
--    а також імена та прізвища їхніх керівників.
-- ---------------------------------------------------------------------

-- Self-join: таблиця employees зʼєднується сама з собою (e - працівник, m - керівник).
-- LEFT JOIN - щоб не втратити працівника без керівника (reports_to IS NULL).

-- Варіант 1: строго за умовою (для бази sql-practice.com)

SELECT e.first_name
     , e.last_name
     , e.hire_date
     , m.first_name AS manager_first_name
     , m.last_name  AS manager_last_name
FROM employees AS e
LEFT JOIN employees AS m
  ON e.reports_to = m.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 2013
ORDER BY e.hire_date
;

/* Результат:

 first_name | last_name | hire_date | manager_first_name | manager_last_name 
------------+-----------+-----------+--------------------+-------------------
(0 rows)


У локальній базі всіх працівників найнято у 1992-1994 роках, тому 0 рядків.
*/

-- Варіант 2: та сама логіка для 1993 року (локальна база)

SELECT e.first_name
     , e.last_name
     , e.hire_date
     , m.first_name AS manager_first_name
     , m.last_name  AS manager_last_name
FROM employees AS e
LEFT JOIN employees AS m
  ON e.reports_to = m.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 1993
ORDER BY e.hire_date
;

/* Результат:

 first_name | last_name | hire_date  | manager_first_name | manager_last_name 
------------+-----------+------------+--------------------+-------------------
 Margaret   | Peacock   | 1993-05-03 | Andrew             | Fuller
 Steven     | Buchanan  | 1993-10-17 | Andrew             | Fuller
 Michael    | Suyama    | 1993-10-17 | Steven             | Buchanan
(3 rows)

*/
