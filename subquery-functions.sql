-- SUBQUERY --

-- return the names of employees that earn above average salary


select firstname, lastname, salary
from employees 
where salary > (
    SELECT avg(salary)
    from employees
);


-- query that returns the name of customers that has never patronized us.

select contactname, companyname, customerid
from customers
where not customerid in (
    select customerid
    from orders
);

-- query that returns the top 5 best performing countries  in terms of number of orders
-- and their percentage contribution

select shipcountry, count(orderid) as no_orders,
     concat(round(count(orderid)/(
        select count(orderid)
        from orders
     ) * 100, 0), '%') as percentage_order
from orders
GROUP BY shipcountry
ORDER BY no_orders desc
limit 5;

-- return the name of employees and their age

select concat(firstname,' ',lastname) as fullname,year(now()) - year(birthdate) as age
from employees;


-- return the orders that were delivered late and the number of days it took.

select orderid, requireddate, shippeddate, datediff(shippeddate, requireddate) as no_days
from orders
where shippeddate > requireddate;

-- assignments

-- return the name of top 5 best performing employees in terms of number of orders and
-- their percentage contribution

-- return the list of products that were not sold in Canada in 1997

