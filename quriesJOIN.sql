select * from sales;

select * from people;

-- join method
SELECT s.SaleDate, s.Amount, p.Salesperson, s.SPID, p.SPID
FROM sales s
JOIN people p on p.SPID = s.SPID;

select s.SaleDate, s.Amount, pr.Product
from sales s
left join products pr on pr.PID = s.PID;

-- multiple table join 
select s.SaleDate, s.Amount, p.Salesperson, pr.product
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID = S.PID;

-- add condition
select s.SaleDate, s.Amount, p.Salesperson, pr.product, p.team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID = S.PID
where s.amount < 500 and p.Team = 'Delish'; -- or change amount or team

select s.SaleDate, s.Amount, p.Salesperson, pr.product, g.Geo
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID = S.PID
join geo g on g.geoid = s.geoid
where g.Geo in ('New Zealand', 'India');

-- order by amount
select s.SaleDate, s.Amount, p.Salesperson, pr.product, p.team, g.geo
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID = S.PID
join geo g on g.GeoID = s.GeoID
where s.amount < 500  
and p.Team = 'Delish'
and g.Geo in ('New Zealand', 'India')
order by Amount desc;
