select * from employee
select * from invoice
select * from customer
select * from genre
select * from artist
select * from track

select name , milliseconds
from track where milliseconds > (
select avg(milliseconds) as c from track
)
order by milliseconds desc






select artist.name , artist.artist_id , count(artist.artist_id) as c  from artist 
join album on artist.artist_id = album.artist_id
join track on track.album_id = album.album_id 
join genre on genre.genre_id = track.genre_id 
where genre.name like 'Rock'
group by artist.artist_id
order by c desc
limit 10









select customer.first_name , customer.last_name , customer.email
from genre
join track on genre.genre_id = track.genre_id
join invoice_line on invoice_line.track_id =track.track_id 
join invoice on invoice.invoice_id = invoice_line.invoice_id 
join customer on customer.customer_id = invoice.customer_id
WHERE genre.name like 'Rock'
group by customer.first_name , customer.last_name , customer.email
order by email ASC

select billing_city , sum(total) from invoice
group by billing_city
order by sum(total) desc
limit 1 

select customer.first_name,customer.last_name , sum(invoice.total ) from 
customer join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by sum(total)desc
limit 1

select first_name , levels , title from employee
order by levels desc
limit 1 ;

select count(invoice_id) as a , billing_country from invoice
group by billing_country
order by a desc
limit 5

select sum(total) , billing_city from invoice
group by billing_city 
order by sum(total) desc
limit 3

