select top(5) * from orders;
select top(5) * from customers;

select top(5) order_id, customer_name, order_date from customers inner join orders on orders.customer_id=customers.customer_id; 




select top(10) * from customers;

select  * from customers order by customer_id desc;


select count(*) from customers where country='Germany';

select sum(price) from products;

select * from customers;
select count(*),country from customers group by country;


select * from customers;
select * from customers;
select count(*),country from customers group by country having count(*)>5;



select * from products;
select * from products where product_id in (5, 10, 20);

select product_id from products where category_id = 3;

select * from products where product_id in (select product_id from products where category_id = 3);

select * from order_details;
select * from customers;
select * from orders;
select * from products;

select * from order_details;
select order_id from order_details where product_id=2;
select customer_id from orders where order_id in (select order_id from order_details where product_id=2);
select * from customers where customer_id in (select customer_id from orders where order_id in (select order_id from order_details where product_id=2));


select * from employees;

create view my_employee as select first_name, last_name, gender from employees;

select * from my_employee;

drop view my_employee;


select * from test_triggers;

create trigger after_insert on test_triggers 
after insert 
	as
		select * from test_triggers;

insert into test_triggers values(3,'janith');


select * from test_triggers;
select * from customer_log;

create trigger new_trigger on test_triggers 
after insert
	as 
		begin
			declare @theId int
			select @theId = inserted.id from inserted
			insert into customer_log values(@theId, 'inserted')
		end


select * from test_triggers;
select * from customer_log;

insert into test_triggers values(4,'yasiru');


select top(10) * from customers;

create procedure get_my_records
as 
	select top(10) * from customers
go;

exec get_my_records;

create procedure get_by_country @Country varchar(20)
as
	select * from customers where country = @Country;

exec get_by_country @Country='Germany';



create function add_ten(@num as int)
returns int 
as
	begin 
		return(@num+10)
	end

select dbo.add_ten(10);

select * from employees;

create function filter_using_gender(@gender as varchar(20))
returns table
as 
	return(select * from employees where gender=@gender)

select * from dbo.filter_using_gender('M');