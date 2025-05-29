-- Top Selling Products: Retrieve top 5 products by total quantity sold
SELECT TOP 5 
    dp.name, 
    SUM(fs.quantity_sold) AS total_units
FROM 
    dbo.fact_sales fs
JOIN 
    dbo.dim_product dp ON fs.product_id = dp.product_id
GROUP BY 
    dp.name
ORDER BY 
    total_units DESC;
