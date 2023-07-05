select geoID, sum(amount), avg(amount), sum(Boxes)
from sales
group by geoID;


select g.geo, sum(s.amount), avg(s.amount), sum(s.Amount)
from sales s
join geo g on g.geoID = s.geoID
group by g.Geo;

select pr.category, p.team, sum(boxes), sum(Amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
group by pr.category, p.team;

select pr.category, p.team, sum(boxes), sum(Amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
where p.team <> ''
group by pr.category, p.team
order by pr.Category, p.team;


select pr.Product, sum(s.Amount) as 'Total Amount'
from sales s
join products pr on pr.pid = s.pid
group by pr.Product
order by `Total Amount` desc
limit 10; -- limit 10 means top 10 list 