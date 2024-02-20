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
    
    
-- joins
/*
inner join
left join
right join
self join
*/
-- returns the name of the top five most productive 
-- employees in terms of number of orders
select firstname, lastname, count(orderid) as no_of_orders
from orders
join employees on employees.employeeid = orders.employeeid
group by firstname,lastname
order by no_of_orders desc
limit 5;

-- write a query that returns the number of orders sold and
-- revenue generated from all the cities in the US.
select shipcity, count(o.orderid) as no_orders, 
	sum(unitprice * quantity) as revenue
from orders as o
join `order details` as od on od.orderid = o.orderid
where shipcountry = 'USA'
group by shipcity;

-- write a query that returns the top 10 most expensive orders, the
-- customers they were sold to and the employees responsible for 
-- the sales.

select c.companyname, e.firstname, 
	e.lastname, 
    ((od.unitprice * od.quantity) - od.discount) as total_cost
from `order details` od
join orders o on o.orderid = od.orderid
join customers c on c.customerid = o.customerid
join employees e on e.employeeid = o.employeeid
order by total_cost desc
limit 10;

-- return the total cost of the most expensive order sent
-- to each country.
select o.shipcountry, max(od.unitprice * od.quantity) as total_cost
from orders o
join `order details` od on od.orderid = o.orderid
group by shipcountry;

-- return the names of all the companies that has never bought
-- anything from us
select c.companyname
from orders o 
right join customers c on c.customerid = o.customerid
where orderid is null;

-- self join --
-- return the names of employees and the name of their manager 

select e.firstname as staff, m.firstname as manager
from employees e
left join employees m on m.employeeid = e.reportsto;

-- write a query that returns the details of employees
-- that earns more than their manager and by what percentage.
select e.EmployeeID
from employees e
join employees m on m.employeeid = e.reportsto
where e.salary > m.salary;

-- SUBQUERIES --
-- write a query that returns the names of employees
-- that earn above average salary
select firstname, lastname, salary
from employees
where salary > (
	select avg(salary)
    from employees);
    
-- return the names of all the companies 
-- that has never bought
-- anything from us
select companyname
from customers 
where not customerid in (
	select distinct CustomerID
    from orders
);
-- return the top 10 best performing cities in terms
-- of number of orders and the percentage contribution 
-- of that city.
select shipcity, count(orderid) as no_of_orders,
	(count(orderid)/(
    select count(orderid)
    from orders)) * 100 as percentage_contrib
from orders
group by ShipCity
order by no_of_orders desc
limit 10;

-- return the name employees and the number of times
-- they are responsible for sending a late order.
select firstname, lastname, count(firstname) as no_of_times
from (
	select e.firstname, e.lastname, 
		o.requireddate, o.shippeddate
	from orders o
	join employees e on e.EmployeeID = o.EmployeeID
	where (o.ShippedDate > o.RequiredDate) and
    e.EmployeeID in (
		select e.EmployeeID
		from employees e
		join employees m on m.employeeid = e.reportsto
		where e.salary > m.salary
    )) as temp_table
group by firstname, lastname
order by no_of_times desc;


-- return the number of times an employee that earns more than
-- their manager has sent a late order. Also return the names of
-- those employees

select e.employeeid
from employees e
join employees m on m.EmployeeID = e.ReportsTo
where e.salary > m.salary;






select orderid, shipcountry, shipcity
from orders
where orderid in (
	select orderid
    from `order details`
    where UnitPrice * quantity > (
		select avg(UnitPrice* Quantity)
        from `order details`
    )
);

