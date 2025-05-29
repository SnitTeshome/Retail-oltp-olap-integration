 --Query: Calculate total revenue per month from sales data
-- This query aggregates the revenue from the fact_sales table,
-- grouping the results by the month from the dim_date dimension table.
SELECT d.month, SUM(fs.revenue) AS total_revenue
FROM dbo.fact_sales fs
JOIN dbo.dim_date d ON fs.date_id = d.date_id
GROUP BY d.month
ORDER BY d.month;
