CREATE DATABASE retail_analysis;
USE retail_analysis;

show tables from retail_analysis;

-- Data Cleaning

rename table `retail sales` to retail_sales;

select * from retail_sales;

select count(*) from retail_sales;

alter table retail_sales
change column `ï»¿transactions_id` transaction_id int;

alter table retail_sales
change column `quantiy` quantity int;


select * from retail_sales
where
transaction_id is null
or
sale_date is null
or
sale_time is null
or 
customer_id is null
or 
gender is null
or 
age is null
or 
category is null
or 
quantity is null
or 
price_per_unit is null
or 
cogs is null
or 
total_sale is null;

delete from retail_sales
where
transaction_id is null
or
sale_date is null
or
sale_time is null
or 
customer_id is null
or 
gender is null
or 
age is null
or 
category is null
or 
quantity is null
or 
price_per_unit is null
or 
cogs is null
or 
total_sale is null;

-- Data Exploration

select count(distinct customer_id)
from retail_sales;

select distinct category from retail_sales;

-- Data Analysis

-- 1. Write the query to retrive all columns for sales made on '2022-11-05'

select *
from retail_sales
where sale_date = '2022-11-05';

-- 2. write a query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

select *
from retail_sales
where 
	category = 'Clothing'
    and
    date_format(sale_date, '%Y-%M') = '2022-11'
    and
    quantity >= 3;
    
    -- 3. Write a query to calculate the total sales (total_sale) for each category. 
    
    select category,
    sum(total_sale) as total_sales,
    count(*) as total_orders
    from retail_sales
    group by category;
    
-- 4. Write a query to find the average age of customers who purchased items from the 'Beauty' category
    
select category,
    round(avg(age), 2) as avg_age
    from retail_sales
    where category = 'Beauty'
    group by category;
    
-- 5. Write a query to find all transactions where the total_sale is greater than 1000. 
    
select count(*)
from retail_sales
where total_sale > 1000;
-- 6. Write a query to find the total number of transactions (transaction_id) made by each gender in each category

select
	category,
    gender,
    count(transaction_id) as total_trans
from retail_sales
group by category, gender
order by category;

-- 7. Write a query to calculate the average sale for each month. find out best selling month in each year

select * from
(
	select
	extract(year from sale_date) as year,
    extract(month from sale_date) as month,
    round(avg(total_sale), 2) as avg_sale,
    rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc) as rnk
from retail_sales
group by 1, 2
) as t1
where rnk = 1;

-- 8. Write a query to find out the top 10 customers based on the highest total sales

select
	customer_id,
    sum(total_sale) as total_sales
from retail_sales
group by 1
order by 2 desc
limit 10;

-- 9. Write a query to find the unique number of customers who purchased items from each category

select
	category,
    count(distinct customer_id) as unique_customers
from retail_sales
group by category;

-- Write a query to create each shift and number of orders (Example Morning <= 12, Afternoon between 12 & 17, Evening > 17)

with hourly_sale
as
(
select *,
	case
		when extract(hour from sale_time) < 12 then 'Morning'
        when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
        else 'Evening'
	end as shift
from retail_sales
)
select
	shift,
    count(transaction_id) as total_orders
from hourly_sale
group by shift;