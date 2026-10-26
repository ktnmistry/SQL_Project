USE Assignment_2

SELECT * FROM JOMATO

-- 1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.
create procedure Zero_tablebooking
as
begin
select restaurantname, restauranttype, cuisinestype, TableBooking from jomato where tablebooking <> 0 
end
exec Zero_tablebooking

-- 2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.
 begin transaction
 update Jomato set CuisinesType = REPLACE(cuisinestype, 'cafe', 'cafeteria')
 rollback

-- 3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.
WITH RankedAreas AS (
SELECT ROW_NUMBER() OVER (ORDER BY MAX(Rating) DESC) AS RowNum, Area,
MAX(Rating) AS HighestRating
FROM Jomato GROUP BY Area)
SELECT * FROM RankedAreas 
WHERE RowNum <= 5;
 
-- 4. Use the while loop to display the 1 to 50.
declare @x int = 1
while @x <= 50
begin
print @x
set @x = @x + 1
end

-- 5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.
create view Top5res as
select Top 5 *
from jomato 
order by rating desc
select * from Top5res

-- 6. Create a trigger that give an message whenever a new record is inserted
create trigger trg_new_msgs
    on jomato 
    after insert
    as 
    begin
    print 'new restaurnat record has been inserted in jomato'
    end
