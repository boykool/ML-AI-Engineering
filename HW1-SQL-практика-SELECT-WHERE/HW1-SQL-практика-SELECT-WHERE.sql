-- Active: 1792342679007@@127.0.0.1@55432@northwind@public
-- Домашнє завдання: SQL-практика - SELECT, WHERE

/*

https://hannapylieva.notion.site/SQL-SELECT-WHERE-1d09483584948088871bcc039a7a63c5

Виконайте ці завдання на платформі sql-practice.com (https://sql-practice.com/),
використовуючи базу Northwind.

Формат здачі:
- Google Doc або Notion-сторінка з завданням, розвʼязком і скріншотами результатів -
  те, що повернула база, так аби чітко було видно, що запит відпрацював коректно.

 */


-- =====================================================================
-- 🔹 Вибірка даних (SELECT)
-- =====================================================================


-- ---------------------------------------------------------------------
-- SELECT 1. Виведіть список усіх назв категорій товарів (таблиця categories).
-- ---------------------------------------------------------------------

SELECT category_name
FROM categories
;

/* Результат:

 category_name  
----------------
 Beverages
 Condiments
 Confections
 Dairy Products
 Grains/Cereals
 Meat/Poultry
 Produce
 Seafood
(8 rows)

*/


-- ---------------------------------------------------------------------
-- SELECT 2. Отримайте імена та прізвища всіх працівників (таблиця employees).
-- ---------------------------------------------------------------------

SELECT first_name
     , last_name
FROM employees
;

/* Результат:

 first_name | last_name 
------------+-----------
 Nancy      | Davolio
 Andrew     | Fuller
 Janet      | Leverling
 Margaret   | Peacock
 Steven     | Buchanan
 Michael    | Suyama
 Robert     | King
 Laura      | Callahan
 Anne       | Dodsworth
(9 rows)

*/


-- ---------------------------------------------------------------------
-- SELECT 3. Покажіть усі поля про товари (таблиця products).
-- ---------------------------------------------------------------------

SELECT *
FROM products
;

/* Результат:

 product_id |           product_name           | supplier_id | category_id |  quantity_per_unit   | unit_price | units_in_stock | units_on_order | reorder_level | discontinued 
------------+----------------------------------+-------------+-------------+----------------------+------------+----------------+----------------+---------------+--------------
          1 | Chai                             |           8 |           1 | 10 boxes x 30 bags   |         18 |             39 |              0 |            10 |            1
          2 | Chang                            |           1 |           1 | 24 - 12 oz bottles   |         19 |             17 |             40 |            25 |            1
          3 | Aniseed Syrup                    |           1 |           2 | 12 - 550 ml bottles  |         10 |             13 |             70 |            25 |            0
          4 | Chef Anton's Cajun Seasoning     |           2 |           2 | 48 - 6 oz jars       |         22 |             53 |              0 |             0 |            0
          5 | Chef Anton's Gumbo Mix           |           2 |           2 | 36 boxes             |      21.35 |              0 |              0 |             0 |            1
          6 | Grandma's Boysenberry Spread     |           3 |           2 | 12 - 8 oz jars       |         25 |            120 |              0 |            25 |            0
          7 | Uncle Bob's Organic Dried Pears  |           3 |           7 | 12 - 1 lb pkgs.      |         30 |             15 |              0 |            10 |            0
          8 | Northwoods Cranberry Sauce       |           3 |           2 | 12 - 12 oz jars      |         40 |              6 |              0 |             0 |            0
          9 | Mishi Kobe Niku                  |           4 |           6 | 18 - 500 g pkgs.     |         97 |             29 |              0 |             0 |            1
         10 | Ikura                            |           4 |           8 | 12 - 200 ml jars     |         31 |             31 |              0 |             0 |            0
         11 | Queso Cabrales                   |           5 |           4 | 1 kg pkg.            |         21 |             22 |             30 |            30 |            0
         12 | Queso Manchego La Pastora        |           5 |           4 | 10 - 500 g pkgs.     |         38 |             86 |              0 |             0 |            0
         13 | Konbu                            |           6 |           8 | 2 kg box             |          6 |             24 |              0 |             5 |            0
         14 | Tofu                             |           6 |           7 | 40 - 100 g pkgs.     |      23.25 |             35 |              0 |             0 |            0
         15 | Genen Shouyu                     |           6 |           2 | 24 - 250 ml bottles  |         13 |             39 |              0 |             5 |            0
         16 | Pavlova                          |           7 |           3 | 32 - 500 g boxes     |      17.45 |             29 |              0 |            10 |            0
         17 | Alice Mutton                     |           7 |           6 | 20 - 1 kg tins       |         39 |              0 |              0 |             0 |            1
         18 | Carnarvon Tigers                 |           7 |           8 | 16 kg pkg.           |       62.5 |             42 |              0 |             0 |            0
         19 | Teatime Chocolate Biscuits       |           8 |           3 | 10 boxes x 12 pieces |        9.2 |             25 |              0 |             5 |            0
         20 | Sir Rodney's Marmalade           |           8 |           3 | 30 gift boxes        |         81 |             40 |              0 |             0 |            0
         21 | Sir Rodney's Scones              |           8 |           3 | 24 pkgs. x 4 pieces  |         10 |              3 |             40 |             5 |            0
         22 | Gustaf's Knäckebröd              |           9 |           5 | 24 - 500 g pkgs.     |         21 |            104 |              0 |            25 |            0
         23 | Tunnbröd                         |           9 |           5 | 12 - 250 g pkgs.     |          9 |             61 |              0 |            25 |            0
         24 | Guaraná Fantástica               |          10 |           1 | 12 - 355 ml cans     |        4.5 |             20 |              0 |             0 |            1
         25 | NuNuCa Nuß-Nougat-Creme          |          11 |           3 | 20 - 450 g glasses   |         14 |             76 |              0 |            30 |            0
         26 | Gumbär Gummibärchen              |          11 |           3 | 100 - 250 g bags     |      31.23 |             15 |              0 |             0 |            0
         27 | Schoggi Schokolade               |          11 |           3 | 100 - 100 g pieces   |       43.9 |             49 |              0 |            30 |            0
         28 | Rössle Sauerkraut                |          12 |           7 | 25 - 825 g cans      |       45.6 |             26 |              0 |             0 |            1
         29 | Thüringer Rostbratwurst          |          12 |           6 | 50 bags x 30 sausgs. |     123.79 |              0 |              0 |             0 |            1
         30 | Nord-Ost Matjeshering            |          13 |           8 | 10 - 200 g glasses   |      25.89 |             10 |              0 |            15 |            0
         31 | Gorgonzola Telino                |          14 |           4 | 12 - 100 g pkgs      |       12.5 |              0 |             70 |            20 |            0
         32 | Mascarpone Fabioli               |          14 |           4 | 24 - 200 g pkgs.     |         32 |              9 |             40 |            25 |            0
         33 | Geitost                          |          15 |           4 | 500 g                |        2.5 |            112 |              0 |            20 |            0
         34 | Sasquatch Ale                    |          16 |           1 | 24 - 12 oz bottles   |         14 |            111 |              0 |            15 |            0
         35 | Steeleye Stout                   |          16 |           1 | 24 - 12 oz bottles   |         18 |             20 |              0 |            15 |            0
         36 | Inlagd Sill                      |          17 |           8 | 24 - 250 g  jars     |         19 |            112 |              0 |            20 |            0
         37 | Gravad lax                       |          17 |           8 | 12 - 500 g pkgs.     |         26 |             11 |             50 |            25 |            0
         38 | Côte de Blaye                    |          18 |           1 | 12 - 75 cl bottles   |      263.5 |             17 |              0 |            15 |            0
         39 | Chartreuse verte                 |          18 |           1 | 750 cc per bottle    |         18 |             69 |              0 |             5 |            0
         40 | Boston Crab Meat                 |          19 |           8 | 24 - 4 oz tins       |       18.4 |            123 |              0 |            30 |            0
         41 | Jack's New England Clam Chowder  |          19 |           8 | 12 - 12 oz cans      |       9.65 |             85 |              0 |            10 |            0
         42 | Singaporean Hokkien Fried Mee    |          20 |           5 | 32 - 1 kg pkgs.      |         14 |             26 |              0 |             0 |            1
         43 | Ipoh Coffee                      |          20 |           1 | 16 - 500 g tins      |         46 |             17 |             10 |            25 |            0
         44 | Gula Malacca                     |          20 |           2 | 20 - 2 kg bags       |      19.45 |             27 |              0 |            15 |            0
         45 | Rogede sild                      |          21 |           8 | 1k pkg.              |        9.5 |              5 |             70 |            15 |            0
         46 | Spegesild                        |          21 |           8 | 4 - 450 g glasses    |         12 |             95 |              0 |             0 |            0
         47 | Zaanse koeken                    |          22 |           3 | 10 - 4 oz boxes      |        9.5 |             36 |              0 |             0 |            0
         48 | Chocolade                        |          22 |           3 | 10 pkgs.             |      12.75 |             15 |             70 |            25 |            0
         49 | Maxilaku                         |          23 |           3 | 24 - 50 g pkgs.      |         20 |             10 |             60 |            15 |            0
         50 | Valkoinen suklaa                 |          23 |           3 | 12 - 100 g bars      |      16.25 |             65 |              0 |            30 |            0
         51 | Manjimup Dried Apples            |          24 |           7 | 50 - 300 g pkgs.     |         53 |             20 |              0 |            10 |            0
         52 | Filo Mix                         |          24 |           5 | 16 - 2 kg boxes      |          7 |             38 |              0 |            25 |            0
         53 | Perth Pasties                    |          24 |           6 | 48 pieces            |       32.8 |              0 |              0 |             0 |            1
         54 | Tourtière                        |          25 |           6 | 16 pies              |       7.45 |             21 |              0 |            10 |            0
         55 | Pâté chinois                     |          25 |           6 | 24 boxes x 2 pies    |         24 |            115 |              0 |            20 |            0
         56 | Gnocchi di nonna Alice           |          26 |           5 | 24 - 250 g pkgs.     |         38 |             21 |             10 |            30 |            0
         57 | Ravioli Angelo                   |          26 |           5 | 24 - 250 g pkgs.     |       19.5 |             36 |              0 |            20 |            0
         58 | Escargots de Bourgogne           |          27 |           8 | 24 pieces            |      13.25 |             62 |              0 |            20 |            0
         59 | Raclette Courdavault             |          28 |           4 | 5 kg pkg.            |         55 |             79 |              0 |             0 |            0
         60 | Camembert Pierrot                |          28 |           4 | 15 - 300 g rounds    |         34 |             19 |              0 |             0 |            0
         61 | Sirop d'érable                   |          29 |           2 | 24 - 500 ml bottles  |       28.5 |            113 |              0 |            25 |            0
         62 | Tarte au sucre                   |          29 |           3 | 48 pies              |       49.3 |             17 |              0 |             0 |            0
         63 | Vegie-spread                     |           7 |           2 | 15 - 625 g jars      |       43.9 |             24 |              0 |             5 |            0
         64 | Wimmers gute Semmelknödel        |          12 |           5 | 20 bags x 4 pieces   |      33.25 |             22 |             80 |            30 |            0
         65 | Louisiana Fiery Hot Pepper Sauce |           2 |           2 | 32 - 8 oz bottles    |      21.05 |             76 |              0 |             0 |            0
         66 | Louisiana Hot Spiced Okra        |           2 |           2 | 24 - 8 oz jars       |         17 |              4 |            100 |            20 |            0
         67 | Laughing Lumberjack Lager        |          16 |           1 | 24 - 12 oz bottles   |         14 |             52 |              0 |            10 |            0
         68 | Scottish Longbreads              |           8 |           3 | 10 boxes x 8 pieces  |       12.5 |              6 |             10 |            15 |            0
         69 | Gudbrandsdalsost                 |          15 |           4 | 10 kg pkg.           |         36 |             26 |              0 |            15 |            0
         70 | Outback Lager                    |           7 |           1 | 24 - 355 ml bottles  |         15 |             15 |             10 |            30 |            0
         71 | Flotemysost                      |          15 |           4 | 10 - 500 g pkgs.     |       21.5 |             26 |              0 |             0 |            0
         72 | Mozzarella di Giovanni           |          14 |           4 | 24 - 200 g pkgs.     |       34.8 |             14 |              0 |             0 |            0
         73 | Röd Kaviar                       |          17 |           8 | 24 - 150 g jars      |         15 |            101 |              0 |             5 |            0
         74 | Longlife Tofu                    |           4 |           7 | 5 kg pkg.            |         10 |              4 |             20 |             5 |            0
         75 | Rhönbräu Klosterbier             |          12 |           1 | 24 - 0.5 l bottles   |       7.75 |            125 |              0 |            25 |            0
         76 | Lakkalikööri                     |          23 |           1 | 500 ml               |         18 |             57 |              0 |            20 |            0
         77 | Original Frankfurter grüne Soße  |          12 |           2 | 12 boxes             |         13 |             32 |              0 |            15 |            0
(77 rows)

*/


-- ---------------------------------------------------------------------
-- SELECT 4. Виведіть назву компанії та місто всіх клієнтів (таблиця customers).
-- ---------------------------------------------------------------------

SELECT company_name
     , city
FROM customers
;

/* Результат:

             company_name             |      city       
--------------------------------------+-----------------
 Alfreds Futterkiste                  | Berlin
 Ana Trujillo Emparedados y helados   | México D.F.
 Antonio Moreno Taquería              | México D.F.
 Around the Horn                      | London
 Berglunds snabbköp                   | Luleå
 Blauer See Delikatessen              | Mannheim
 Blondesddsl père et fils             | Strasbourg
 Bólido Comidas preparadas            | Madrid
 Bon app'                             | Marseille
 Bottom-Dollar Markets                | Tsawassen
 B's Beverages                        | London
 Cactus Comidas para llevar           | Buenos Aires
 Centro comercial Moctezuma           | México D.F.
 Chop-suey Chinese                    | Bern
 Comércio Mineiro                     | Sao Paulo
 Consolidated Holdings                | London
 Drachenblut Delikatessen             | Aachen
 Du monde entier                      | Nantes
 Eastern Connection                   | London
 Ernst Handel                         | Graz
 Familia Arquibaldo                   | Sao Paulo
 FISSA Fabrica Inter. Salchichas S.A. | Madrid
 Folies gourmandes                    | Lille
 Folk och fä HB                       | Bräcke
 Frankenversand                       | München
 France restauration                  | Nantes
 Franchi S.p.A.                       | Torino
 Furia Bacalhau e Frutos do Mar       | Lisboa
 Galería del gastrónomo               | Barcelona
 Godos Cocina Típica                  | Sevilla
 Gourmet Lanchonetes                  | Campinas
 Great Lakes Food Market              | Eugene
 GROSELLA-Restaurante                 | Caracas
 Hanari Carnes                        | Rio de Janeiro
 HILARION-Abastos                     | San Cristóbal
 Hungry Coyote Import Store           | Elgin
 Hungry Owl All-Night Grocers         | Cork
 Island Trading                       | Cowes
 Königlich Essen                      | Brandenburg
 La corne d'abondance                 | Versailles
 La maison d'Asie                     | Toulouse
 Laughing Bacchus Wine Cellars        | Vancouver
 Lazy K Kountry Store                 | Walla Walla
 Lehmanns Marktstand                  | Frankfurt a.M.
 Let's Stop N Shop                    | San Francisco
 LILA-Supermercado                    | Barquisimeto
 LINO-Delicateses                     | I. de Margarita
 Lonesome Pine Restaurant             | Portland
 Magazzini Alimentari Riuniti         | Bergamo
 Maison Dewey                         | Bruxelles
 Mère Paillarde                       | Montréal
 Morgenstern Gesundkost               | Leipzig
 North/South                          | London
 Océano Atlántico Ltda.               | Buenos Aires
 Old World Delicatessen               | Anchorage
 Ottilies Käseladen                   | Köln
 Paris spécialités                    | Paris
 Pericles Comidas clásicas            | México D.F.
 Piccolo und mehr                     | Salzburg
 Princesa Isabel Vinhos               | Lisboa
 Que Delícia                          | Rio de Janeiro
 Queen Cozinha                        | Sao Paulo
 QUICK-Stop                           | Cunewalde
 Rancho grande                        | Buenos Aires
 Rattlesnake Canyon Grocery           | Albuquerque
 Reggiani Caseifici                   | Reggio Emilia
 Ricardo Adocicados                   | Rio de Janeiro
 Richter Supermarkt                   | Genève
 Romero y tomillo                     | Madrid
 Santé Gourmet                        | Stavern
 Save-a-lot Markets                   | Boise
 Seven Seas Imports                   | London
 Simons bistro                        | Kobenhavn
 Spécialités du monde                 | Paris
 Split Rail Beer & Ale                | Lander
 Suprêmes délices                     | Charleroi
 The Big Cheese                       | Portland
 The Cracker Box                      | Butte
 Toms Spezialitäten                   | Münster
 Tortuga Restaurante                  | México D.F.
 Tradição Hipermercados               | Sao Paulo
 Trail's Head Gourmet Provisioners    | Kirkland
 Vaffeljernet                         | Århus
 Victuailles en stock                 | Lyon
 Vins et alcools Chevalier            | Reims
 Die Wandernde Kuh                    | Stuttgart
 Wartian Herkku                       | Oulu
 Wellington Importadora               | Resende
 White Clover Markets                 | Seattle
 Wilman Kala                          | Helsinki
 Wolski  Zajazd                       | Warszawa
(91 rows)

*/


-- =====================================================================
-- 🔹 Фільтрація результатів (WHERE)
-- =====================================================================


-- ---------------------------------------------------------------------
-- WHERE 1. Виведіть усі товари, що коштують понад 33 за одиницю.
-- ---------------------------------------------------------------------

SELECT product_name
     , unit_price
FROM products
WHERE unit_price > 33
ORDER BY unit_price DESC
;

/* Результат:

        product_name        | unit_price 
----------------------------+------------
 Côte de Blaye              |      263.5
 Thüringer Rostbratwurst    |     123.79
 Mishi Kobe Niku            |         97
 Sir Rodney's Marmalade     |         81
 Carnarvon Tigers           |       62.5
 Raclette Courdavault       |         55
 Manjimup Dried Apples      |         53
 Tarte au sucre             |       49.3
 Ipoh Coffee                |         46
 Rössle Sauerkraut          |       45.6
 Schoggi Schokolade         |       43.9
 Vegie-spread               |       43.9
 Northwoods Cranberry Sauce |         40
 Alice Mutton               |         39
 Queso Manchego La Pastora  |         38
 Gnocchi di nonna Alice     |         38
 Gudbrandsdalsost           |         36
 Mozzarella di Giovanni     |       34.8
 Camembert Pierrot          |         34
 Wimmers gute Semmelknödel  |      33.25
(20 rows)

*/


-- ---------------------------------------------------------------------
-- WHERE 2. Знайдіть усіх клієнтів з країн Germany та Spain.
-- ---------------------------------------------------------------------

SELECT company_name
     , city
     , country
FROM customers
WHERE country IN ('Germany', 'Spain')
ORDER BY country
;

/* Результат:

             company_name             |      city      | country 
--------------------------------------+----------------+---------
 Die Wandernde Kuh                    | Stuttgart      | Germany
 Blauer See Delikatessen              | Mannheim       | Germany
 Morgenstern Gesundkost               | Leipzig        | Germany
 Ottilies Käseladen                   | Köln           | Germany
 QUICK-Stop                           | Cunewalde      | Germany
 Toms Spezialitäten                   | Münster        | Germany
 Alfreds Futterkiste                  | Berlin         | Germany
 Drachenblut Delikatessen             | Aachen         | Germany
 Frankenversand                       | München        | Germany
 Königlich Essen                      | Brandenburg    | Germany
 Lehmanns Marktstand                  | Frankfurt a.M. | Germany
 Bólido Comidas preparadas            | Madrid         | Spain
 Godos Cocina Típica                  | Sevilla        | Spain
 FISSA Fabrica Inter. Salchichas S.A. | Madrid         | Spain
 Romero y tomillo                     | Madrid         | Spain
 Galería del gastrónomo               | Barcelona      | Spain
(16 rows)

*/


-- ---------------------------------------------------------------------
-- WHERE 3. Покажіть товари, які не зняті з продажу (discontinued = 0)
--          і мають залишок на складі понад 10.
-- ---------------------------------------------------------------------

SELECT product_name
     , units_in_stock
     , discontinued
FROM products
WHERE discontinued = 0
  AND units_in_stock > 10
;

/* Результат:

           product_name           | units_in_stock | discontinued 
----------------------------------+----------------+--------------
 Aniseed Syrup                    |             13 |            0
 Chef Anton's Cajun Seasoning     |             53 |            0
 Grandma's Boysenberry Spread     |            120 |            0
 Uncle Bob's Organic Dried Pears  |             15 |            0
 Ikura                            |             31 |            0
 Queso Cabrales                   |             22 |            0
 Queso Manchego La Pastora        |             86 |            0
 Konbu                            |             24 |            0
 Tofu                             |             35 |            0
 Genen Shouyu                     |             39 |            0
 Pavlova                          |             29 |            0
 Carnarvon Tigers                 |             42 |            0
 Teatime Chocolate Biscuits       |             25 |            0
 Sir Rodney's Marmalade           |             40 |            0
 Gustaf's Knäckebröd              |            104 |            0
 Tunnbröd                         |             61 |            0
 NuNuCa Nuß-Nougat-Creme          |             76 |            0
 Gumbär Gummibärchen              |             15 |            0
 Schoggi Schokolade               |             49 |            0
 Geitost                          |            112 |            0
 Sasquatch Ale                    |            111 |            0
 Steeleye Stout                   |             20 |            0
 Inlagd Sill                      |            112 |            0
 Gravad lax                       |             11 |            0
 Côte de Blaye                    |             17 |            0
 Chartreuse verte                 |             69 |            0
 Boston Crab Meat                 |            123 |            0
 Jack's New England Clam Chowder  |             85 |            0
 Ipoh Coffee                      |             17 |            0
 Gula Malacca                     |             27 |            0
 Spegesild                        |             95 |            0
 Zaanse koeken                    |             36 |            0
 Chocolade                        |             15 |            0
 Valkoinen suklaa                 |             65 |            0
 Manjimup Dried Apples            |             20 |            0
 Filo Mix                         |             38 |            0
 Tourtière                        |             21 |            0
 Pâté chinois                     |            115 |            0
 Gnocchi di nonna Alice           |             21 |            0
 Ravioli Angelo                   |             36 |            0
 Escargots de Bourgogne           |             62 |            0
 Raclette Courdavault             |             79 |            0
 Camembert Pierrot                |             19 |            0
 Sirop d'érable                   |            113 |            0
 Tarte au sucre                   |             17 |            0
 Vegie-spread                     |             24 |            0
 Wimmers gute Semmelknödel        |             22 |            0
 Louisiana Fiery Hot Pepper Sauce |             76 |            0
 Laughing Lumberjack Lager        |             52 |            0
 Gudbrandsdalsost                 |             26 |            0
 Outback Lager                    |             15 |            0
 Flotemysost                      |             26 |            0
 Mozzarella di Giovanni           |             14 |            0
 Röd Kaviar                       |            101 |            0
 Rhönbräu Klosterbier             |            125 |            0
 Lakkalikööri                     |             57 |            0
 Original Frankfurter grüne Soße  |             32 |            0
(57 rows)

*/


-- ---------------------------------------------------------------------
-- WHERE 4. Знайдіть працівників, не з США.
-- ---------------------------------------------------------------------

SELECT first_name
     , last_name
     , country
FROM employees
WHERE country <> 'USA'
;

/* Результат:

 first_name | last_name | country 
------------+-----------+---------
 Steven     | Buchanan  | UK
 Michael    | Suyama    | UK
 Robert     | King      | UK
 Anne       | Dodsworth | UK
(4 rows)

*/


-- ---------------------------------------------------------------------
-- WHERE 5. Виведіть усіх клієнтів, у яких значення поля region не задане (IS NULL).
-- ---------------------------------------------------------------------

SELECT company_name
     , city
     , country
     , region
FROM customers
WHERE region IS NULL
;

/* Результат:

             company_name             |      city      |   country   | region 
--------------------------------------+----------------+-------------+--------
 Alfreds Futterkiste                  | Berlin         | Germany     | [NULL]
 Ana Trujillo Emparedados y helados   | México D.F.    | Mexico      | [NULL]
 Antonio Moreno Taquería              | México D.F.    | Mexico      | [NULL]
 Around the Horn                      | London         | UK          | [NULL]
 Berglunds snabbköp                   | Luleå          | Sweden      | [NULL]
 Blauer See Delikatessen              | Mannheim       | Germany     | [NULL]
 Blondesddsl père et fils             | Strasbourg     | France      | [NULL]
 Bólido Comidas preparadas            | Madrid         | Spain       | [NULL]
 Bon app'                             | Marseille      | France      | [NULL]
 B's Beverages                        | London         | UK          | [NULL]
 Cactus Comidas para llevar           | Buenos Aires   | Argentina   | [NULL]
 Centro comercial Moctezuma           | México D.F.    | Mexico      | [NULL]
 Chop-suey Chinese                    | Bern           | Switzerland | [NULL]
 Consolidated Holdings                | London         | UK          | [NULL]
 Drachenblut Delikatessen             | Aachen         | Germany     | [NULL]
 Du monde entier                      | Nantes         | France      | [NULL]
 Eastern Connection                   | London         | UK          | [NULL]
 Ernst Handel                         | Graz           | Austria     | [NULL]
 FISSA Fabrica Inter. Salchichas S.A. | Madrid         | Spain       | [NULL]
 Folies gourmandes                    | Lille          | France      | [NULL]
 Folk och fä HB                       | Bräcke         | Sweden      | [NULL]
 Frankenversand                       | München        | Germany     | [NULL]
 France restauration                  | Nantes         | France      | [NULL]
 Franchi S.p.A.                       | Torino         | Italy       | [NULL]
 Furia Bacalhau e Frutos do Mar       | Lisboa         | Portugal    | [NULL]
 Galería del gastrónomo               | Barcelona      | Spain       | [NULL]
 Godos Cocina Típica                  | Sevilla        | Spain       | [NULL]
 Königlich Essen                      | Brandenburg    | Germany     | [NULL]
 La corne d'abondance                 | Versailles     | France      | [NULL]
 La maison d'Asie                     | Toulouse       | France      | [NULL]
 Lehmanns Marktstand                  | Frankfurt a.M. | Germany     | [NULL]
 Magazzini Alimentari Riuniti         | Bergamo        | Italy       | [NULL]
 Maison Dewey                         | Bruxelles      | Belgium     | [NULL]
 Morgenstern Gesundkost               | Leipzig        | Germany     | [NULL]
 North/South                          | London         | UK          | [NULL]
 Océano Atlántico Ltda.               | Buenos Aires   | Argentina   | [NULL]
 Ottilies Käseladen                   | Köln           | Germany     | [NULL]
 Paris spécialités                    | Paris          | France      | [NULL]
 Pericles Comidas clásicas            | México D.F.    | Mexico      | [NULL]
 Piccolo und mehr                     | Salzburg       | Austria     | [NULL]
 Princesa Isabel Vinhos               | Lisboa         | Portugal    | [NULL]
 QUICK-Stop                           | Cunewalde      | Germany     | [NULL]
 Rancho grande                        | Buenos Aires   | Argentina   | [NULL]
 Reggiani Caseifici                   | Reggio Emilia  | Italy       | [NULL]
 Richter Supermarkt                   | Genève         | Switzerland | [NULL]
 Romero y tomillo                     | Madrid         | Spain       | [NULL]
 Santé Gourmet                        | Stavern        | Norway      | [NULL]
 Seven Seas Imports                   | London         | UK          | [NULL]
 Simons bistro                        | Kobenhavn      | Denmark     | [NULL]
 Spécialités du monde                 | Paris          | France      | [NULL]
 Suprêmes délices                     | Charleroi      | Belgium     | [NULL]
 Toms Spezialitäten                   | Münster        | Germany     | [NULL]
 Tortuga Restaurante                  | México D.F.    | Mexico      | [NULL]
 Vaffeljernet                         | Århus          | Denmark     | [NULL]
 Victuailles en stock                 | Lyon           | France      | [NULL]
 Vins et alcools Chevalier            | Reims          | France      | [NULL]
 Die Wandernde Kuh                    | Stuttgart      | Germany     | [NULL]
 Wartian Herkku                       | Oulu           | Finland     | [NULL]
 Wilman Kala                          | Helsinki       | Finland     | [NULL]
 Wolski  Zajazd                       | Warszawa       | Poland      | [NULL]
(60 rows)

*/


-- ---------------------------------------------------------------------
-- WHERE 6. Знайдіть товари, ціна яких між 20 і 50 включно.
-- ---------------------------------------------------------------------

SELECT product_name
     , unit_price
FROM products
WHERE unit_price BETWEEN 20 AND 50
ORDER BY unit_price
;

/* Результат:

           product_name           | unit_price 
----------------------------------+------------
 Maxilaku                         |         20
 Gustaf's Knäckebröd              |         21
 Queso Cabrales                   |         21
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
 Queso Manchego La Pastora        |         38
 Gnocchi di nonna Alice           |         38
 Alice Mutton                     |         39
 Northwoods Cranberry Sauce       |         40
 Vegie-spread                     |       43.9
 Schoggi Schokolade               |       43.9
 Rössle Sauerkraut                |       45.6
 Ipoh Coffee                      |         46
 Tarte au sucre                   |       49.3
(31 rows)

*/


-- ---------------------------------------------------------------------
-- WHERE 7. Отримайте список клієнтів, імена контактів яких починаються на "С".
--          (у базі імена латиницею, тому в запиті латинська 'C')
-- ---------------------------------------------------------------------

SELECT company_name
     , contact_name
FROM customers
WHERE contact_name LIKE 'C%'
ORDER BY contact_name
;

/* Результат:

    company_name     |    contact_name    
---------------------+--------------------
 France restauration | Carine Schmitt
 LILA-Supermercado   | Carlos González
 HILARION-Abastos    | Carlos Hernández
 Maison Dewey        | Catherine Dewey
 Berglunds snabbköp  | Christina Berglund
(5 rows)

*/

