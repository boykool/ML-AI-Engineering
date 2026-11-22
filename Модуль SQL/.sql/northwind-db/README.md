# northwind.db (копия sql-practice.com)

1. Положите файл базы в `data/northwind.db`
   (источник: https://www.sql-practice.com/sql2.db.txt - это и есть SQLite-файл, переименуйте в northwind.db).
   Размер: 249856 байт.
   SHA-256 оригинала: 7f16371ee98cd1b615d5e10e19572195dd3e1ba2381b104d2dc802218c855749
2. `docker compose up -d`
3. Откройте http://localhost:8081  (порт 8081, чтобы не конфликтовать с hospital-db на 8080)
4. Проверка: выполните запрос из `check.sql`
