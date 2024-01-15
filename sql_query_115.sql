use northwind;

-- write a query that returns the names 
-- and birthdate of our employees

select firstname, lastname, birthdate
from employees;

-- write a query that returns the names
-- of our customers their city and country
-- of operation.
select companyname, city, country
from customers;

-- write a query that returns all the info
-- about our products
select *
from products;

-- write a query that returns the name, unitprice,
-- unitsinstock for products that cost more than
-- $10

select productname, unitprice, unitsinstock
from products
where UnitPrice > 10;

-- write a query that returns the details of orders
-- sent to the USA

select *
from orders
where ShipCountry = 'USA';

-- multiple condition

-- write a query that returns the names, birthdate,
-- and salary of male employees that earns above
-- $1500 in salary

select firstname,lastname, salary, titleofcourtesy
from employees
where salary > 1500 and 
	(TitleOfCourtesy = 'Mr.' or TitleOfCourtesy = 'Dr.');
    
-- write a query that returns the orderid, freight cost and
-- delivery address of orders sent to the US,UK canada and
-- mexico
select orderid, freight, shipaddress,shipcountry
from orders
where shipcountry in ('USA','Canada','UK','Mexico');

-- date range

-- write a query that returns the freight, orderid and
-- counttry of orders sent to the UK in first half of 1997;

select orderid, freight,shipcountry, orderdate
from orders
where ShipCountry = 'UK' and
	(OrderDate between '1997-01-01' and '1997-06-30');
    
-- match patterns 
-- write a query that returns the orderid, freight cost,
-- shipaddress and shippdate of orders sent to addresses 
-- that are avenues.

select orderid, freight, shipaddress, shippeddate
from orders
where ShipAddress like '%ave%';

-- write a query that returns the names of emloyees starting
-- with letter A.
select firstname, lastname
from employees
where FirstName like '%a';

-- 
 







