--  select and from clause --

-- 1. return the names and unitprice of all our products
select productname, unitprice
from product;

-- 2. return the firstname, lastname and country of our employees
select firstname, lastname, country
from employee;

-- 3. return the names, city and country of our customers

select companyname, contactname, city, country
from customer;

-- Exercise--
-- 1. return the shipperid, companyname and number 
-- of our shipping companies
-- 2. return the birthdate, hiredate and managerid of our employees

-- WHERE, OPERATORS AND PATTERN MATCHING.
use levels;

-- 1. return the shipperid, companyname and number 
-- of our shipping companies

select shipperid, companyname, phone
from shipper;

-- return the names, title ad city of all our USA employees

select firstname, lastname, title , city,country
from employee
where country = 'USA';

-- return the name, title and birthdate of all the employees with CEO title
select firstname, lastname, birthdate, title
from employee
where title = 'CEO';

-- return the orderid, shippeddate and city of all orders
-- with freight cost above $200 

select orderid, shippeddate, shipcity, freight
from salesorder
where freight > 200;

-- return the orderid, shipname and address of all orders sent in 2006
select orderid, shipname, shipaddress, shippeddate
from salesorder
where shippeddate between '2006-01-01' and '2006-12-31';


-- return the orderid, shipname and address of orders sent on the 10th of december
-- 2006
select orderid, shipname, shipaddress, shippeddate
from salesorder
where shippeddate = '2006-12-11';

-- Logical operators aka multiple conditions
-- AND, OR, NOT
-- return the names of every female sales representative from the USA

select firstname, lastname, title, country, titleofcourtesy
from employee
where title = 'Sales Representative' and country = 'USA'
	and (titleofcourtesy = 'Mrs.' or titleofcourtesy = 'Ms.');

-- return the orderdate, orderid, country and freight cost of orders with
-- freight below 200k sent to USA or Canada in december 2006

select orderdate, orderid, shipcountry, freight
from salesorder
where freight < 200 and (shipcountry = 'USA' or shipcountry = 'Canada') and
	(shippeddate between '2006-12-01' and '2006-12-31');
    
-- exercise
/*
Looking at the Orders table, there’s a field called
ShipCountry. Write a query that shows the OrderID,
CustomerID, and ShipCountry for the orders where the
ShipCountry is either France or Belgium.
*/








