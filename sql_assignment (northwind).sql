use test_northwind;
show tables;
select * from products ;

/*1st Query*/
select ProductName,QuantityPerUnit
from products;

/*2nd Query*/
select ProductID,ProductName 
from products
where Discontinued=0;

/*3rd query*/
select ProductID,ProductName 
from products
where Discontinued=1;

Select * from products;

/*4th Query*/
SELECT ProductName, UnitPrice 
FROM Products 
ORDER BY UnitPrice DESC;

/*5th query*/
select productID,ProductName,UnitPrice
from products
where discontinued =0  and UnitPrice<20;

/*6th query*/
select productID,ProductName,UnitPrice
from products
where UnitPrice between 15 and 25 ;

/*7th query*/
select ProductName,UnitPrice
from products
where UnitPrice>(select avg(UnitPrice)from products)
order by UnitPrice;

/*8th query*/
select ProductName'Top_10',UnitPrice
From Products
order by UnitPrice DESC Limit 10;

/*9th Query*/
Select count(ProductName) 
from products
group by discontinued;
select * from products;

/*10th query*/
select ProductName,unitsONOrder,UnitsInStock
from products
where UnitsinStock<UnitsOnOrder;
