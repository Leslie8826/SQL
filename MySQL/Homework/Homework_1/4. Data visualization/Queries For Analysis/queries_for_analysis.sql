-- ----------------------------------------
-- ----------------------------------------
-- -------- DATA VISUALIZATION ------------
-- ----------------------------------------
-- ----------------------------------------


# Q1 - How much does a bottle of morphine cost?
select itemValue
from item
where itemDescription = 'bottle of morphine';



# Q2 - Which volunteer(s), if any, do not live in New York (NY) or New Jersey (NJ) ?
select *
from volunteer
where volunteerAddress not like '%NY' and volunteerAddress not like '%NJ'
