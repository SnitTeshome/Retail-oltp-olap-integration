
-- dim_date
CREATE TABLE dim_date (
    date_id INT IDENTITY(1,1) PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);
 

-- dim_product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- dim_store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL
);

-- fact_sales
CREATE TABLE fact_sales (
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    date_id INT NOT NULL,
    quantity_sold INT NOT NULL,
    revenue DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_fact_sales PRIMARY KEY (product_id, store_id, date_id),
    CONSTRAINT FK_fact_sales_product FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    CONSTRAINT FK_fact_sales_store FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    CONSTRAINT FK_fact_sales_date FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);
