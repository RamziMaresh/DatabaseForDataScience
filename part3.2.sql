Module 3 Coding Assignment

/*Using a subquery, find the names of all the tracks for the album "Californication".*/
select name 
from tracks 
where albumId IN(select AlbumId from albums 
where title= "Californication")  

/*Find the total number of invoices for each customer along with the customer's full name, city and email.*/
SELECT SUM(i.InvoiceID) AS totalnumber, c.FirstName, c.city, c.Email
From Invoices i INNER JOIN Customers c
ON i.CustomerID = c.CustomerID
GROUP BY c.CustomerID

/*Retrieve the track name, album, artistID, and trackID for all the albums.*/
SELECT t.Name, t.TrackId, a.Title, a.ArtistId
From Albums a LEFT JOIN Tracks t
ON a.AlbumId = t.AlbumId

/*Retrieve a list with the managers last name, and the last name of the employees who report to him or her*/
SELECT M.LastName AS Manager_LN,
E.LastName AS Employee_LN
FROM Employees E, Employees M
WHERE E.ReportsTo = M.EmployeeID

/*Find the name and ID of the artists who do not have albums*/
select a.name, a.ArtistId 
from artists a
left join albums b ON a.ArtistId = b.ArtistId
where b.title is null

/*Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.*/
SELECT FirstName, LastName
FROM Employees
UNION
SELECT FirstName, LastName
FROM Customers
ORDER BY LastName DESC

/*See if there are any customers who have a different city listed in their billing city versus their customer city.*/
select c.CustomerId, c.FirstName, c.LastName, c.City
from Customers c
join Invoices i
on c.CustomerId = i.CustomerId
where c.City <> i.BillingCity
