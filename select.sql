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
--version 1
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
-- version 2 - using by join + concat
--select u.Name
select u.Name, r.Name
from FitnessClub.dbo.Users as u
--cross join FitnessClub.dbo.UsersRoles as ur
inner join FitnessClub.dbo.UsersRoles as ur on u.Id = ur.UserId
--cross join FitnessClub.dbo.Roles as r
inner join FitnessClub.dbo.Roles as r on r.Id = ur.RoleId

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
select Name from FitnessClub..Customers
union 
select Name from FitnessClub..TicketTypes
union 
select Name from FitnessClub..Cities

--select 8
select CreatedOn, count(Id) as 'Count'
from FitnessClub..Tickets
group by CreatedOn


