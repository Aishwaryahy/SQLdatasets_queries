/*TASK 01
A. Describe the data in hand in your own words.
Table 01:       cust_dimen: It consists of all the details of customers
				Customer_Name (TEXT): Name of the customer
        		Province (TEXT): Province of the customer
        		Region (TEXT): Region of the customer
        		Customer_Segment (TEXT): Segment of the customer
				Cust_id (TEXT): Unique Customer ID	

Table 02:       market_fact: It consists of all the details of every order item sold
				Ord_id (TEXT): Order ID
				Prod_id (TEXT): Prod ID
				Ship_id (TEXT): Shipment ID
				Cust_id (TEXT): Customer ID
				Sales (DOUBLE): Sales from the Item sold
				Discount (DOUBLE): Discount on the Item sold
        		Order_Quantity (INT): Order Quantity of the Item sold
        		Profit (DOUBLE): Profit from the Item sold
        		Shipping_Cost (DOUBLE): Shipping Cost of the Item sold
        		Product_Base_Margin (DOUBLE): Product Base Margin on the Item sold
        
Table 03: 		orders_dimen: Details of every order placed by the customers.
				Order_ID (INT): Order ID
				Order_Date (TEXT): Order Date
        		Order_Priority (TEXT): Priority of the Order
        		Ord_id (TEXT): Unique Order ID
	
Table 04:		prod_dimen: The details of product category and sub category of each and every product.
				Product_Category (TEXT): Product Category
        		Product_Sub_Category (TEXT): Product Sub Category
				Prod_id (TEXT): Unique Product ID
	
Table 05:		shipping_dimen: The details of all the shipping orders of the products
				Order_ID (INT): Order ID
        		Ship_Mode (TEXT): Shipping Mode
        		Ship_Date (TEXT): Shipping Date
        		Ship_id (TEXT): Unique Shipment ID

B. Identify and list the Primary Keys and Foreign Keys for this dataset
Table 01:		cust_dimen
				Primary Key: Cust_id
        		Foreign Key: Not Available
	
Table 02:		market_fact
				Primary Key: Not Available
        		Foreign Key: Ord_id, Prod_id, Ship_id, Cust_id
	
Table 03:		orders_dimen
				Primary Key: Ord_id
				Foreign Key: Not Available

Table 04:		prod_dimen
				Primary Key: Prod_id, Product_Sub_Category
				Foreign Key: Not Available
	
Table 05:		shipping_dimen
				Primary Key: Ship_id
				Foreign Key: Not Available*/
                
use superstores;
show tables;

select * from cust_dimen;

/*1st query*/
select Customer_name AS 'Customer Name',Customer_segment AS 'Customer Segment'
from cust_dimen;

/*2nd query*/
Select * 
From cust_dimen
order by cust_id DESC; 

select * from orders_dimen;

/*3rd query*/
select Order_ID ,order_Date,order_Priority
from orders_dimen
where Order_Priority ='HIGH';
Select * from market_fact;

/*4th query*/
select sum(sales) AS Total_sales,avg(sales) AS Avg_sales
from market_fact;

/*5th query*/
select Max(sales) as max, min(sales) as min
from market_fact;

/*6th query*/
Select Region ,Count(cust_id) As No_of_customers
from cust_dimen
group by region
order by Count(cust_id) desc;

/*7th query*/
Select Region ,Count(cust_id) As No_of_customers
from cust_dimen
group by region
order by Count(cust_id) desc limit 1;

/*8th query*/
SELECT 
    c.customer_name, COUNT(*) AS no_of_tables_purchased
	FROM
    market_fact m
	INNER JOIN cust_dimen c 
    ON m.cust_id = c.cust_id
	WHERE
    c.region = 'atlantic'
	AND m.prod_id = ( SELECT 
						prod_id
						FROM
						prod_dimen
						WHERE
						product_sub_category = 'tables'	)
	GROUP BY m.cust_id, c.customer_name;


select * from prod_dimen;
select * from cust_dimen;
select * from market_fact;
  
/*9th query*/
select Customer_name,customer_segment
from Cust_dimen
where province="ontario" and customer_segment="small business";

/*10th query*/
select prod_id,count(prod_id) as number_of_product_sold
from market_fact
group by prod_id
order by number_of_product_sold Desc;

select * from prod_dimen;
/*11th query*/
select prod_id,product_sub_category
from prod_dimen
where product_category in ("furniture","Technology");

select * from cust_dimen;
select * from prod_dimen;
select * from orders_dimen;
select * from market_fact;
select * from shipping_dimen;
select * from cust_dimen;
/*12th query*/
select c.product_category, m.profit 
from market_fact m
INNER JOIN prod_dimen c 
	ON c.prod_id = m.prod_id
    group by c.product_category
    order by m.profit desc;
    
/*13th query*/
select c.product_sub_category,c.product_category, m.profit
from prod_dimen c
inner join market_fact m
	on c.prod_id=m.prod_id
    group by c.product_sub_category;
    
/*14th query*/
Select s.order_date as Date,p.order_quantity As Quantity,p.sales as Sales
from market_fact p
join orders_dimen s
	on p.ord_id=s.ord_id;
    
/*15th query*/
select customer_name 
from cust_dimen
where customer_name like "_r%" or customer_name like "___d%";

/*16th query*/
select c.cust_id,c.customer_name,p.sales,c.region
from cust_dimen c,market_fact p 
where c.cust_id=p.cust_id
and p.sales between 1000 and 5000;

/*17th query*/

SELECT sales as 3rd_highest
 FROM market_fact
 ORDER BY sales DESC LIMIT 2,1;
 select * from prod_dimen;

 /*18th query*/
 SELECT 
    c.region, COUNT(distinct s.ship_id) AS no_of_shipments, SUM(m.profit) AS profit_each_region
	FROM
    market_fact m
	INNER JOIN
    cust_dimen c ON m.cust_id = c.cust_id
	INNER JOIN
    shipping_dimen s ON m.ship_id = s.ship_id
	INNER JOIN
    prod_dimen p ON m.prod_id = p.prod_id
	WHERE
    p.product_sub_category IN 
    (	SELECT 	/* Query for identifying the least profitable sub-category*/
		p.product_sub_category
        FROM
		market_fact m
		INNER JOIN
		prod_dimen p ON m.prod_id = p.prod_id
        GROUP BY p.product_sub_category
        HAVING SUM(m.profit) <= ALL
				(	SELECT 
					SUM(m.profit) AS profits
					FROM
					market_fact m
					INNER JOIN
					prod_dimen p ON m.prod_id = p.prod_id
					GROUP BY p.product_sub_category
				)
			)
	GROUP BY c.region
	ORDER BY profit_each_region DESC;

 