# **_Reflection Questions and Answers_**

---

### **_1. Why is the OLTP system normalized and the OLAP system denormalized?_**

OLTP systems are normalized to reduce data redundancy and ensure data integrity during transactional operations. This structure supports fast, accurate inserts, updates, and deletes by organizing data into multiple related tables.

OLAP systems, on the other hand, are denormalized to simplify complex queries and enhance read performance for analytical processing. Denormalization reduces the number of joins required when querying large datasets, which improves speed and supports efficient reporting and analysis.

---

### **_2. What challenges would you face if you ran analytical queries directly on the OLTP system?_**

Running analytical queries on an OLTP system presents several challenges:

- OLTP databases are optimized for fast, small transactions—not complex, long-running queries— could cause slowdowns.
- Analytical queries may cause locking and blocking, which can interrupt or slow down operational tasks.
- OLTP systems typically lack historical and aggregated data, which limits the ability to perform trend or comparative analysis.

---

### **_3. How can automation (e.g., scheduled ETL jobs) help in a real-world data pipeline?_**

Automation through scheduled ETL (Extract, Transform, Load) jobs offers several advantages:

- It  ensures data is regularly and reliably updated without manual intervention, reducing errors and operational overhead.
- It enables timely access to fresh, consistent data for reporting and analysis, which supports informed decision-making.
- Automated pipelines are scalable and consistent, making it easier to handle increasing data volumes and complex transformation tasks.
