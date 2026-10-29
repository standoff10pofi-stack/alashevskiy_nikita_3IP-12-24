PRAGMA foreign_keys = ON;
CREATE TABLE authors (author_id INTEGER PRIMARY KEY AUTOINCREMENT, last_name TEXT NOT NULL, first_name TEXT NOT NULL, email TEXT UNIQUE);
CREATE TABLE books (book_id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, genre TEXT, price REAL NOT NULL CHECK(price >= 0), publish_year INTEGER, author_id INTEGER NOT NULL, FOREIGN KEY (author_id) REFERENCES authors(author_id));
CREATE TABLE customers (customer_id INTEGER PRIMARY KEY AUTOINCREMENT, full_name TEXT NOT NULL, city TEXT, phone TEXT);
CREATE TABLE employees (employee_id INTEGER PRIMARY KEY AUTOINCREMENT, full_name TEXT NOT NULL, position TEXT);
CREATE TABLE orders (order_id INTEGER PRIMARY KEY AUTOINCREMENT, customer_id INTEGER NOT NULL, employee_id INTEGER, order_date TEXT DEFAULT (DATE('now')), status TEXT DEFAULT 'New' CHECK(status IN ('New', 'Shipped', 'Cancelled')), FOREIGN KEY (customer_id) REFERENCES customers(customer_id), FOREIGN KEY (employee_id) REFERENCES employees(employee_id));
CREATE TABLE order_items (order_item_id INTEGER PRIMARY KEY AUTOINCREMENT, order_id INTEGER NOT NULL, book_id INTEGER NOT NULL, quantity INTEGER NOT NULL CHECK(quantity > 0), unit_price REAL NOT NULL, FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE, FOREIGN KEY (book_id) REFERENCES books(book_id), UNIQUE(order_id, book_id));
CREATE INDEX idx_books_author ON books(author_id);
CREATE INDEX idx_orders_status ON orders(status);
