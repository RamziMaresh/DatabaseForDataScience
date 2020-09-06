/*Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together.
Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)*/
select c.customerId,
c.firstName||''||c.LastName as FullName,
c.address,
UPPER (c.city||''||c.country)
from customers c

/*}reate a new employee user id by combining the first 4 letters of the employee’s first name with the 
first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.*/
select c.firstName
,SUBSTR(c.firstName,1,4) AS FSN
,c.lastName
,substr(c.lastName,1,2) AS LSN 
,LOWER (substr(c.FirstName, 1, 4) || substr(c.LastName,1,2)) as NewID
from customers c

                                            
/*Show a list of employees who have worked for the company for 15 or 
more years using the current date function. Sort by lastname ascending.*/
select e.Firstname,e.lastName,e.BirthDate,
Date('now') - e.BirthDate as Age,
DATE('now') - e.HireDate as Hire
from Employees e
where Hire >= 15
order by e.lastName asc
                                            
/*Profiling the Customers table, answer the following question.*/
select *
from Customers c
where c.Company is null 
                                            
/*Find the cities with the most customers and rank in descending order.*/
select c.City, count(c.CustomerId)
from Customers c
group by c.City
order by count(c.CustomerId) DESC

/*Create a new customer invoice id by combining a customer’s invoice id with their first and last name 
 while ordering your query in the following order: firstname, lastname, and invoiceID.*/ 
 select c.FirstName || c.LastName || i.InvoiceId as NewInvoiceId
from Customers c
left join Invoices i
on c.CustomerId = i.CustomerId
where NewInvoiceId like 'AstridGruber%'
order by c.FirstName, c.LastName, i.InvoiceId                                           
