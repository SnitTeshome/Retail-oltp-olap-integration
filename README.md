# DSA 2040A US 2025 LAB 2  
**EXTENDED LAB MANUAL: OLTP + OLAP Integration**

---

## 📌 Table of Contents

- [Overview](#overview)  
- [Project Objective](#project-objective)  
- [Tools & Technologies](#tools--technologies)  
- [How to Use](#how-to-use)  
- [Schemas Overview](#schemas-overview)  
  - [OLTP Schema](#oltp-schema)  
  - [OLAP Star Schema](#olap-star-schema)  
- [ETL Process](#etl-process)  
- [Analytical Queries](#analytical-queries)  
- [Repository Structure](#repository-structure)  
- [Collaborators](#collaborators)  
- [Reflection & Discussion](#reflection--discussion)  
- [Repository URL](#repository-url)  
- [License](#license)  

---

## 📖 Overview

This lab project simulates a real-world retail system by integrating **OLTP (Online Transaction Processing)** and **OLAP (Online Analytical Processing)** systems. Students design and implement an operational OLTP schema, transform the data through ETL, and load it into an OLAP star schema for business analysis.

---

## 🎯 Project Objective

- Design and build an OLTP database for transaction-level operations.
- Build an OLAP data warehouse using a star schema model.
- Perform ETL (Extract, Transform, Load) from OLTP → OLAP.
- Run analytical SQL queries to extract business insights.

---

## 🛠 Tools & Technologies

- **Database:** PostgreSQL / SQL Server  
- **Editors:** Visual Studio Code  
- **Client:** pgAdmin / SQL Server Management Studio (SSMS)  
- **Data Format:** SQL & CSV files  
- **Version Control:** Git & GitHub  

---

## 🚀 How to Use

1. **Set Up OLTP Schema:**
   - Run all SQL files under `/oltp_schema/` to create `customers`, `products`, `stores`, and `transactions` tables.

2. **Insert Sample Data:**
   - Use the scripts provided or load optional CSV files from `/sample_data/`.

3. **Build OLAP Schema:**
   - Run scripts in `/olap_schema/` to create `fact_sales`, `dim_product`, `dim_store`, and `dim_date`.

4. **Perform ETL:**
   - Execute ETL scripts in `/etl_scripts/` to load transactional data into the data warehouse.

5. **Run Analytical Queries:**
   - Use queries from `/queries/` to gain business insights (e.g., monthly trends, top-selling products).

---

## 🗃 Schemas Overview

### 🧾 OLTP Schema

Captures normalized, day-to-day business transactions.

**Tables:**

#### 1. `customers` table – Stores customer info
```sql
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  registered_date DATE
);
```

#### 2. `products` table – Holds product catalog
```sql
CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  category VARCHAR(50),
  price DECIMAL(10,2)
);
```

#### 3. `stores` table – Contains store details
```sql
CREATE TABLE stores (
  store_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  region VARCHAR(50)
);
```

#### 4. `transactions` table – Records sales activity
```sql
CREATE TABLE transactions (
  transaction_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  product_id INT REFERENCES products(product_id),
  store_id INT REFERENCES stores(store_id),
  quantity INT NOT NULL,
  transaction_date DATE NOT NULL
);
```

### 🌟 OLAP Star Schema

Optimized for fast and efficient analytics using denormalized structures.

**Tables:**

#### `fact_sales`
```sql
CREATE TABLE fact_sales (
  product_id INT,
  store_id INT,
  date_id INT,
  quantity_sold INT,
  revenue DECIMAL(10,2)
);
```

#### `dim_product`, `dim_store`, `dim_date`
> These are assumed to be pre-created as part of the lab instructions, with dimension keys and business attributes.

---

## 📥 Sample Data Insertion

```sql
-- Customers
INSERT INTO customers (name, email, registered_date)
VALUES
('Alice Smith', 'alice@example.com', '2025-01-10'),
('Bob Brown', 'bob@example.com', '2025-02-01');

-- Products
INSERT INTO products (name, category, price)
VALUES
('T-Shirt', 'Apparel', 19.99),
('Laptop', 'Electronics', 999.00);

-- Stores
INSERT INTO stores (name, region)
VALUES
('Downtown Store', 'East'),
('Mall Outlet', 'West');

-- Transactions
INSERT INTO transactions (customer_id, product_id, store_id, quantity, transaction_date)
VALUES
(1, 1, 1, 2, '2025-05-01'),
(2, 2, 2, 1, '2025-05-03');
```

---

## 🔄 ETL Process

Extracts data from `transactions`, joins it with `products` and `dim_date`, computes revenue, and inserts into `fact_sales`.

```sql
INSERT INTO fact_sales (product_id, store_id, date_id, quantity_sold, revenue)
SELECT
  t.product_id,
  t.store_id,
  d.date_id,
  t.quantity,
  t.quantity * p.price AS revenue
FROM
  transactions t
JOIN
  products p ON t.product_id = p.product_id
JOIN
  dim_date d ON t.transaction_date = d.full_date;
```

---

## 📊 Analytical Queries

### 1️⃣ Monthly Sales Trends

```sql
SELECT d.month, SUM(fs.revenue) AS total_revenue
FROM fact_sales fs
JOIN dim_date d ON fs.date_id = d.date_id
GROUP BY d.month
ORDER BY d.month;
```

### 2️⃣ Top Selling Products

```sql
SELECT dp.name, SUM(fs.quantity_sold) AS total_units
FROM fact_sales fs
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dp.name
ORDER BY total_units DESC
LIMIT 5;
```

---

## 📁 Repository Structure

```
📦 OLTP-OLAP-Retail-Warehouse
├── oltp_schema/           # SQL scripts to build OLTP system
├── olap_schema/           # SQL scripts for data warehouse (star schema)
├── etl_scripts/           # ETL logic from OLTP to OLAP
├── sample_data/           # Optional: CSV files to seed OLTP
├── queries/               # SQL files for OLAP analysis
├── README.md              # Project documentation
├── LICENSE                # License information
```

---

## 👥 Collaborators

**Group 8 – DSA2040A (Lab Two)**  

| Name                        | Student ID | GitHub Username       |
|-----------------------------|------------|------------------------|
| Snit Teshome                | 670552     | [@SnitTeshome](https://github.com/SnitTeshome)  
| Halima Mohammed             | 670315     | [@halima-04](https://github.com/halima-04)  
| Julie Koki                  | 669996     | [@juli3333](https://github.com/juli3333)  
| Lesala Phillip Monaheng     | 669218     | [@Lesala](https://github.com/Lesala)  
| Mohamed Mohamed             | 670006     | [@mohayo8](https://github.com/mohayo8)  

---

## 💬 Reflection & Discussion

1. **Why is the OLTP system normalized and the OLAP system denormalized?**  
   - OLTP is normalized to minimize redundancy and maintain data integrity during frequent updates.
   - OLAP is denormalized for faster read/query performance during analytics.

2. **What challenges would you face if you ran analytical queries directly on the OLTP system?**  
   - It can slow down real-time operations.
   - Complex joins in normalized data make it inefficient for reporting.

3. **How can automation (e.g., scheduled ETL jobs) help in a real-world data pipeline?**  
   - Ensures timely data updates in the warehouse.
   - Reduces manual effort and risk of error.

---

## 🔗 Repository URL

[https://github.com/SnitTeshome/Retail-oltp-olap-integration](https://github.com/SnitTeshome/Retail-oltp-olap-integration)

---

## 🪪 License

This project is licensed under the **MIT License**. See the `LICENSE` file for details.