-- Switch to the OLAP database
USE olap_schema;
GO

-- Insert into dim_date from OLTP
INSERT INTO dim_date (full_date, day, month, year)
SELECT DISTINCT
    transaction_date AS full_date,
    DAY(transaction_date) AS day,
    MONTH(transaction_date) AS month,
    YEAR(transaction_date) AS year
FROM oltp_schema.dbo.transactions;
GO

-- Insert into dim_product from OLTP
INSERT INTO dim_product (product_id, name, category)
SELECT DISTINCT
    product_id,
    name,
    category
FROM oltp_schema.dbo.products;
GO

-- Insert into dim_store from OLTP
INSERT INTO dim_store (store_id, name, region)
SELECT DISTINCT
    store_id,
    name,
    region
FROM oltp_schema.dbo.stores;
GO
