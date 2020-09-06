/*Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together.
Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)*/
select c.customerId,
c.firstName||''||c.LastName as FullName,
c.address,
UPPER (c.city||''||c.country)
from customers c

