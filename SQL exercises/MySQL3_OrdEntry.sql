/* MySQL3_OrdEntry.sql */
-- Problem_01: List all columns of the Product table for
-- products costing more than $50. Order the result by
-- product manufacturer (ProdMfg) and product names. (6 rows)
select ProdNo, ProdName, ProdMfg, ProdQOH, ProdPrice, ProdNextShipDate
from product
Where ProdPrice > 50
order by ProdMfg, ProdName

-- Problem_02: List the customer number, the name (first
-- and last), the city, and the balance of customers who
-- reside in Denver with a balance greater than $150 or who
-- reside in Seattle with balance greater than $300. (4 rows)
select CustNo, CustFirstName, CustLastName, CustCity, CustBal
from customer
where (Custcity = "Denver" and CustBal>150) or (Custcity = "Seattle" and CustBal>300)

-- Problem_03: List the columns of the OrderTbl table for
-- phone orders placed in January 2030. A phone order has
-- an associated employee. (13 rows)
select distinct OrdNo, EmpFirstName, EmpLastName
from ordertbl, employee
where ordertbl.EmpNo = employee.EmpNo and year(OrdDate) = 2030 and month(OrdDate) = 01

-- Problem_04: List all columns of Product table that
-- contain the words Ink Jet in the product name. (3 rows)
select ProdNo, ProdName, ProdMfg, ProdQOH, ProdPrice, ProdNextShipDate
from product
where ProdName like "%Ink Jet%"

-- Problem_05: List the order number, order date, and
-- customer number of orders placed after January 23,
-- 2030, shipped to Washington recipients. (4 rows)
select OrdNo, OrdDate, CustNo
from ordertbl
where (year(OrdDate)>2030 or month(OrdDate)>01 or day(OrdDate)>23) and OrdState = "WA"

-- Problem_06: List the order number, order date, customer number,
-- and name (first and last) of orders placed in January 2030
-- by Colorado customers (CustState) but sent to Washington
-- recipients (OrdState). Use INNER JOIN style. (3 rows)
select OrdNo, OrdDate, Customer.CustNo, CustFirstName, CustLastName
from OrderTbl inner join Customer
  on OrderTbl.CustNo = Customer.CustNo
where (year(OrdDate) = 2030 and month(OrdDate) = 01) and CustState = "CO" and OrdState = "WA"

-- Problem_07: List the order number, order date, customer number,
-- customer name (first and last), employee number, and employee
-- name (first and last) of January 2030 orders placed by
-- Colorado customers. Use INNER JOIN style. (5 rows)
select OrdNo, OrdDate, Customer.CustNo, CustFirstName, CustLastName, Employee.EmpNo, EmpFirstName, EmpLastName
from (OrderTbl inner join Customer
  on OrderTbl.CustNo = Customer.CustNo) inner join Employee
  on OrderTbl.EmpNo = Employee.EmpNo
Where (year(OrdDate) = 2030 and month(OrdDate) = 01) and CustState = "CO"

-- Problem_08: List the employee number, name (first and last),
-- and phone of employees who have taken orders in January 2030
-- from customers with balances greater than $300. Remove
-- duplicate rows (if any) from the result. Use INNER JOIN
-- style. (4 rows)
select distinct Employee.EmpNo, EmpFirstName, EmpLastName, EmpPhone
from (OrderTbl inner join Customer
  on OrderTbl.CustNo = Customer.CustNo) inner join Employee
  on OrderTbl.EmpNo = Employee.EmpNo
where (year(OrdDate) = 2030 and month(OrdDate) = 01) and CustBal>300

-- Problem_09: List the average balance and number of customers
-- by city. Only include the customers residing in Washington
-- state (WA). Eliminate cities in the result with less than
-- two customers. (2 rows)
select avg(CustBal) as AvgBal, CustCity, count(*) as NumCust
from customer
where CustState = "WA"
group by CustCity
having NumCust>=2

-- Problem_10: List the order number and total amount for orders
-- placed on January 23, 2030. The total amount of an order is the
-- sum of the quantity times the product price of each product on
-- the order. Use INNER JOIN style. (6 rows)

select ordertbl.OrdNo, sum(Qty * ProdPrice) as totalamount
from (OrderTbl inner join Orderline
  on OrderTbl.OrdNo = Orderline.OrdNo) inner join Product
  on orderline.ProdNo = product.ProdNo
where (year(OrdDate) = 2030 and month(OrdDate) = 01 and day(OrdDate)=23)
group by OrdNo
