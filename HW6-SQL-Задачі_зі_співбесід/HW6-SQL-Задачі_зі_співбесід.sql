-- ДЗ SQL: Задачі зі співбесід

/*

В цьому ДЗ ми імітуємо ситуації на співбесіді, де ви пишете SQL запит без доступу
до бази і зручного редактора просто в Google Docs.

Власне, це завдання побудоване таким чином, що у вас немає бази, до якої можна
зробити запити. Є опис таблиць і опис завдання. Вам необхідно написати свої запити.

Тут вам знадобляться функції роботи з датами. Найкраще їх пригадати з документації:
https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html

Діалект запитів: MySQL 8.

 */


/* ---------------------------------------------------------------------
   1. Є таблиця sales зі стовпцями:
        - sale_id (ідентифікатор продажу)
        - product (назва товару)
        - amount  (сума продажу)

      Питання:
      Порахуйте загальну суму продажів (amount) для кожного товару (product).
   --------------------------------------------------------------------- */

SELECT product
     , SUM(amount) AS total_amount
FROM sales
GROUP BY product
ORDER BY product
;


/* ---------------------------------------------------------------------
   2. Є таблиця orders зі стовпцями:
        - order_id    (ідентифікатор замовлення)
        - customer_id (ідентифікатор клієнта)
        - amount      (сума замовлення)

      Питання:
      Знайдіть клієнтів (customer_id), які зробили замовлень на суму понад 1000.
   --------------------------------------------------------------------- */

SELECT customer_id
     , SUM(amount) AS total_amount
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 1000
-- HAVING MAX(amount) > 1000
ORDER BY customer_id
;


/* ---------------------------------------------------------------------
   3. Є таблиця transactions зі стовпцями:
        - transaction_id (ідентифікатор транзакції)
        - customer_id    (ідентифікатор клієнта)
        - amount         (сума транзакції)
        - status         (статус: 'completed', 'failed')

      Питання:
      Порахуйте загальну суму успішних транзакцій (status = 'completed') для
      кожного клієнта, але покажіть тільки клієнтів, які здійснили транзакцій
      на суму понад 500.
   --------------------------------------------------------------------- */

SELECT customer_id
     , SUM(amount) AS total_completed_amount
--   , SUM(CASE WHEN status = 'completed' THEN amount ELSE 0 END) AS total_completed_amount
FROM transactions
WHERE status = 'completed'
GROUP BY customer_id
HAVING SUM(amount) > 500
ORDER BY customer_id
;


/* ---------------------------------------------------------------------
   4. Є таблиця transactions зі стовпцями:
        - transaction_id   (ідентифікатор транзакції)
        - transaction_date (дата транзакції)
        - amount           (сума транзакції)

      Питання:
      Порахуйте загальну суму транзакцій за кожен місяць і відобразіть лише ті
      місяці, де загальна сума транзакцій перевищує 1000.
   --------------------------------------------------------------------- */

SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS transaction_month
     , SUM(amount)                            AS total_amount
FROM transactions
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
HAVING SUM(amount) > 1000
ORDER BY transaction_month
;


/* ---------------------------------------------------------------------
   5. Є таблиця orders зі стовпцями:
        - order_id    (ідентифікатор замовлення)
        - customer_id (ідентифікатор клієнта)
        - region      (регіон клієнта)
        - amount      (сума замовлення)
        - status      (статус: 'completed', 'pending')

      Питання:
      Порахуйте загальну суму успішних замовлень (status = 'completed') для
      кожного регіону (region) і клієнта (customer_id). Виведіть лише ті пари
      регіон-клієнт, де загальна сума замовлень перевищує 2000.
   --------------------------------------------------------------------- */

SELECT region
     , customer_id
     , SUM(amount) AS total_completed_amount
FROM orders
WHERE status = 'completed'
GROUP BY region
       , customer_id
HAVING SUM(amount) > 2000
ORDER BY region
       , customer_id
;


/* ---------------------------------------------------------------------
   6. У вас є таблиця transactions зі стовпцями:
        - transaction_id   (унікальний ідентифікатор транзакції)
        - customer_id      (ідентифікатор клієнта)
        - amount           (сума транзакції)
        - transaction_date (дата транзакції)
        - status           (статус транзакції: 'completed', 'failed', 'pending')

      Запитання:
      Напишіть запит, щоб отримати список клієнтів, які здійснили успішні
      транзакції (status = 'completed') на суму понад 1000 за поточний місяць.
   --------------------------------------------------------------------- */

/*
   Межі поточного місяця задано діапазоном [перше число місяця; перше число
   наступного місяця), щоб не обгортати transaction_date у функцію
   (так може використовуватись індекс по даті).
 */

SELECT customer_id
     , SUM(amount) AS total_completed_amount
FROM transactions
WHERE status = 'completed'
  AND transaction_date >= DATE_FORMAT(CURDATE(), '%Y-%m-01')
  AND transaction_date <  DATE_FORMAT(CURDATE(), '%Y-%m-01') + INTERVAL 1 MONTH
GROUP BY customer_id
HAVING SUM(amount) > 1000
-- HAVING MAX(amount) > 1000
ORDER BY customer_id
;


/* ---------------------------------------------------------------------
   7. Є таблиці:
        - customers: (customer_id, customer_name, region)
        - accounts:  (account_id, customer_id, balance)

      Запитання:
      Напишіть SQL-запит, щоб отримати імена клієнтів та загальний баланс
      їхніх рахунків для клієнтів із регіону 'Kyiv'.
   --------------------------------------------------------------------- */

/*
   LEFT JOIN + COALESCE: клієнти з Києва без жодного рахунку теж потрапляють
   у результат із балансом 0. Групування по customer_id, щоб не злити
   в один рядок різних клієнтів з однаковим іменем.
 */

SELECT c.customer_id
     , c.customer_name
     , COALESCE(SUM(a.balance), 0) AS total_balance
FROM customers AS c
LEFT JOIN accounts AS a
       ON a.customer_id = c.customer_id
WHERE c.region = 'Kyiv'
GROUP BY c.customer_id
       , c.customer_name
ORDER BY c.customer_name
;


/* ---------------------------------------------------------------------
   8. Є таблиця transactions:
        - transaction_id
        - customer_id
        - amount
        - transaction_date

      Запитання:
      Знайдіть клієнтів, які здійснили транзакції з сумою більшою, ніж середня
      сума всіх транзакцій.
   --------------------------------------------------------------------- */

SELECT DISTINCT customer_id
FROM transactions
WHERE amount > (SELECT AVG(amount) FROM transactions)
ORDER BY customer_id
;


/* ---------------------------------------------------------------------
   9. Є таблиця transactions зі стовпцями:
        - transaction_id   (унікальний ідентифікатор транзакції)
        - customer_id      (ідентифікатор клієнта)
        - transaction_date (дата транзакції)

      Питання:
      Знайдіть пари клієнтів, які здійснили транзакції в один і той самий день
      (без дублювання пар).
   --------------------------------------------------------------------- */

/*
   CTE customer_days спершу згортає транзакції до унікальних пар
   (клієнт, день), щоб self-join не розмножував рядки, коли клієнт має
   багато транзакцій за один день.
   DATE() — на випадок, якщо transaction_date зберігається як DATETIME.
   Умова d1.customer_id < d2.customer_id прибирає пари клієнта із самим
   собою та дзеркальні дублікати (A, B) / (B, A).
   DISTINCT у фінальному SELECT — якщо пара збігалась у кілька різних днів,
   вона виводиться один раз.
 */

WITH customer_days AS (
    SELECT DISTINCT customer_id
                  , DATE(transaction_date) AS transaction_day
    FROM transactions
)
SELECT DISTINCT d1.customer_id AS customer_id_1
              , d2.customer_id AS customer_id_2
FROM customer_days AS d1
JOIN customer_days AS d2
  ON d1.transaction_day = d2.transaction_day
 AND d1.customer_id < d2.customer_id
ORDER BY customer_id_1
       , customer_id_2
;


/* ---------------------------------------------------------------------
   10. Є таблиця employees зі стовпцями:
        - employee_id (унікальний ідентифікатор співробітника)
        - name        (ім'я співробітника)
        - salary      (зарплата співробітника)

      Питання:
      Напишіть SQL-запит, щоб знайти пари співробітників із однаковими
      зарплатами.
   --------------------------------------------------------------------- */

/*
   Умова e1.employee_id < e2.employee_id прибирає пари співробітника
   із самим собою та дзеркальні дублікати.
 */

SELECT e1.employee_id AS employee_id_1
     , e1.name        AS name_1
     , e2.employee_id AS employee_id_2
     , e2.name        AS name_2
     , e1.salary
FROM employees AS e1
JOIN employees AS e2
  ON e1.salary = e2.salary
 AND e1.employee_id < e2.employee_id
ORDER BY e1.salary
       , e1.employee_id
       , e2.employee_id
;
