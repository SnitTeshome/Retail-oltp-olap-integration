# DSA 2040A US 2025 LAB 2  
**EXTENDED LAB MANUAL: OLTP + OLAP Integration**

---

##  Table of Contents

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

##  Overview

This lab project simulates a real-world retail system by integrating **OLTP (Online Transaction Processing)** and **OLAP (Online Analytical Processing)** systems. Students design and implement an operational OLTP schema, transform the data through ETL, and load it into an OLAP star schema for business analysis.

##  Project Objective

- Design and build an OLTP database for transaction-level operations.
- Build an OLAP data warehouse using a star schema model.
- Perform ETL (Extract, Transform, Load) from OLTP → OLAP.
- Run analytical SQL queries to extract business insights.

## Tools & Technologies

- **Database:** PostgreSQL / SQL Server  
- **Editors:** Visual Studio Code  
- **Client:** pgAdmin / SQL Server Management Studio (SSMS)  
- **Data Format:** SQL & CSV files  
- **Version Control:** Git & GitHub  

##  How to Use

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

##  Schemas Overview

### OLTP Schema

Captures normalized, day-to-day business transactions.

###  OLAP Star Schema

Optimized for fast and efficient analytics using denormalized structures.

#### `dim_product`, `dim_store`, `dim_date`
> These are assumed to be pre-created as part of the lab instructions, with dimension keys and business attributes.

##  ETL Process

Extracts data from `transactions`, joins it with `products` and `dim_date`, computes revenue, and inserts into `fact_sales`.

## Repository-Folder Structure
├── etl_scripts/
│   ├── populate_dimensions.sql   # Table creation script (star schema)
│   └── Sample_data/              # Folder containing CSV files:Dimension
│       ├── view_dim_date.csv     
│       ├── view_dim_products.csv   
│       └── view_dim_stores.csv
│
│
├── Sample_data/                  ##Folder containing simulated data
│   ├── view_customers.csv        
│   ├── view_products.csv      
│   ├── view_stores.csv
│   └── view_transaction.csv
│
│
├── insert_customers.sql          # SQL commands to bulk insert CSVs into tables
├── insert_products.sql             
├── insert_stores.sql             
├── insert_transactions.sql
├── License                       # Open source license
├── olap_schema.sql               # sql scripts to build olap system
├── Oltp_schema.sql               # Sql scripts to build OLTP System
├── README.md                     # Project documentation
└── Reflection Question.md        # Markdown file on reflections

##  Collaborators

**Group 8 – DSA2040A (Lab Two)**  

| Name                        | Student ID | GitHub Username       |
|-----------------------------|------------|------------------------|
| Snit Teshome                | 670552     | [@SnitTeshome](https://github.com/SnitTeshome)  
| Halima Mohammed             | 670315     | [@halima-04](https://github.com/halima-04)  
| Julie Koki                  | 669996     | [@juli3333](https://github.com/juli3333)  
| Lesala Phillip Monaheng     | 669218     | [@Lesala](https://github.com/Lesala)  
| Mohamed Mohamed             | 670006     | [@mohayo8](https://github.com/mohayo8)  

---

##  Reflection & Discussion

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

##  Repository URL

[https://github.com/SnitTeshome/Retail-oltp-olap-integration](https://github.com/SnitTeshome/Retail-oltp-olap-integration)

---

##  License

This project is licensed under the **MIT License**. See the `LICENSE` file for details.