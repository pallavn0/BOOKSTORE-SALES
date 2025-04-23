select * from books
select count(*) from books
desc books
desc orders
show tables

select count(*) from orders
select count(*) from books
select count(*) from customers

select sum(case when pro_id is null then 1 else 0 end) as null_count from
(select books.book_id,books.title,orders.book_id as pro_id from books left join orders on books.book_id=orders.book_id ) as a

select books.book_id,books.title,books.stock, coalesce(sum(orders.quantity),0) as order_quantity,books.stock-coalesce(sum(orders.quantity),0) as rem_qty from
books left join orders on books.book_id=orders.book_id group by books.book_id

ALTER TABLE orders
add constraint fk_Customer_ID
FOREIGN KEY (Customer_ID)
REFERENCES customers(Customer_ID)

ALTER TABLE orders
add constraint fk_Book_ID
FOREIGN KEY (Book_ID)
REFERENCES books(Book_ID)

SELECT books.Title,books.Genre from books where Genre='Fiction'
SELECT * from books where Published_Year>1950;
select customers.name from customers where country='Canada';

select
MAX(Order_Date) as maxdate,
min(Order_Date) as mindate from orders;

select orders.Customer_ID,orders.Total_Amount from orders where Order_Date between '2023-11-01' and '2023-11-30';

select sum(stock) as total_stock from books;
select max(price) as maxrate,min(price) as minrate from books;

select books.Title,books.Author,books.Genre from books order by price desc limit 1;

select customers.name,books.Title,orders.Quantity from orders join customers on orders.Customer_ID=customers.Customer_ID join books on 
books.Book_ID=orders.Book_ID where orders.Quantity >1;

select books.title,books.Genre,customers.name,customers.Country,orders.total_amount from orders join customers on orders.Customer_ID=
customers.Customer_ID join books on books.Book_ID=orders.Book_ID where orders.Total_Amount>20;

select all(genre) from books;
select distinct(genre) from books;

select books.Title from books order by Stock limit 1;

select round(sum(orders.Total_Amount),2) as total_revenue from orders;

select books.Genre,sum(orders.Quantity) from orders join books on orders.Book_ID=books.Book_ID group by books.Genre;

select avg(price) from books where genre='fantasy';

select customer_id,count(*) as frequency  from orders group by Customer_ID order by frequency desc ;

select customers.name,orders.Customer_ID from orders join customers on orders.customer_id=customers.customer_id group by customers.name,
orders.Customer_ID having count(orders.Customer_ID)>=2;

select customers.Customer_ID , count(*) as frequency ,customers.name from orders join customers on orders.Customer_ID=customers.Customer_ID 
group by customers.Customer_ID having frequency>=2;

select count(order_id) ,customers.name from orders join customers on orders.Customer_ID=customers.Customer_ID where customers.name='Anthony Young';

select count(orders.Order_ID) as frequency,books.Book_ID from orders join books on orders.Book_ID=books.Book_ID group by
books.Book_ID having frequency=4;

select books.title,books.Price from books where books.genre='fantasy' order by price desc limit 3;

select books.author,sum(orders.quantity) as total_quantity,sum(books.price*orders.quantity) as total_revenue from orders join books on 
orders.Book_ID=books.Book_ID group by books.Author order by total_quantity desc;

select distinct customers.city,orders.Total_Amount  from orders join customers on orders.Customer_ID=
customers.Customer_ID where orders.Total_Amount> 30;

select orders.Customer_ID,count(*) as freq from orders where orders.Customer_ID=84;

select customers.Name,customers.Customer_ID,sum(orders.Total_Amount) from orders join customers on orders.Customer_ID=customers.Customer_ID
group by customers.Name,customers.Customer_ID order by sum(orders.Total_Amount) desc limit 1;

select orders.Book_ID,count(*) as freq from orders group by orders.book_id;

select a.book_name,a.stock-a.sold_quantity as remaining_stock from 
(select books.title as book_name ,books.stock as stock, sum(orders.Quantity) as sold_quantity from orders join books on orders.book_id=books.book_id group by 
books.title,books.stock) as a;

select b.Book_ID,b.title,b.stock,coalesce(sum(o.quantity),0) as 
order_quantity,b.stock-coalesce(sum(o.quantity),0) as 
remaining_quantity from books b left join orders o on 
b.Book_ID=o.Book_ID group by b.book_id order by b.Book_ID;

select books.book_id,books.title,orders.order_id from books left join orders on books.book_id=orders.book_id

select orders.order_id from orders where book_id=2



select count(*) from books



select books.Title,sum(orders.Quantity) from orders join books on orders.Book_ID=books.Book_ID where books.Book_ID=3

