select * from sales;

select SaleDate, Amount, Customers from sales;

select Amount, Customers, GeoID from sales;

select SaleDate, Amount, Boxes, Amount/ Boxes from sales;

-- modify column name
select SaleDate, Amount, Boxes, Amount/ Boxes as 'Amount per box' from sales;

--  list of sales where as amount is greater than 10000
select * from sales
where Amount > 10000;

-- That list going to be order by amount
select * from sales
where Amount > 10000
order by Amount;

-- order  various columns
select * from sales
where geoid ='g1'
order by pid, amount desc;

-- add more conditions
Select * from sales 
where amount > 10000 and SaleDate >='2022-01-01';

select  saleDate, Amount from sales
where amount > 10000 and year(saleDate) = 2022
order by amount desc;

-- 0 to 50 boxes
select * from sales
where Boxes > 0  and Boxes  <= 50;

-- another format
select * from sales 
where Boxes between 0 and 50;

select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of week'
from sales
WHERE weekday(SaleDate) = 4;


select * from people;

-- filter by team
SELECT  * FROM people
WHERE Team = 'Delish' or team = 'Jucies';

-- another format
select * from people
where team in ('Delish', 'Jucies');

select * from people
where Salesperson like '%B%';

select * from sales;

select  SaleDate, Amount, 
		case when amount < 1000 then 'Under 1k'
			 when amount < 5000 then 'Under 5k'
             when amount < 10000 then 'Under 10k'
		else '10k or more'
        end as 'Amount category'
from sales;



-- homework problems
-- 1. print details of shipments(sales) where amounts are > 2000 and boxes are <100?
select * from sales
where amount > 2000 and boxes < 100;

-- 2. How many shipments (sales) each of the sales persons had in the month of january 2022?
select p.Salesperson, count(*) as 'Sales count'
from sales s
join people p on p.spid = s.spid
where SaleDate between '2022-01-01' and  '2022-01-31'
group by Salesperson;

-- 3. Which product sells more boxes? Milk Bars or Eclairs?
select pr.product, count(*) as 'Sales count'
from sales s
join products pr on pr.pid = s.pid
where pr.Product in ('Milk Bars', 'Eclairs')
group by pr.product;

-- 4. Which product sold more boxes in the first 7 days of february 2022? Milk Bars or Eclairs?
select pr.product, sum(Boxes) 'Total boxes'
from sales s
join products pr on pr.pid = s.pid
where pr.product in ('Milk Bars', 'Eclairs') 
and s.SaleDate between '2022-02-01' and '2022-02-07'
group by pr.product;

-- 5. Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?
select *, 
case when weekday(saleDate) = 2 then 'wednesday shipment'
else "" end as 'Wen sales'
from sales s
where s.Customers < 100 and s.Boxes < 100;

-- Hard problems
-- 1. What are the names of salespersons who had at least one sale in the first 7 days of january 2022?
select distinct p.Salesperson
from sales s
join people p on p.spid = s.spid
where SaleDate between '2022-01-01' and '2022-01-07'
