# Building a Mini Data Warehouse for a Retail Chain

## Table of Contents
- [Overview](#overview)
- [Project Objective](#project-objective)
- [Tools & Technologies](#tools--technologies)
- [How to Use](#how-to-use)
- [Star Schema Overview](#star-schema-overview)
- [Repository-Folder Structure](#repository-folder-structure)
- [Collaborators](#collaborators)
- [Reflection & Discussion](#reflection--discussion)
- [Repository URL](#repository-url)
- [License](#license)

## Overview
This project builds a mini data warehouse for a fictional retail company to analyze sales performance by product, store, and time. Using a star schema design and data from CSV files, the warehouse enables the team to run analytical queries for deriving meaningful business insights.

## Project Objective
Students are required to design and build a star schema-based data warehouse, load data from CSV files, and run analytical queries to gain business insights for a retail company.

This project builds a mini data warehouse for a fictional retail company to analyze sales performance by product, store, and time. It uses a star schema model and is powered by Microsoft SQL Server.

## Tools & Technologies
- **Database**: Microsoft SQL Server  
- **Editor**: Visual Studio Code (with SQL extension)  
- **SQL Client**: SQL Server Management Studio (SSMS)  
- **Version Control**: Git and GitHub  
- **Data Format**: CSV files  

## How to Use
1. Set up a Microsoft SQL Server database.  
2. Run `Schema.sql` using SSMS Code to create all tables.  
3. Use `Loading csv files.sql` to load data from CSV files with BULK INSERT, or use the Import Wizard in SSMS.  
4. Open and execute queries from `queries.sql` to analyze key business insights like:
   - Total Revenue by Product Category
   - Monthly Sales Trends
   - Revenue by Region
   - Top Products by Quantity Sold

## Star Schema Overview

```
                      +-------------+
                      |  dim_date   |
                      +-------------+
                           |
+-------------+     +-------------+     +-------------+
| dim_store   |-----| fact_sales  |-----| dim_product |
+-------------+     +-------------+     +-------------+
```

## Repository-Folder Structure

```
├── SQL_scripts/
│   ├── schema.sql               # Table creation script (star schema)
│   ├── Loading csv files.sql    # SQL commands to bulk insert CSVs into tables  
│   ├── queries.sql              # SQL queries for analysis
│   
├── Data_set/                    # Folder containing provided CSV files: Dimension and fact data
│   ├── dim_date.csv
│   ├── dim_product.csv
│   ├── dim_store.csv
│   └── fact_sales.csv

├── Out_put_quieries/            # Result of the query as CSV files
│   ├── Total Revenue by Product Category.sql
│   ├── Monthly Sales Trends.sql
│   ├── Revenue by Region.sql
│   └── Top Products by Quantity Sold.sql

├── Insight.md                   # Insights from the queries output
├── Reflection & Discussion.md  # Reflection and discussion notes
├── README.md                    # Project documentation
└── LICENSE                      # Open source license
```

## Collaborators

**Team Members – Group 8 (DSA2040A – Lab One)**

| Name                      | Student ID | GitHub Username   |
|---------------------------|------------|-------------------|
| Snit Teshome              | 670552     | @SnitTeshome      |
| Halima Mohammed           | 670315     | @halima-04        |
| Julie Koki                | 669996     | @juli3333         |
| Lesala Phillip Monaheng   | 669218     | @Lesala           |
| Mohamed Mohamed           | 670006     | @mohayo8          |

## Reflection & Discussion

- Why use a star schema instead of a normalized schema?  
- What are the benefits of separating facts from dimensions?  
- What types of business decisions could this warehouse support?  

## Repository URL
[https://github.com/SnitTeshome/DSA-2040A-PROJECT-ONE](https://github.com/SnitTeshome/DSA-2040A-PROJECT-ONE)

## License
This project is licensed under the MIT License. See the LICENSE file for details.