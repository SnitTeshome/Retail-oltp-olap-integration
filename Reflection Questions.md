1. Why is the OLTP system normalized and the OLAP system denormalized?

OLTP (Online Transaction Processing) systems are normalized to:

Reduce data redundancy.

Ensure data integrity.

Support efficient insert, update, and delete operations.

OLAP (Online Analytical Processing) systems are denormalized to:

Improve query performance.

Reduce the number of joins in complex analytical queries.

Enable fast aggregation and reporting.

2. What challenges would you face if you ran analytical queries directly on the OLTP system?

Performance degradation for transactional operations.

Locking and blocking issues, affecting user experience.

Resource contention between transactional and analytical workloads.

Incomplete or inconsistent data if analytics run during ongoing transactions.

Scalability limitations for complex, long-running queries.