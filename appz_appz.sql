use northwind;

-- SELECT, FROM AND WHERE CLAUSE WITH  OPERATORS

-- 1. return the name of our employees and the day they were hired
select firstname, lastname, hiredate
from employees;

-- 2. return the name, country and city of our customers and the
-- name of their representative.
select companyname, city, country, contactname
from customers;

-- return the names and title of courtesy of our UK employees.
select firstname, lastname, titleofcourtesy,country
from employees
where country = 'UK';

-- return the names, birthdate and city of employees earning
-- above 2000 usd.

select firstname, lastname, birthdate, city, salary
from employees
where salary > 2000;

-- MULTIPLE CONDITIONS

-- return the list of orders sent to Canada with freight cost
-- above 300 dollars

select orderid, freight, shipcountry
from orders
where shipcountry = 'Canada' and freight > 300;

-- return the orders sent to US, UK, france and mexico

select orderid, freight, shipcountry
from orders
where shipcountry in ('Uk','USA','France','Mexico');

-- HANDLING DATE RANGE

-- return the orders sent to canada in the second half of 1997
select orderid, shippeddate, shipcountry
from orders
where (shipcountry = 'Canada') and
	(shippeddate between '1997-07-01' and '1997-12-31');





