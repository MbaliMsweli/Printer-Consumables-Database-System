# Printer Consumables Database System (SQL Server)
## Project Overview

In this project, I built a complete database system from scratch for a company that sells printer consumables such as toners and ink cartridges.

The entire system was designed, developed, and tested using SQL Server Management Studio (SSMS). After testing and validating the SQL scripts, I pushed all code to GitHub for version control.

#### This workflow allowed me to:

Keep the project structured

Track changes using GitHub

Follow real-world database development best practices

Write clean, re-runnable SQL scripts

This project reflects how databases are designed and implemented in real business environments.

## Step 1: Data Modeling (Planning Before Coding)

Before writing any SQL code, I first designed the data model.

This was my first time designing a complete data model, so while it may not be 100% perfect, it helped me understand how real databases are planned before implementation.

#### The system was designed around the following entities:

Suppliers

Companies

Products

Customers

Orders

Payments

Shipping

Stock

#### This step is important because:

It reduces duplicate data

It makes relationships clear

It prevents structural problems later

It acts as a blueprint before building the database

Data modeling is like drawing a blueprint before building a house.

## Step 2: Creating the Database in SSMS

#### After completing the data model, I created the database named:

SandavTonerDB

The database creation script:

Checks if the database already exists

Creates it only if it does not exist

#### This ensures:

The script is re-runnable

It prevents errors if the database already exists

It follows safe deployment practices

Since the data is created and validated internally in this project, there was no need for a staging database. Data integrity is controlled using data types, keys, and constraints.

## Step 3: Creating Tables with Re-runnable Scripts

All tables were created using scripts that:

First check if the table exists

Only create the table if it does not exist

For example, the CompanyOrderItem table:

Has a Primary Key to uniquely identify each record

Includes Foreign Keys to maintain relationships

Uses correct data types

Uses NOT NULL constraints where required

Why This Approach Is Important

#### This method:

Prevents duplicate tables

Maintains data integrity

Supports re-runnable SQL scripts

Follows real-world database best practices

## Step 4: Creating a DIM Date Table

I created a DIM Date table to centralize all date-related logic.

#### This table stores:

Date

Month

Year

Quarter

Weekday

Weekend indicator

Other calendar attributes

Why a DIM Date Table Is Important

Avoids recalculating date logic in every query

Makes reporting easier

Improves performance

Keeps date logic consistent

It allows analysis such as:

Total sales per month

Orders per year

Payments per quarter

Weekday vs weekend activity

The DIM Date script is fully re-runnable, meaning it can be executed multiple times without creating duplicate data.

## Step 5: Adding LoadDate and LastRunCheckDate

I updated tables to include two important tracking columns:

LoadDate → Shows when the data was first loaded

LastRunCheckDate → Shows when the table was last updated or checked

After adding these columns using ALTER TABLE, I populated them using UPDATE statements.

### Why This Is Important

##### This supports:

Data freshness tracking

Auditing

Troubleshooting

Future automation

Monitoring data reliability

Tracking load dates is a common real-world data engineering practice.

## Step 6: Creating Joins and Views

#### After inserting the data, I created different SQL joins:

INNER JOIN

LEFT JOIN

FULL OUTER JOIN

Joins allow data from multiple related tables to be combined into meaningful business insights.

From these joins, I created views.

### What a View Does

#### A view:

Saves complex join logic

Simplifies reporting

Allows reusable queries

Makes data easier to access

Views help present structured business insights without rewriting complex SQL.

## Step 7: Creating Stored Procedures

#### I created stored procedures to handle:

Table creation

Data insertion

Updates

A stored procedure is a saved SQL script that can be executed whenever needed.

#### Benefits of Stored Procedures

Avoid rewriting SQL code

Make database operations repeatable

Reduce human errors

Centralize business logic

Support automation

Re-runnable & Duplicate-Safe Insert Logic

#### One of the most important features of this project is that my insert logic:

Prevents duplicate data from being inserted

Ensures data warehouse tables do not contain repeated records

Can be run multiple times safely

#### This means:

If the insert script is executed again, it will not duplicate existing records

The database remains clean and reliable

The system behaves like a production-ready data warehouse

This is a critical best practice in real-world data engineering.

### What I Learned

Through this project, I learned how to:

Design a structured relational database

Apply normalization (1NF, 2NF, 3NF)

Create safe, re-runnable SQL scripts

Enforce data integrity using keys and constraints

Track data loading using audit columns

Combine tables using joins

Simplify access using views

Use stored procedures for automation

Manage and version control SQL code using GitHub

This project helped me move beyond writing basic queries and start thinking like a database developer and data engineer.

# Tools Used

Microsoft SQL Server

SQL Server Management Studio (SSMS)

draw io

GitHub (Version Control)
