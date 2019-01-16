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
select cities.Name, count(customers.CityId) as CountCustomers
from FitnessClub.dbo.Customers as customers
--cross join FitnessClub.dbo.Customers as customers on cities.Id = 
full outer join FitnessClub.dbo.Cities as cities on cities.Id = customers.CityId 
group by cities.Name

--select 4
select u.Name,
stuff((SELECT ','+convert(nvarchar(3),RoleId)
               FROM FitnessClub.dbo.UsersRoles
               FOR XML PATH(''), TYPE).value('.', 'varchar(max)')
            ,1,1,'')
from FitnessClub.dbo.Users as u

select u.Name, stuff((select ','+convert(nvarchar(20),RoleId)
               from FitnessClub.dbo.UsersRoles as ur
				where u.Id=ur.UserId
               for xml path(''), type).value('.', 'varchar(max)')
            ,1,1,'')
from FitnessClub.dbo.Users as u
-- will change using join
-- concat
--...

--select 5
select c.Name, 
	(select count(Id) from FitnessClub.dbo.Tickets as t where c.Id = t.CustomerId) as Count
from FitnessClub.dbo.Customers as c
where (select count(Id) from FitnessClub.dbo.Tickets as t where c.Id = t.CustomerId) > 1
-- will change using join + group by
--...
