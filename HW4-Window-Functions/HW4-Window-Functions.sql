-- Active: 1794041397183@@127.0.0.1@3306
-- ДЗ SQL: Використання Window Functions

/*

https://hannapylieva.notion.site/SQL-Window-Functions-1749483584948008b4e2e18fd054c1f7

В цьому ДЗ будемо працювати на сайті https://www.sql-practice.com/ з базою northwind.db.
Для цього перед початком роботи необхідно обрати цю базу.

Запити виконано на локальній копії northwind.db з sql-practice.com (SQLite 3.49),
див. northwind-db/README.md.

 */


-- ---------------------------------------------------------------------
-- 1. Визначення попереднього замовлення для кожного клієнта
--
--    Для кожного клієнта (customer_id) знайдіть попереднє замовлення (order_id)
--    на основі дати замовлення (order_date). Відобразіть:
--      - customer_id
--      - order_id
--      - order_date
--      - previous_order_id (за допомогою LAG)
--
--    Підказка: тут треба використати LAG та PARTITION BY.
-- ---------------------------------------------------------------------

SELECT customer_id
     , order_id
     , order_date
     , LAG(order_id) OVER (PARTITION BY customer_id ORDER BY order_date, order_id) AS previous_order_id
FROM orders
ORDER BY customer_id
       , order_date
       , order_id
;

/* Результат:

 customer_id | order_id | order_date | previous_order_id
-------------+----------+------------+-------------------
 ALFKI       |    10643 | 2017-08-25 |              NULL
 ALFKI       |    10692 | 2017-10-03 |             10643
 ALFKI       |    10702 | 2017-10-13 |             10692
 ALFKI       |    10835 | 2018-01-15 |             10702
 ALFKI       |    10952 | 2018-03-16 |             10835
 ALFKI       |    11011 | 2018-04-09 |             10952
 ANATR       |    10308 | 2016-09-18 |              NULL
 ANATR       |    10625 | 2017-08-08 |             10308
 ANATR       |    10759 | 2017-11-28 |             10625
 ANATR       |    10926 | 2018-03-04 |             10759
 ANTON       |    10365 | 2016-11-27 |              NULL
 ANTON       |    10507 | 2017-04-15 |             10365
   [ ... ]
 WILMK       |    10695 | 2017-10-07 |             10673
 WILMK       |    10873 | 2018-02-06 |             10695
 WILMK       |    10879 | 2018-02-10 |             10873
 WILMK       |    10910 | 2018-02-26 |             10879
 WILMK       |    11005 | 2018-04-07 |             10910
 WOLZA       |    10374 | 2016-12-05 |              NULL
 WOLZA       |    10611 | 2017-07-25 |             10374
 WOLZA       |    10792 | 2017-12-23 |             10611
 WOLZA       |    10870 | 2018-02-04 |             10792
 WOLZA       |    10906 | 2018-02-25 |             10870
 WOLZA       |    10998 | 2018-04-03 |             10906
 WOLZA       |    11044 | 2018-04-23 |             10998
(830 rows)

*/

-- Для першого замовлення кожного клієнта previous_order_id = NULL (попереднього немає).


-- ---------------------------------------------------------------------
-- 2. Перше замовлення кожного клієнта
--
--    Для кожного клієнта (customer_id) знайдіть перше замовлення (order_id)
--    на основі дати замовлення (order_date). Відобразіть:
--      - customer_id
--      - order_id
--      - order_date
--      - first_order_id
--
--    Підказка: тут треба використати FIRST_VALUE та PARTITION BY.
-- ---------------------------------------------------------------------

SELECT customer_id
     , order_id
     , order_date
     , FIRST_VALUE(order_id) OVER (PARTITION BY customer_id ORDER BY order_date, order_id) AS first_order_id
FROM orders
ORDER BY customer_id
       , order_date
       , order_id
;

/* Результат:

 customer_id | order_id | order_date | first_order_id
-------------+----------+------------+----------------
 ALFKI       |    10643 | 2017-08-25 |          10643
 ALFKI       |    10692 | 2017-10-03 |          10643
 ALFKI       |    10702 | 2017-10-13 |          10643
 ALFKI       |    10835 | 2018-01-15 |          10643
 ALFKI       |    10952 | 2018-03-16 |          10643
 ALFKI       |    11011 | 2018-04-09 |          10643
 ANATR       |    10308 | 2016-09-18 |          10308
 ANATR       |    10625 | 2017-08-08 |          10308
 ANATR       |    10759 | 2017-11-28 |          10308
 ANATR       |    10926 | 2018-03-04 |          10308
 ANTON       |    10365 | 2016-11-27 |          10365
 ANTON       |    10507 | 2017-04-15 |          10365
   [ ... ]
 WILMK       |    10695 | 2017-10-07 |          10615
 WILMK       |    10873 | 2018-02-06 |          10615
 WILMK       |    10879 | 2018-02-10 |          10615
 WILMK       |    10910 | 2018-02-26 |          10615
 WILMK       |    11005 | 2018-04-07 |          10615
 WOLZA       |    10374 | 2016-12-05 |          10374
 WOLZA       |    10611 | 2017-07-25 |          10374
 WOLZA       |    10792 | 2017-12-23 |          10374
 WOLZA       |    10870 | 2018-02-04 |          10374
 WOLZA       |    10906 | 2018-02-25 |          10374
 WOLZA       |    10998 | 2018-04-03 |          10374
 WOLZA       |    11044 | 2018-04-23 |          10374
(830 rows)

*/


-- ---------------------------------------------------------------------
-- 3. ТОП-3 найдорожчі замовлення у кожній категорії товарів
--
--    Знайдіть три найдорожчі товари (unit_price) у кожній категорії (category_id).
--    Відобразіть:
--      - category_id
--      - category_name - назва категорії
--      - product_id
--      - product_name
--      - unit_price
--      - product_rank - тобто яке місце по дороговизні посідає цей товар з ТОП3 обраних.
--
--    Підказка: тут треба використати RANK та PARTITION BY і ще зробити JOIN.
-- ---------------------------------------------------------------------

WITH ranked_products AS (SELECT c.category_id
                              , c.category_name
                              , p.product_id
                              , p.product_name
                              , p.unit_price
                              , RANK() OVER (PARTITION BY c.category_id ORDER BY p.unit_price DESC) AS product_rank
                         FROM products AS p
                         JOIN categories AS c
                           ON p.category_id = c.category_id)
SELECT category_id
     , category_name
     , product_id
     , product_name
     , unit_price
     , product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY category_id
       , product_rank
       , product_id
;

/* Результат:

 category_id | category_name  | product_id |           product_name          | unit_price | product_rank
-------------+----------------+------------+---------------------------------+------------+--------------
           1 | Beverages      |         38 | Côte de Blaye                   |      263.5 |            1
           1 | Beverages      |         43 | Ipoh Coffee                     |         46 |            2
           1 | Beverages      |          2 | Chang                           |         19 |            3
           2 | Condiments     |         63 | Vegie-spread                    |       43.9 |            1
           2 | Condiments     |          8 | Northwoods Cranberry Sauce      |         40 |            2
           2 | Condiments     |         61 | Sirop d'érable                  |       28.5 |            3
           3 | Confections    |         20 | Sir Rodney's Marmalade          |         81 |            1
           3 | Confections    |         62 | Tarte au sucre                  |       49.3 |            2
           3 | Confections    |         27 | Schoggi Schokolade              |       43.9 |            3
           4 | Dairy Products |         59 | Raclette Courdavault            |         55 |            1
           4 | Dairy Products |         12 | Queso Manchego La Pastora       |         38 |            2
           4 | Dairy Products |         69 | Gudbrandsdalsost                |         36 |            3
           5 | Grains/Cereals |         56 | Gnocchi di nonna Alice          |         38 |            1
           5 | Grains/Cereals |         64 | Wimmers gute Semmelknödel       |      33.25 |            2
           5 | Grains/Cereals |         22 | Gustaf's Knäckebröd             |         21 |            3
           6 | Meat/Poultry   |         29 | Thüringer Rostbratwurst         |     123.79 |            1
           6 | Meat/Poultry   |          9 | Mishi Kobe Niku                 |         97 |            2
           6 | Meat/Poultry   |         17 | Alice Mutton                    |         39 |            3
           7 | Produce        |         51 | Manjimup Dried Apples           |         53 |            1
           7 | Produce        |         28 | Rössle Sauerkraut               |       45.6 |            2
           7 | Produce        |          7 | Uncle Bob's Organic Dried Pears |         30 |            3
           8 | Seafood        |         18 | Carnarvon Tigers                |       62.5 |            1
           8 | Seafood        |         10 | Ikura                           |         31 |            2
           8 | Seafood        |         37 | Gravad lax                      |         26 |            3
(24 rows)

*/


-- ---------------------------------------------------------------------
-- 4. З яким проміжком часу користувачі роблять замовлення.
--
--    Покажіть різницю між датами поточного та попереднього замовлення
--    для кожного клієнта. Відобразіть:
--      - customer_id
--      - order_id
--      - order_date
--      - previous_order_date
--      - diff_days - різниця у днях між датами поточного і попереднього
--                    замовлень цього клієнта
--
--    Підказка: тут треба використати LAG та PARTITION BY.
--    Аби обчислити різницю в днях для SQLite використовуємо конструкцію
--    JULIANDAY(later_date) - JULIANDAY(earlier_date)
-- ---------------------------------------------------------------------

WITH orders_with_prev AS (SELECT customer_id
                               , order_id
                               , order_date
                               , LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date, order_id) AS previous_order_date
                          FROM orders)
SELECT customer_id
     , order_id
     , order_date
     , previous_order_date
     , CAST(JULIANDAY(order_date) - JULIANDAY(previous_order_date) AS INTEGER) AS diff_days
FROM orders_with_prev
ORDER BY customer_id
       , order_date
       , order_id
;

/* Результат:

 customer_id | order_id | order_date | previous_order_date | diff_days
-------------+----------+------------+---------------------+-----------
 ALFKI       |    10643 | 2017-08-25 | NULL                |      NULL
 ALFKI       |    10692 | 2017-10-03 | 2017-08-25          |        39
 ALFKI       |    10702 | 2017-10-13 | 2017-10-03          |        10
 ALFKI       |    10835 | 2018-01-15 | 2017-10-13          |        94
 ALFKI       |    10952 | 2018-03-16 | 2018-01-15          |        60
 ALFKI       |    11011 | 2018-04-09 | 2018-03-16          |        24
 ANATR       |    10308 | 2016-09-18 | NULL                |      NULL
 ANATR       |    10625 | 2017-08-08 | 2016-09-18          |       324
 ANATR       |    10759 | 2017-11-28 | 2017-08-08          |       112
 ANATR       |    10926 | 2018-03-04 | 2017-11-28          |        96
 ANTON       |    10365 | 2016-11-27 | NULL                |      NULL
 ANTON       |    10507 | 2017-04-15 | 2016-11-27          |       139
   [ ... ]
 WILMK       |    10695 | 2017-10-07 | 2017-09-18          |        19
 WILMK       |    10873 | 2018-02-06 | 2017-10-07          |       122
 WILMK       |    10879 | 2018-02-10 | 2018-02-06          |         4
 WILMK       |    10910 | 2018-02-26 | 2018-02-10          |        16
 WILMK       |    11005 | 2018-04-07 | 2018-02-26          |        40
 WOLZA       |    10374 | 2016-12-05 | NULL                |      NULL
 WOLZA       |    10611 | 2017-07-25 | 2016-12-05          |       232
 WOLZA       |    10792 | 2017-12-23 | 2017-07-25          |       151
 WOLZA       |    10870 | 2018-02-04 | 2017-12-23          |        43
 WOLZA       |    10906 | 2018-02-25 | 2018-02-04          |        21
 WOLZA       |    10998 | 2018-04-03 | 2018-02-25          |        37
 WOLZA       |    11044 | 2018-04-23 | 2018-04-03          |        20
(830 rows)

*/


-- ---------------------------------------------------------------------
-- 5. Середній інтервал в днях між датами замовлень клієнтів по регіонам.
--
--    Для кожного регіона (region) обчисліть середній інтервал (у днях) між
--    послідовними замовленнями клієнтів (тобто обчислення в розрізі клієнта).
--    Виведіть дані, округлені до двох знаків після коми.
--
--    Очікувані результати:
--      - region        – регіон клієнта.
--      - avg_diff_days – середній інтервал у днях між замовленнями клієнтів
--                        у цьому регіоні.
--
--    Дайте відповіді на питання:
--      - В якому регіоні найчастіше клієнти роблять повторні замовлення,
--        а в якому - найрідше?
--      - Чи є дані, які б допомогли вам зробити коректні висновки для цього аналізу?
--
--    Підказка: це завдання - ускладнення попереднього. Треба додати один зовнішній запит.
-- ---------------------------------------------------------------------

WITH order_diffs AS (SELECT o.customer_id
                          , c.region
                          , JULIANDAY(o.order_date)
                            - JULIANDAY(LAG(o.order_date) OVER (PARTITION BY o.customer_id ORDER BY o.order_date, o.order_id)) AS diff_days
                     FROM orders AS o
                     JOIN customers AS c
                       ON o.customer_id = c.customer_id)
SELECT region
     , ROUND(AVG(diff_days), 2) AS avg_diff_days
FROM order_diffs
GROUP BY region
ORDER BY avg_diff_days
;

/* Результат:

      region     | avg_diff_days
-----------------+---------------
 Northern Europe |         44.22
 North America   |         49.21
 Western Europe  |         53.96
 Scandinavia     |         54.28
 British Isles   |         58.45
 South America   |         65.28
 Eastern Europe  |          84.0
 Southern Europe |         89.07
 Central America |         94.39
(9 rows)

*/

-- Додатково: скільки клієнтів, замовлень та інтервалів стоїть за кожним середнім.

WITH order_diffs AS (SELECT o.customer_id
                          , c.region
                          , JULIANDAY(o.order_date)
                            - JULIANDAY(LAG(o.order_date) OVER (PARTITION BY o.customer_id ORDER BY o.order_date, o.order_id)) AS diff_days
                     FROM orders AS o
                     JOIN customers AS c
                       ON o.customer_id = c.customer_id)
SELECT region
     , COUNT(DISTINCT customer_id) AS customers_cnt
     , COUNT(*) AS orders_cnt
     , COUNT(diff_days) AS intervals_cnt
     , ROUND(AVG(diff_days), 2) AS avg_diff_days
     , MIN(diff_days) AS min_diff_days
     , MAX(diff_days) AS max_diff_days
FROM order_diffs
GROUP BY region
ORDER BY avg_diff_days
;

/* Результат:

      region     | customers_cnt | orders_cnt | intervals_cnt | avg_diff_days | min_diff_days | max_diff_days
-----------------+---------------+------------+---------------+---------------+---------------+---------------
 Northern Europe |             4 |         55 |            51 |         44.22 |           1.0 |         138.0
 North America   |            16 |        152 |           136 |         49.21 |           0.0 |         392.0
 Western Europe  |            27 |        276 |           249 |         53.96 |           0.0 |         435.0
 Scandinavia     |             3 |         28 |            25 |         54.28 |           3.0 |         147.0
 British Isles   |             8 |         75 |            67 |         58.45 |           1.0 |         326.0
 South America   |            16 |        145 |           129 |         65.28 |           0.0 |         506.0
 Eastern Europe  |             1 |          7 |             6 |          84.0 |          20.0 |         232.0
 Southern Europe |             9 |         64 |            55 |         89.07 |           1.0 |         532.0
 Central America |             5 |         28 |            23 |         94.39 |           3.0 |         357.0
(9 rows)

*/

/* Додатково: альтернативний спосіб усереднення - спочатку середній інтервал
   кожного клієнта, потім середнє цих значень по регіону. Так кожен клієнт має
   однакову вагу, незалежно від кількості його замовлень (у запитах вище клієнти
   з великою кількістю замовлень "важать" більше).
*/

WITH order_diffs AS (SELECT o.customer_id
                          , c.region
                          , JULIANDAY(o.order_date)
                            - JULIANDAY(LAG(o.order_date) OVER (PARTITION BY o.customer_id ORDER BY o.order_date, o.order_id)) AS diff_days
                     FROM orders AS o
                     JOIN customers AS c
                       ON o.customer_id = c.customer_id)
   , customer_avg AS (SELECT region
                           , customer_id
                           , AVG(diff_days) AS customer_avg_diff_days
                      FROM order_diffs
                      GROUP BY region
                             , customer_id)
SELECT region
     , COUNT(customer_avg_diff_days) AS customers_cnt
     , ROUND(AVG(customer_avg_diff_days), 2) AS avg_diff_days
FROM customer_avg
GROUP BY region
ORDER BY avg_diff_days
;

/* Результат:

      region     | customers_cnt | avg_diff_days
-----------------+---------------+---------------
 Northern Europe |             4 |         52.62
 Scandinavia     |             3 |         60.76
 Western Europe  |            27 |          69.6
 North America   |            16 |         74.18
 Eastern Europe  |             1 |          84.0
 British Isles   |             8 |          86.4
 South America   |            16 |         100.1
 Central America |             4 |        108.64
 Southern Europe |             9 |        113.06
(9 rows)

*/

-- customers_cnt тут - клієнти, що мають хоча б один інтервал (2+ замовлення):
-- у Central America 5 клієнтів, але один із них зробив лише одне замовлення.

/* Відповіді на питання:

1) Найчастіше повторні замовлення роблять клієнти з регіону Northern Europe
   (в середньому кожні ~44.22 дні), далі North America (~49.21).
   Найрідше - клієнти з Central America (~94.39 дні), трохи частіше Southern Europe (~89.07).
   Якщо ж усереднювати спочатку по клієнту, а потім по регіону (альтернативний запит вище),
   лідер той самий - Northern Europe (~52.62), але найрідше замовляють уже в Southern Europe
   (~113.06), а Central America - друга з кінця (~108.64).

2) Чи можна робити коректні висновки? Лише з обережністю:
   - Результат залежить від способу усереднення: загальне середнє по всіх інтервалах
     регіону vs середнє середніх по клієнтах дають різних "аутсайдерів"
     (Central America vs Southern Europe).
   - Мала вибірка в частині регіонів: Eastern Europe - 1 клієнт / 6 інтервалів,
     Scandinavia - 3 клієнти, Northern Europe - 4 клієнти. Середнє по 1-4 клієнтах
     відображає поведінку окремих компаній, а не регіону.
   - Середнє чутливе до викидів: max_diff_days до 532 днів, min - 0 (два замовлення
     в один день). Корисно додатково дивитись медіану / розподіл інтервалів.
   - Короткий період даних: замовлення лише з 2016-07-04 по 2018-05-06 (~22 місяці),
     тож клієнти, які прийшли пізніше, мають менше шансів показати довгі інтервали.
   - Клієнти з одним замовленням не дають жодного інтервалу (diff_days = NULL)
     і не впливають на середнє; 4 клієнти взагалі не мають замовлень
     (FISSA, PARIS, 'Val2 ', VALON - у двох останніх region = NULL).
   - Регіон береться з картки клієнта; при цьому регіони "зважені" різною кількістю
     замовлень (Western Europe - 276, Eastern Europe - 7).
   Для коректних висновків допомогла б кількість клієнтів/замовлень/інтервалів
   на регіон (додатковий запит вище), медіана, довший часовий ряд, а також
   обсяг/сума замовлень - частота сама по собі не показує цінність клієнта.
*/


-- ---------------------------------------------------------------------
-- 6. ТОП-3 співробітники за кількістю оброблених замовлень
--
--    Знайдіть трьох співробітників (employee_id) з найбільшою кількістю
--    оброблених замовлень. Відобразіть:
--      - employee_id
--      - first_name
--      - last_name
--      - order_count   - кількість оброблених замовлень
--      - employee_rank - місце співробітника в рейтингу (1-3)
-- ---------------------------------------------------------------------

WITH employee_orders AS (SELECT e.employee_id
                              , e.first_name
                              , e.last_name
                              , COUNT(o.order_id) AS order_count
                              , RANK() OVER (ORDER BY COUNT(o.order_id) DESC) AS employee_rank
                         FROM employees AS e
                         JOIN orders AS o
                           ON e.employee_id = o.employee_id
                         GROUP BY e.employee_id
                                , e.first_name
                                , e.last_name)
SELECT employee_id
     , first_name
     , last_name
     , order_count
     , employee_rank
FROM employee_orders
WHERE employee_rank <= 3
ORDER BY employee_rank
       , employee_id
;

/* Результат:

 employee_id | first_name | last_name | order_count | employee_rank
-------------+------------+-----------+-------------+---------------
           4 | Margaret   | Peacock   |         156 |             1
           3 | Janet      | Leverling |         127 |             2
           1 | Nancy      | Davolio   |         123 |             3
(3 rows)

*/


-- ---------------------------------------------------------------------
-- 7. ТОП-3 співробітники за кількістю оброблених замовлень у кожному регіоні
--
--    Для кожного регіону визначте трьох співробітників із найбільшою кількістю
--    оброблених замовлень. Відобразіть:
--      - region
--      - employee_id
--      - first_name
--      - last_name
--      - order_count   - кількість оброблених замовлень
--      - employee_rank - місце співробітника в рейтингу (1-3)
-- ---------------------------------------------------------------------

/* Регіон беремо з клієнта (customers.region), як і в завданні 5:
   у employees.region лише 'North America' та 'British Isles' (там, де працюють
   самі співробітники), тому рейтинг "у кожному регіоні" має сенс саме за регіоном
   клієнтів, чиї замовлення обробив співробітник.
   RANK при однаковій кількості замовлень дає однакове місце, тому в регіоні
   може бути більше трьох рядків.
   ROW_NUMBER дав би рівно трьох, але при нічиї (Eastern Europe: 2, 2, 1, 1, 1) вибір
   третього був би довільним (за employee_id), тому обрано RANK.
*/

/* Альтернатива - регіон продажів співробітника через
   employee_territories -> territories -> regions (Eastern / Westerns / Northern / Southern).
   Але кожен співробітник належить рівно до одного такого регіону, тож "рейтинг у регіоні"
   там зводиться до рейтингу 1-4 людей своєї команди (у Southern - лише один співробітник)
   і не показує, хто обслуговує клієнтів конкретного регіону. Тому обрано регіон клієнта.
*/

WITH region_employee_orders AS (SELECT c.region
                                     , e.employee_id
                                     , e.first_name
                                     , e.last_name
                                     , COUNT(o.order_id) AS order_count
                                     , RANK() OVER (PARTITION BY c.region ORDER BY COUNT(o.order_id) DESC) AS employee_rank
                                FROM orders AS o
                                JOIN customers AS c
                                  ON o.customer_id = c.customer_id
                                JOIN employees AS e
                                  ON o.employee_id = e.employee_id
                                GROUP BY c.region
                                       , e.employee_id
                                       , e.first_name
                                       , e.last_name)
SELECT region
     , employee_id
     , first_name
     , last_name
     , order_count
     , employee_rank
FROM region_employee_orders
WHERE employee_rank <= 3
ORDER BY region
       , employee_rank
       , employee_id
;

/* Результат:

      region     | employee_id | first_name | last_name | order_count | employee_rank
-----------------+-------------+------------+-----------+-------------+---------------
 British Isles   |           3 | Janet      | Leverling |          13 |             1
 British Isles   |           4 | Margaret   | Peacock   |          13 |             1
 British Isles   |           1 | Nancy      | Davolio   |          10 |             3
 Central America |           1 | Nancy      | Davolio   |           6 |             1
 Central America |           3 | Janet      | Leverling |           6 |             1
 Central America |           7 | Robert     | King      |           5 |             3
 Eastern Europe  |           1 | Nancy      | Davolio   |           2 |             1
 Eastern Europe  |           4 | Margaret   | Peacock   |           2 |             1
 Eastern Europe  |           5 | Steven     | Buchanan  |           1 |             3
 Eastern Europe  |           6 | Michael    | Suyama    |           1 |             3
 Eastern Europe  |           8 | Laura      | Callahan  |           1 |             3
 North America   |           3 | Janet      | Leverling |          30 |             1
 North America   |           1 | Nancy      | Davolio   |          26 |             2
 North America   |           4 | Margaret   | Peacock   |          25 |             3
 Northern Europe |           8 | Laura      | Callahan  |          10 |             1
 Northern Europe |           1 | Nancy      | Davolio   |           9 |             2
 Northern Europe |           3 | Janet      | Leverling |           9 |             2
 Scandinavia     |           2 | Andrew     | Fuller    |           7 |             1
 Scandinavia     |           1 | Nancy      | Davolio   |           4 |             2
 Scandinavia     |           8 | Laura      | Callahan  |           4 |             2
 South America   |           4 | Margaret   | Peacock   |          32 |             1
 South America   |           8 | Laura      | Callahan  |          21 |             2
 South America   |           1 | Nancy      | Davolio   |          20 |             3
 Southern Europe |           4 | Margaret   | Peacock   |          16 |             1
 Southern Europe |           1 | Nancy      | Davolio   |          10 |             2
 Southern Europe |           2 | Andrew     | Fuller    |           9 |             3
 Western Europe  |           4 | Margaret   | Peacock   |          55 |             1
 Western Europe  |           3 | Janet      | Leverling |          41 |             2
 Western Europe  |           1 | Nancy      | Davolio   |          36 |             3
(29 rows)

*/
