Module 3 Coding Assignment

/*Using a subquery, find the names of all the tracks for the album "Californication".*/

select name 
from tracks 
where albumId IN(select AlbumId from albums 
where title= "Californication")  
