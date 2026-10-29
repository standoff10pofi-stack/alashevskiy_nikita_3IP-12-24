# Publishing DB Project

Учебный проект: база данных издательства на SQLite.

## Предметная область
Издательство: авторы, книги, клиенты, сотрудники, заказы и позиции заказов.

## Структура
- `schema.sql` — DDL (таблицы + 2 индекса)
- `data.sql` — тестовые данные (INSERT)
- `queries.sql` — 15 SQL-запросов (SELECT, JOIN, агрегаты, подзапросы)
- `report.md` — отчёт по этапам

## Запуск
```bash
sqlite3 publishing.db < schema.sql
sqlite3 publishing.db < data.sql
sqlite3 -header -column publishing.db < queries.sql



```bash
cd ~/publishing-project && cat > erd.dbml <<'EOF'
Table authors {
  author_id integer [pk]
  last_name text
  first_name text
  email text
}
Table books {
  book_id integer [pk]
  title text
  genre text
  price real
  publish_year integer
  author_id integer [ref: > authors.author_id]
}
Table customers {
  customer_id integer [pk]
  full_name text
  city text
  phone text
}
Table employees {
  employee_id integer [pk]
  full_name text
  position text
}
Table orders {
  order_id integer [pk]
  customer_id integer [ref: > customers.customer_id]
  employee_id integer [ref: > employees.employee_id]
  order_date text
  status text
}
Table order_items {
  order_item_id integer [pk]
  order_id integer [ref: > orders.order_id]
  book_id integer [ref: > books.book_id]
  quantity integer
  unit_price real
}
