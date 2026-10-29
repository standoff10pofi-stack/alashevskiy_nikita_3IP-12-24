-- 1. Все книги с авторами
SELECT b.title, a.last_name || ' ' || a.first_name AS author FROM books b JOIN authors a ON b.author_id = a.author_id;
-- 2. Романы
SELECT title, price FROM books WHERE genre = 'Роман';
-- 3. Общая выручка
SELECT SUM(quantity * unit_price) AS total_revenue FROM order_items;
-- 4. Средняя цена книги
SELECT AVG(price) AS avg_price FROM books;
-- 5. Заказы по клиентам
SELECT c.full_name, COUNT(o.order_id) AS order_count FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id;
-- 6. Топ-3 продаваемых книг
SELECT b.title, SUM(oi.quantity) AS sold FROM books b JOIN order_items oi ON b.book_id = oi.book_id GROUP BY b.book_id ORDER BY sold DESC LIMIT 3;
-- 7. Клиенты без заказов
SELECT full_name FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL;
-- 8. Книги дороже средней цены
SELECT title, price FROM books WHERE price > (SELECT AVG(price) FROM books);
-- 9. Выручка по авторам
SELECT a.last_name, SUM(oi.quantity * oi.unit_price) AS revenue FROM authors a JOIN books b ON a.author_id = b.author_id JOIN order_items oi ON b.book_id = oi.book_id GROUP BY a.author_id;
-- 10. Заказы за последний месяц
SELECT * FROM orders WHERE order_date >= DATE('now', '-1 month');
-- 11. Количество книг по жанрам
SELECT genre, COUNT(*) FROM books GROUP BY genre;
-- 12. Покупки клиентов из Москвы
SELECT c.full_name, SUM(oi.quantity * oi.unit_price) AS total_spent FROM customers c JOIN orders o ON c.customer_id = o.customer_id JOIN order_items oi ON o.order_id = oi.order_id WHERE c.city = 'Москва' GROUP BY c.customer_id;
-- 13. Сотрудник с наибольшим числом заказов
SELECT e.full_name, COUNT(o.order_id) AS cnt FROM employees e JOIN orders o ON e.employee_id = o.employee_id GROUP BY e.employee_id ORDER BY cnt DESC LIMIT 1;
-- 14. Книги без продаж
SELECT title FROM books WHERE book_id NOT IN (SELECT book_id FROM order_items);
-- 15. Средний чек заказа
SELECT AVG(total) FROM (SELECT SUM(quantity * unit_price) AS total FROM order_items GROUP BY order_id);
