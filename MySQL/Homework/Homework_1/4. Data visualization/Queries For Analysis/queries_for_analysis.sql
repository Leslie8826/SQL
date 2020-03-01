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


# Q3 - Which volunteers are working on open tasks?
select t1.volunteerName, t3.taskDescription, t4.taskStatusName
from volunteer as t1
inner join assignment as t2 on t1.volunteerId = t2.volunteerId
inner join task as t3 on t2.taskCode = t3.taskCode
inner join task_status as t4 on t3.taskStatusId = t4.taskStatusId
where t4.taskStatusName = 'open';
