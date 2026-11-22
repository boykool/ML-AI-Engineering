# ДЗ SQL: Використання Window Functions

> Джерело: [Notion — SQL Window Functions](https://hannapylieva.notion.site/SQL-Window-Functions-1749483584948008b4e2e18fd054c1f7)

В цьому ДЗ будемо працювати на сайті [https://www.sql-practice.com/](https://www.sql-practice.com/) з базою `northwind.db`.

**Для цього перед початком роботи необхідно обрати цю базу:**

![Вибір бази northwind.db](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdxZVo7rucPAHJTuMfG1sEwxpRCa4WZCUawmeWNHLX_zosB-ytev8X8oFwlLg5oOHuWoybosPd2FpSOazznIsWxLfG5UasLvWzjEREX9QgyPrlkQNhrwb07J0NleXTbEx4Ts9rfWg?key=h9FV8NGnXxmq_CjVeylPzqFY)

Схема бази даних:

![Схема бази даних northwind](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfFKqA3bGt0IJAXYy_5uvjWKd1jbI9rWzx3kQuGTwb2T5r2I5HKLy8tIzoqQdKNVdwBgZ2gBcEijlHrHrRFMdNo1Dy8dHqDD_6qrr6QtocWZ4z0j45TqrC5meAt6-YxTNiSU_eM?key=h9FV8NGnXxmq_CjVeylPzqFY)

## Завдання

### 1. Визначення попереднього замовлення для кожного клієнта

Для кожного клієнта (`customer_id`) знайдіть попереднє замовлення (`order_id`) на основі дати замовлення (`order_date`). Відобразіть:

- `customer_id`
- `order_id`
- `order_date`
- `previous_order_id` (за допомогою `LAG`)

<details>
<summary><b>Підказка:</b></summary>

Тут треба використати `LAG` та `PARTITION BY`.

</details>

---

### 2. Перше замовлення кожного клієнта

Для кожного клієнта (`customer_id`) знайдіть перше замовлення (`order_id`) на основі дати замовлення (`order_date`). Відобразіть:

- `customer_id`
- `order_id`
- `order_date`
- `first_order_id`

<details>
<summary><b>Підказка:</b></summary>

Тут треба використати `FIRST_VALUE` та `PARTITION BY`.

</details>

---

### 3. ТОП-3 найдорожчі замовлення у кожній категорії товарів

**Завдання:**

Знайдіть три найдорожчі товари (`unit_price`) у кожній категорії (`category_id`). Відобразіть:

- `category_id`
- `category_name` - назва категорії
- `product_id`
- `product_name`
- `unit_price`
- `product_rank` - тобто яке місце по дороговизні посідає цей товар з ТОП3 обраних.

<details>
<summary><b>Підказка:</b></summary>

Тут треба використати `RANK` та `PARTITION BY` і ще зробити `JOIN`.

</details>

---

### 4. З яким проміжком часу користувачі роблять замовлення.

Покажіть різницю між датами поточного та попереднього замовлення для кожного клієнта. Відобразіть:

- `customer_id`
- `order_id`
- `order_date`
- `previous_order_date`
- `diff_days` - різниця у днях між датами поточного і попереднього замовлень цього клієнта

<details>
<summary><b>Підказка:</b></summary>

Тут треба використати `LAG` та `PARTITION BY`.

Аби обчислити різницю в днях для SQLite використовуємо конструкцію `JULIANDAY(later_date) - JULIANDAY(earlier_date)`

</details>

---

### 5. Середній інтервал в днях між датами замовлень клієнтів по регіонам.

Для кожного регіона (`region`) обчисліть середній інтервал (у днях) між послідовними замовленнями клієнтів (тобто обчислення в розрізі клієнта). Виведіть дані, округлені до двох знаків після коми.

**Очікувані результати:**

- `region` – регіон клієнта.
- `avg_diff_days` – середній інтервал у днях між замовленнями клієнтів у цьому регіоні.

Дайте відповіді на питання:

- В якому регіоні найчастіше клієнти роблять повторні замовлення, а в якому - найрідше?
- Чи є дані, які б допомогли вам зробити коректні висновки для цього аналізу?

<details>
<summary><b>Підказка:</b></summary>

Це завдання - ускладнення попереднього. Треба додати один зовнішній запит.

</details>

---

### 6. ТОП-3 співробітники за кількістю оброблених замовлень

Знайдіть трьох співробітників (`employee_id`) з найбільшою кількістю оброблених замовлень. Відобразіть:

- `employee_id`
- `first_name`
- `last_name`
- `order_count` - кількість оброблених замовлень
- `employee_rank` - місце співробітника в рейтингу (1-3)

---

### 7. ТОП-3 співробітники за кількістю оброблених замовлень у кожному регіоні

Для кожного регіону визначте трьох співробітників із найбільшою кількістю оброблених замовлень. Відобразіть:

- `region`
- `employee_id`
- `first_name`
- `last_name`
- `order_count` - кількість оброблених замовлень
- `employee_rank` - місце співробітника в рейтингу (1-3)
