--  CREATED DATABSE SALES
USE SALES;

-- CUSTOMERS TABLE 
SELECT*FROM customers;

-- PRODUCTS TABLE
select*FROM products;

-- ORDERS TABLE
select*from orders;

-- TOP 3 CUSTOMERS
select
customers.customer_id,
customers.customer_name,
count(orders.order_id) as total_order
from customers
join orders
on customers.customer_id=orders.customer_id
group by customers.customer_id,customers.customer_name
order by total_order desc
limit 3;

-- GRAND TOTAL AND TOTAL ORDERS
select sum(total_amount), count(order_id) from orders;

-- PRODUCTS REVENUE BY CATEGORY
select 
products.category,
count(orders.order_id) as total_order,
sum(total_amount) as total_revenue
from products
join orders
on products.product_id=orders.product_id
group by products.category
order by total_revenue , total_order desc;

-- MOST SOLD PRODUCTS
select
products.product_name,
sum(orders.quantity) as total_quantity
from products
join orders
on products.product_id=orders.product_id
group by products.product_name
order by total_quantity desc;

-- DAILY SALES
select
orders.order_date,
sum(orders.total_amount) as daily_sales
from orders
group by orders.order_date
order by orders.order_date;

-- AVERAGE DELIVERY TIME
select avg(datediff(delivery_date,order_date)) as avg_delivery_days from orders;






