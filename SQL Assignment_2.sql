-- SQL ASSIGNMENT 2 
-- Tasks to be performed: 
-- DATA SET - JOMATO

-- 1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.
create procedure stuff_chicken
as 
begin
	update Jomato set RestaurantType = replace(RestaurantType, 'quick bites', 'quick chicken bites')
	where RestaurantType like '%quick bites%'
	end

exec stuff_chicken
-- 2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.
select RestaurantType, cuisinestype, No_of_Rating from Jomato 
where no_of_Rating = (select max(no_of_rating) from jomato)


-- 3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
-- start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
-- and below 3.5 and ‘Bad’ if it is below 3 star rating.
select RestaurantName,
	case
	when rating > 4 then 'excellent'
	when rating > 3.5 and rating < 4 then 'good'
	when rating > 3 and rating < 3.5 then 'average'
	else 'bad'
	end as rating_status
	from jomato

-- 4. Find the Ceil, floor and absolute values of the rating column and display the current date
-- and separately display the year, month_name and day.
select CEILING(rating) as Ceil, FLOOR(rating) as Flr, ROUND(rating,0) as absolut from Jomato
select GETDATE() as currentdate
currentdate
2025-07-19 17:48:31.250
select datepart(year, '2025-07-19 17:48:31.250') as yr, 
datepart(month, '2025-07-19 17:48:31.250') as mon, 
datepart(day, '2025-07-19 17:48:31.250') as day

-- 5. Display the restaurant type and total average cost using rollup.
select * from Jomato
select RestaurantType, AVG(averagecost) as avg_cost from Jomato
group by rollup (RestaurantType)



