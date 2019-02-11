--select 1
--version 1
select customers.Name, cities.Name 
from FitnessClub.dbo.Customers as customers, FitnessClub.dbo.Cities as cities
where customers.CityId = cities.Id
--version 2 - using by join
select customers.Name, cities.Name
--select *
from FitnessClub.dbo.Customers as customers
join FitnessClub.dbo.Cities as cities on customers.CityId = cities.Id
--cross join FitnessClub.dbo.Cities as cities

--select 2
--version 1
select c.Name, 
	(select count(*) from FitnessClub.dbo.Tickets as t where c.Id = t.CustomerId) as 'Count tickets'
from FitnessClub.dbo.Customers as c
order by Name
--version 2 - using by join
select Name, count(Name) as CountTickets
from FitnessClub.dbo.Customers as c
--cross join FitnessClub.dbo.Tickets as t
inner join FitnessClub.dbo.Tickets as t on c.Id=t.CustomerId
group by Name
order by Name

--select 3
--version 1
select cities.Name,
	(select count(*) from FitnessClub.dbo.Customers as customers where cities.Id = customers.CityId) as 'Count customers'
from FitnessClub.dbo.Cities as cities
--version 2 - using by join
--select *
select *--cities.Name, count(customers.CityId) as CountCustomers
from FitnessClub.dbo.Customers as customers
--cross join FitnessClub.dbo.Customers as customers on cities.Id = 
right join FitnessClub.dbo.Cities as cities on cities.Id = customers.CityId 
--full outer join FitnessClub.dbo.Cities as cities on cities.Id = customers.CityId 
--group by cities.Name

select *--cities.Name, count(customers.CityId) as CountCustomers
from FitnessClub.dbo.Customers as customers
--cross join FitnessClub.dbo.Customers as customers on cities.Id = 
left join FitnessClub.dbo.Cities as cities on cities.Id = customers.CityId 
--full outer join FitnessClub.dbo.Cities as cities on cities.Id = customers.CityId 
--group by cities.Name

select c.Name, count(cus.name)
from cities c
left join customers cus on cus.CityId  = c.id
group by c.name

select c.Name, count(cus.name)
from customers cus
right join cities c on cus.CityId  = c.id
group by c.name


--select 4
--version 1
select u.Name,
stuff((SELECT ','+convert(nvarchar(3),RoleId)
               FROM FitnessClub.dbo.UsersRoles
               FOR XML PATH(''), TYPE).value('.', 'varchar(max)')
            ,1,1,'')
from FitnessClub.dbo.Users as u

--*** задача повышеной сложности
select u.Name,	stuff((select ','+convert(nvarchar(20),r.Name)
				from FitnessClub.dbo.UsersRoles as ur
				inner join FitnessClub..Roles as r on ur.RoleId = r.Id
				where u.Id=ur.UserId
				for xml path(''), type).value('.', 'varchar(max)'),1,1,'')
from FitnessClub.dbo.Users as u

--select 5
-- version 1
select c.Name, 
	(select count(Id) from FitnessClub.dbo.Tickets as t where c.Id = t.CustomerId) as Count
from FitnessClub.dbo.Customers as c
where (select count(Id) from FitnessClub.dbo.Tickets as t where c.Id = t.CustomerId) > 1

-- version 2 - using by join + group by
select c.Name, count(c.Name)
from FitnessClub.dbo.Customers as c
--cross join FitnessClub.dbo.Tickets as tickets
inner join FitnessClub.dbo.Tickets as t on c.Id = t.CustomerId
group by c.Name
having count(c.Name)>1
order by c.Name

--select 6
select c.Name, Max(t.CreatedOn) as 'Last Ticket'
from FitnessClub..Customers as c
full join FitnessClub..Tickets as t on c.Id = t.CustomerId
group by c.Name

--select 7
select Id, Name from FitnessClub..Customers
union 
select Id, Name from FitnessClub..TicketTypes
union 
select Id, Name from FitnessClub..Cities

--select 8
select convert(date, CreatedOn) as Date, count(Id) as 'Count'
from FitnessClub..Tickets
group by cast(CreatedOn as date)

select concat(datepart(yyyy, CreatedOn), '-', datepart(mm, CreatedOn), '-', datepart(dd, CreatedOn)) as Date, count(Id) as 'Count'
from FitnessClub..Tickets
group by datepart(yyyy, CreatedOn), datepart(mm, CreatedOn), datepart(dd, CreatedOn)

--select 9
select * 
from FitnessClub..Customers
where Name like '%1%'

--select 10
select * 
from FitnessClub..Customers
where Name like '%4__'

--select 11
-- IN, EXISTS

--select 12
go
create procedure yyyymmdd_proc(@datetime_v datetime, @ymd nvarchar(10) output)
as
begin
	set @ymd = concat(datepart(yyyy, @datetime_v), '-', datepart(mm, @datetime_v), '-', datepart(dd, @datetime_v))
	return
end

go
create function yyyymmdd_func(@datetime_v datetime)
returns nvarchar(10)
as begin
	declare @ymd nvarchar(10)
	set @ymd = concat(datepart(yyyy, @datetime_v), '-', datepart(mm, @datetime_v), '-', datepart(dd, @datetime_v))
	return @ymd
end
go

--select OBJECT_ID('yyyymmdd_proc', CreatedOn), count(Id) as 'Count'
--from FitnessClub..Tickets
--group by datepart(yyyy, CreatedOn), datepart(mm, CreatedOn), datepart(dd, CreatedOn)
--group by OBJECT_ID('yyyymmdd_proc', CreatedOn)

select OBJECT_ID('yyyymmdd_proc', CreatedOn) as Date, count(Id) as 'Count'
from FitnessClub..Tickets
group by OBJECT_ID('yyyymmdd_proc', CreatedOn)

declare @MYDATE DATETIME = GETDATE()
declare @date_var nvarchar(10) 
EXEC yyyymmdd_proc @MYDATE, @ymd = @date_var output;
print @date_var

declare @MYDATE DATETIME = GETDATE()
declare @date_var nvarchar(10) 
@date_var EXEC yyyymmdd_func @MYDATE
print @date_var

