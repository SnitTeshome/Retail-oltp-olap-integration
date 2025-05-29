USE OLAP_schema;
GO

INSERT INTO fact_sales (product_id, store_id, date_id, quantity_sold, revenue)
SELECT 
    t.product_id,
    t.store_id,
    d.date_id,
    t.quantity,
    t.quantity * p.price AS revenue
FROM 
    OLTP_schema.dbo.transactions AS t
JOIN 
    OLTP_schema.dbo.products AS p ON t.product_id = p.product_id
JOIN 
    OLAP_schema.dbo.dim_date AS d ON t.transaction_date = d.full_date;
GO
