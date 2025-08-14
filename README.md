# 🛍 Retail Sales Data Analysis (MySQL)

## 📌 Project Overview
This project focuses on analyzing a retail sales dataset using **MySQL**.  
The dataset contains transactional information such as sales date, time, customer details, product categories, quantity sold, and revenue generated.  

The goal is to explore the dataset, clean it, and perform SQL queries to extract meaningful business insights.

---

## 📂 Dataset Information
The dataset used in this project is stored in a MySQL table named `retail_sales`.

### **Key Columns**
- `transactions_id` – Unique ID for each transaction  
- `sale_date` – Date of the sale  
- `sale_time` – Time of the sale  
- `customer_id` – Unique customer identifier  
- `gender` – Gender of the customer  
- `age` – Age of the customer  
- `category` – Product category (e.g., Clothing, Electronics, Beauty)  
- `quantity` – Number of items sold  
- `price_per_unit` – Price per item  
- `cogs` – Cost of goods sold  
- `total_sale` – Total sale value for the transaction  

---

## 🛠 Tools & Technologies
- **MySQL** – Data storage & query execution
- **MySQL Workbench** – Query editor & visualization
- **Excel/CSV** – Data source before importing into MySQL
- **GitHub** – Version control & sharing

---

## 📊 SQL Operations Performed
The project covers:
1. **Data Import & Cleaning**
   - Removed BOM (`ï»¿`) characters from CSV before import
   - Renamed tables and columns for consistency
   - Checked for NULL values
2. **Data Exploration**
   - Total sales count
   - Filtering by category, date, quantity
   - Aggregations by month and year
3. **Business Insights**
   - Top-selling categories
   - Sales trends over time
   - High-value customer identification
4. **Date Formatting in MySQL**
   - Used `DATE_FORMAT()` for monthly/yearly grouping
   - Replaced PostgreSQL `TO_CHAR()` with MySQL-friendly syntax

---

## 📜 Example Queries

**1. Find total number of sales records**
```sql
SELECT COUNT(*) AS sales_number
FROM retail_sales;

2. Sales in Clothing category for Nov 2022 with quantity > 4
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantity > 4;

🚀 How to Run

Clone this repository:

git clone https://github.com/<your-username>/retail_sales_mysql.git


Import the dataset into MySQL:

Open MySQL Workbench

Use Table Data Import Wizard to load the CSV file

Run the SQL scripts from the retail_sales.sql file.

📈 Insights Gained

Identified top-performing product categories.

Observed seasonal trends in sales.

Found high-value customers based on total purchase amount.

Learned the importance of data cleaning before importing into MySQL.
