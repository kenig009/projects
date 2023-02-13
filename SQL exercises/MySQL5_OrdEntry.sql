/* MySQL5_OrdEntry.sql */
-- Problem_01: List the order number, the order date, the
-- customer number, the customer name (first and last),
-- the customer state, and the shipping state (OrdState) in
-- which the customer state differs from shipping state. (3 rows)
select Distinct OrdNo, OrdDate, Customer.CustNo, CustFirstName, CustLastName, CustState, OrdState
from ordertbl inner join customer
	ON ordertbl.CustNo = customer.CustNo
where CustState <> OrdState

-- Problem_02: List the product name and the price of all products
-- ordered by Beth Taylor in January 2030. (4 rows)
select ProdName, ProdPrice
from ordertbl inner join customer
  on ordertbl.CustNo = customer.CustNo inner join orderline
  on ordertbl.ordNo = orderline.ordNo inner join product
  on orderline.prodNo = product.prodNo
Where CustFirstName = "Beth" and CustLastName = "Taylor" and year(OrdDate) = "2030" and month(OrdDate) = "01"

-- Problem_03: List the employee number, the employee name
-- (first and last), and total amount of commissions on orders
-- taken in January 2030. The amount of a commission is the
-- sum of the dollar amount of products ordered times the
-- commission rate of the employee. (6 rows)
select distinct employee.EmpNo, EmpFirstName, EmpLastName, sum(EmpCommRate * (ProdPrice*Qty)) as EmpTotComm
from employee inner join ordertbl
  on employee.EmpNo = ordertbl.EmpNo inner join orderline
  on orderline.ordNo = ordertbl.ordNo inner join product
  on product.ProdNo = orderline.prodNo
where year(OrdDate) = "2030" and month(OrdDate) = "01"
group by employee.EmpNo

-- Problem_04: For January 2030 orders by Colorado customers,
-- find the number of Connex products placed by order. The
-- result should include the order number, customer last name
-- and the number of Connex products ordered. (3 rows)
select ordertbl.ordNo, CustLastName, count(*) as ConnexNo
from ordertbl inner join customer
  on ordertbl.custNo = customer.custNo inner join orderline
  on orderline.ordNo = ordertbl.ordNo inner join product
  on product.prodNo = orderline.ProdNo
Where CustState = "CO" and ProdMfg = "Connex"
group by CustFirstName

-- Problem_05: For each employee with a commission rate of less
-- than 0.04, compute the number of orders taken in January 2030.
-- The result should include the employee number, employee last
-- name, and number of orders taken. (3 rows)
select employee.EmpNo, EmpLastName, count(*) as NumOrders
from employee inner join ordertbl
  on employee.EmpNo = ordertbl.EmpNo
where EmpCommRate < 0.04 and year(OrdDate) = "2030" and month(OrdDate) = "01"
group by EmpNo

-- Problem_06: List the product number, product name, sum of
-- the quantity of products ordered, and the total order amount
-- (sum of the product price times the quantity) for orders
-- placed in January 2030. Only include products that have
-- more than five products ordered in January 2030. Sort the
-- result in descending order of the total amount. (3 rows)
select product.prodNo, ProdName, sum(Qty) as OrdTotQty, sum(ProdPrice*Qty) as OrdTotAmt
from ordertbl inner join orderline
  on orderline.ordNo = ordertbl.ordNo inner join product
  on product.prodNo = orderline.ProdNo
where year(OrdDate) = "2030" and month(OrdDate) = "01"
group by prodNo
having sum(qty)>5
order by OrdTotAmt DESC

-- Problem_07: For each employee with commission rate greater
-- than 0.03, compute the total commission earned from orders
-- taken in January 2030. The total commission earned is the
-- total order amount times the commission rate. The result
-- should include the employee number, employee last name, and
-- the total commission earned. (3 rows)
select employee.EmpNo, EmpLastName, sum(EmpCommRate * (ProdPrice*Qty)) as EmpTotComm
from employee inner join ordertbl
  on employee.EmpNo = ordertbl.EmpNo inner join orderline
  on orderline.ordNo = ordertbl.ordNo inner join product
  on product.ProdNo = orderline.prodNo
where EmpCommRate > 0.03 and year(OrdDate) = "2030" and month(OrdDate) = "01"
group by EmpNo

-- Problem_08: List the customer number, customer name (first
-- and last), the sum of the quantity of products ordered,
-- and the total order amount (sum of the product price times
-- the quantity) for orders placed in January 2030. Only include
-- products in which the product name contains "Ink Jet" or "Laser".
-- Only include the customers who have ordered two or more of
-- these products, sorted descending on total quantity. (5 rows)
select customer.CustNo, CustFirstName, CustLastName, sum(Qty) as OrdTotQty, sum(ProdPrice*Qty) as OrdTotAmt
from ordertbl inner join customer
  on ordertbl.custNo = customer.custNo inner join orderline
  on orderline.ordNo = ordertbl.ordNo inner join product
  on product.prodNo = orderline.ProdNo
where year(OrdDate) = "2030" and month(OrdDate) = "01" and (ProdName like "%Ink Jet%" or ProdName like "%Laser%")
group by CustNo
having sum(qty)>=2
order by sum(qty) DESC

-- Problem_09: Create a multiple table view, named Comm_Emp_Cust_Ord,
-- showing customer name, balance, order dates, and employee names
-- for employees with commission of 0.04 or higher. (6 rows)
create view Comm_Emp_Cust_Ord (CustLastName, CustFirstName, CustBal, OrdDate, EmpLastName, EmpFirstName) as
  select customer.CustLastName, customer.CustFirstName, customer.CustBal, ordertbl.OrdDate, employee.EmpLastName, employee.EmpFirstName
  from employee inner join ordertbl
    on employee.EmpNo = ordertbl.EmpNo inner join customer
    on ordertbl.custNo = customer.custNo
  where EmpCommRate >=0.04

-- Problem_09 (cont.): Create a query using this view to show customer
-- names, balance and order dates for orders taken by Johnson. (2 rows)
select CustLastName, CustFirstName, CustBal, OrdDate
from Comm_Emp_Cust_Ord
where EmpLastName = "Johnson"

-- Problem_10: Create a grouping view, named Product_Summary, to
-- summarize the total sales by product, and make to use the
-- following names: ProductName, ManufName, and TotalSales. (10 rows)
create view Product_Summary (ProductName, ManufName, TotalSales) as
  select ProdName, ProdMfg, sum(ProdPrice*Qty)
  from ordertbl inner join customer
    on ordertbl.custNo = customer.custNo inner join orderline
    on orderline.ordNo = ordertbl.ordNo inner join product
    on product.prodNo = orderline.ProdNo
  group by ProdName

-- Problem_10 (cont.): Create a grouping query on this view to summarize
-- the number of products and sales by manufacturer, sorted descending
-- on total sales. (6 rows)
select ManufName, sum(Qty) as NumProd, TotalSales
from Product_Summary, orderline
group by ManufName
order by TotalSales desc

-- Problem_11: List all employees that have not taken any orders.
-- Include the employee number, first and last name, and the number
-- of his or her supervisor. (1 row)
select employee.EmpNo, EmpFirstName, EmpLastName, SupEmpNo
from employee inner join ordertbl
  on employee.EmpNo = ordertbl.EmpNo
having sum(OrdNo) = 0

-- Problem_12: List the customer that have order lines with more than one
-- Connex product using two nested Type I queries. Include customer first
-- and last name in the result and sort by customer last name. (2 rows)
select CustFirstName, CustLastName
from ordertbl inner join customer
	on ordertbl.custNo = customer.custNo inner join orderline
	on orderline.ordNo = ordertbl.ordNo inner join product
	on product.prodNo = orderline.ProdNo
where orderline.prodNo in(
	select product.ProdNo
	from product
	where ProdMfg = "Connex"
)
group by CustLastName
having count(*)>2



-- Problem_13: List all the customers who did not shop in January, 2030
-- using a Type II subquery. Include customer number, first and last
-- name and sort by customer last name. (3 rows)

Select distinct C1.CustNo, CustFirstName, CustLastName
from Customer C1 inner join OrderTbl O1
 on C1.CustNo = O1.CustNo
Where not exists(
select o2.CustNo
from OrderTbl O2
 where OrdDate between '2030-01-01' and '2030-01-31' and o2.CustNo = C1.CustNo)


-- Problem_14: List all the customers that have ONLY shopped online
-- using a Type II subquery. Include customer number, first and last
-- name and sort by customer last name. (3 rows)
select distinct c1.CustNo, CustFirstName, CustLastName
from Customer C1 inner join ordertbl O1
	on c1.custNo = o1.CustNo
where not exists(
	select o2.CustNo
	from ordertbl O2
	where EmpNo is not null and c1.custNo = o2.CustNo
	group by CustLastName
)
