# Data Modeling Project

This project shows how data modeling is done from the beginning stage up to creating a real database using SQL. The example used is a toner and printer supplies business.

The project helps to understand how to plan data, design tables, connect them properly, insert data, and use SQL joins to get useful information.

## What is data modeling

Data modeling is the process of deciding what data to store, how to store it, and how different data items relate to each other.

It helps to reduce duplicate data, avoid errors, improve performance, and make systems easier to manage and grow.

## Levels of data modeling

### There are three main levels of data modeling.

# Conceptual data model

This is the business view of the system. It focuses on understanding what things exist in the business.

Examples of things in this project are customers, suppliers, products, orders, payments, shipping, stock, and the company.

At this stage, we only identify entities and their relationships. We do not worry about columns, data types, or SQL.

This level is usually represented using an entity relationship diagram.

# Logical data model

Here we decide what tables to create, what columns each table will have, and how tables connect using primary keys and foreign keys.

Normalization is applied here to remove duplicate data and organize tables properly.

Example tables are Customer, CustomerOrder, Product, Supplier, and Payment.

# Physical data model

At this stage we write SQL to create tables, define data types, add primary keys, foreign keys, and constraints.

This project uses SQL Server to create the physical database.

## Normalization

Normalization is the process of organizing tables to avoid data problems.

This project follows first normal form, second normal form, and third normal form.

First normal form means each column contains only one value.

Second normal form means all columns depend on the whole primary key.

Third normal form means columns depend only on the primary key and not on other non-key columns.

This ensures customer information is stored only in the customer table, product information only in the product table, and order information only in the order table.

# Project files explanation

The file named 1_create_database.sql it stores a code that creates the database.

The folder named create_tables.sql it stores a code that creates all tables such as customer, supplier, product, orders, prices, stock, payments, and shipping tables.

The folder insert_data_into_tables contains SQL codes that insert data into all tables.

The folder joins.sql contains SQL queries that use joins to combine data from multiple tables. These queries show customer orders, product sales, supplier prices, stock levels, pending orders etc.

The file Data Modelling Design.png shows the entity relationship diagram used during the conceptual and logical design stage.

### This project shows how to identify entities, design relationships, normalize tables, create SQL structures, insert data, and query data using joins.

