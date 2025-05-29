**1. Why is the OLTP system normalized and the OLAP system denormalized?**

OLTP (Online Transaction Processing) systems are **normalized** to:
- Reduce data redundancy.
- Ensure data integrity.
- Support efficient insert, update, and delete operations.

OLAP (Online Analytical Processing) systems are **denormalized** to:
- Improve query performance.
- Reduce the number of joins in complex analytical queries.
- Enable fast aggregation and reporting.

---

**2. What challenges would you face if you ran analytical queries directly on the OLTP system?**

Running analytical queries on an OLTP system can lead to several issues:
- Performance degradation for transactional operations.
- Locking and blocking issues, affecting user experience.
- Resource contention between transactional and analytical workloads.
- Incomplete or inconsistent data if analytics run during ongoing transactions.
- Scalability limitations for complex, long-running queries.

### 3. How can automation (e.g., scheduled ETL jobs) help in a real-world data pipeline?

Automation in data pipelines plays a crucial role in ensuring efficiency and reliability. Specifically, it:

- Ensures timely and consistent data movement from source systems to data warehouses.  
- Reduces manual effort and human error.  
- Enables data transformation and cleaning at scale.  
- Supports regular updates for dashboards and reports.  
- Helps maintain data freshness and reliability for decision-making.
