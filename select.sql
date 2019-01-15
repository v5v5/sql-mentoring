--select 1
select customers.Name, cities.Name 
from FitnessClub.dbo.Customers as customers, FitnessClub.dbo.Cities as cities
where customers.CityId = cities.Id

--select 2
select c.Name, 
	(select count(*) from FitnessClub.dbo.Tickets as t where c.Id = t.CustomerId) as 'Count tickets'
from FitnessClub.dbo.Customers as c

--select 3
select cities.Name,
	(select count(*) from FitnessClub.dbo.Customers as customers where cities.Id = customers.CityId) as 'Count customers'
from FitnessClub.dbo.Cities as cities

--select 4
select u.Name,
stuff((SELECT ','+convert(nvarchar(3),RoleId)
               FROM FitnessClub.dbo.UsersRoles
               FOR XML PATH(''), TYPE).value('.', 'varchar(max)')
            ,1,1,'')
from FitnessClub.dbo.Users as u

select u.Name, stuff((SELECT ','+convert(nvarchar(20),RoleId)
               FROM FitnessClub.dbo.UsersRoles
               FOR XML PATH(''), TYPE).value('.', 'varchar(max)')
            ,1,1,'')
from FitnessClub.dbo.Users as u

select concat(CONVERT(VARCHAR(3),RoleId),',')
from FitnessClub.dbo.UsersRoles as ur

select u.Name, ur.RoleId
from FitnessClub.dbo.Users as u
join FitnessClub.dbo.UsersRoles as ur on u.Id = ur.RoleId




FitnessClub.dbo.Users as u
FitnessClub.dbo.UsersRoles as ur
FitnessClub.dbo.Roles as r


select c.Name, count(t.Id) as CountTickets
from FitnessClub.dbo.Customers as c, FitnessClub.dbo.Tickets as t
where (c.Id = t.CustomerId) and (CountTickets > 1)
group by c.Name

select c.Name, count(*)
from FitnessClub.dbo.Customers as c
inner join FitnessClub.dbo.Tickets as t





select c.Name, 
	(select Name + ',') from FitnessClub.dbo.Roles for xml path (''))
from FitnessClub.dbo.Customers as c



