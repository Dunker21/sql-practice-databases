# sql-practice-databases
MySQL practice databases with 30+ queries across Basic, Intermediate, and Advanced levels covering real-world business schemas.

# 🗄️ SQL Practice Databases

A collection of MySQL databases and structured SQL query exercises ranging from basic to advanced — ideal for learning and practicing SQL in a realistic, multi-schema environment.

---

## 📁 Repository Structure
```
.
├── create-databases.sql        # Creates all databases in one script
├── create-db-hr.sql            # HR database (employees, offices)
├── create-db-inventory.sql     # Inventory database (products)
├── create-db-invoicing.sql     # Invoicing database (clients, invoices, payments)
├── create-db-store.sql         # Store database (customers, orders, products)
├── Basic_questions.sql         # Beginner-level queries
├── Intermediate_questions.sql  # Intermediate-level queries
├── Advanced_questions.sql      # Advanced queries with JOINs, subqueries & window functions
└── README.md
```

---

## 🗃️ Databases Overview

### `sql_store`
Simulates an e-commerce store with customers, products, orders, and shippers.

| Table | Description |
|---|---|
| `customers` | Customer profiles with location and loyalty points |
| `products` | Product catalog with pricing and stock levels |
| `orders` | Order records with status and shipping info |
| `order_items` | Line items per order |
| `order_item_notes` | Notes attached to order items |
| `shippers` | Shipping companies |
| `order_statuses` | Order status lookup (Processed / Shipped / Delivered) |

### `sql_invoicing`
Tracks client billing, invoices, and payment records.

| Table | Description |
|---|---|
| `clients` | Client contact and location data |
| `invoices` | Invoice totals, dates, and payment status |
| `payments` | Payment transactions linked to invoices |
| `payment_methods` | Payment method lookup (Credit Card, Cash, PayPal, Wire) |

### `sql_hr`
Models a company's human resources structure.

| Table | Description |
|---|---|
| `employees` | Employee records with salary, title, and manager |
| `offices` | Office locations across the US |

### `sql_inventory`
A standalone product inventory database.

| Table | Description |
|---|---|
| `products` | Products with quantity in stock and unit price |

---

## 🚀 Getting Started

### Prerequisites

- [MySQL](https://dev.mysql.com/downloads/) 8.0+ or [MariaDB](https://mariadb.org/)
- A MySQL client such as [MySQL Workbench](https://www.mysql.com/products/workbench/), [DBeaver](https://dbeaver.io/), or the MySQL CLI

### Setup — Option A: All Databases at Once (Recommended)
```bash
mysql -u root -p < create-databases.sql
```

### Setup — Option B: Individual Databases
```bash
mysql -u root -p < create-db-hr.sql
mysql -u root -p < create-db-inventory.sql
mysql -u root -p < create-db-invoicing.sql
mysql -u root -p < create-db-store.sql
```

### Verify Installation
```sql
SHOW DATABASES;
-- Expected: sql_store, sql_invoicing, sql_hr, sql_inventory
```

---

## 📝 SQL Exercises

### 🟢 Basic — `Basic_questions.sql`

Covers `SELECT`, `WHERE`, `ORDER BY`, `IS NULL`, and `IN` filters.

| # | Query | Database |
|---|---|---|
| 1 | Customers in Texas | `sql_store` |
| 2 | Products with low stock (< 20 units) | `sql_store` |
| 3 | Unpaid invoices ordered by due date | `sql_invoicing` |
| 4 | Orders placed in 2019 | `sql_store` |
| 5 | Clients in CA or OR | `sql_invoicing` |
| 6 | Products sorted by unit price (desc) | `sql_store` |
| 7 | Shipped orders (status = 2) | `sql_store` |
| 8 | Employees earning over $90,000 | `sql_hr` |
| 9 | Credit card payments sorted by date | `sql_invoicing` |
| 10 | Offices located in Ohio | `sql_hr` |

### 🟡 Intermediate — `Intermediate_questions.sql`

Introduces `JOIN`, `GROUP BY`, `HAVING`, aggregate functions, and subqueries.

| # | Query | Database |
|---|---|---|
| 1 | Total invoices and billing per client | `sql_invoicing` |
| 2 | Customers with more than one order | `sql_store` |
| 3 | Revenue per order | `sql_store` |
| 4 | Invoices with outstanding balances | `sql_invoicing` |
| 5 | Employee count per office city | `sql_hr` |
| 6 | Average order value | `sql_store` |
| 7 | Payment method usage and totals | `sql_invoicing` |
| 8 | Customers with non-shipped orders | `sql_store` |
| 9 | Salary stats (avg, min, max) per office | `sql_hr` |
| 10 | Overdue unpaid invoices | `sql_invoicing` |

### 🔴 Advanced — `Advanced_questions.sql`

Explores window functions (`RANK() OVER`), self-joins, and business reporting.

| # | Query | Database |
|---|---|---|
| 1 | Client billing summary with % paid and outstanding balance | `sql_invoicing` |
| 2 | Top 3 products by spend per customer (using `RANK()`) | `sql_store` |
| 3 | Employee–manager hierarchy via self-join | `sql_hr` |
| 4 | Shipper performance: shipment count and revenue | `sql_store` |
| 5 | Partially paid invoices with remaining balance | `sql_invoicing` |

---

## 💡 Tips

- Use `USE database_name;` to switch between databases before running queries.
- `Advanced_questions.sql` requires **MySQL 8.0+** for window function support.
- All setup scripts are idempotent — safe to re-run; they drop and recreate databases cleanly.

---

## 🤝 Contributing

Pull requests are welcome! Feel free to add new queries, improve existing ones, or expand the schema.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
