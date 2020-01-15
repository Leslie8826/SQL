/* In this analysis, we query the database we created earlier */
/* We also visualize the resulted data using tableau */
/* See the screeshots of tableau for each query attached in the analysis folder */


/* Q1. Display details of jobs where the minimum salary is greater than 10000.*/
select *
from hr2_job
where min_salary>10000


/* Q2. Display the first name and join date of the employees who joined between 1998 and
1999.*/
select first_name, hire_date 
from hr2_employee
where hire_date > '01-JAN-98' and hire_date < '31-DEC-99'


/* Q3. Display first name and join date of the employees who is either IT Programmer or Sales
Man. */
select hr2_employee.first_name, hr2_employee.hire_date, hr2_job.job_title
from hr2_employee
inner join hr2_job
on hr2_employee.job_id = hr2_job.job_id
where job_title like 'Sal%' or job_title like 'Prog%'


/* Q4. Display employees who joined after 1st January 2000. */
select first_name, last_name, hire_date
from hr2_employee
where hire_date > '01-JAN-2000'


/* Q5. Display details of employee with ID 150 or 160. */
select *
from hr2_employee
where employee_id=150 or employee_id=160


/* Q6. Display first name, salary, commission pct, and hire date for employees with salary less than 10000. */
select distinct first_name, salary, commission_pct, hire_date
from hr2_employee
where salary<10000


/* Q7. Display job Title, the difference between minimum and maximum salaries for jobs with
max salary in the range 10000 to 20000. */
select job_title, (max_salary-min_salary)
from hr2_job
where max_salary < 20000 and max_salary > 10000


/* Q8. Display first name, salary, and round the salary to thousands. */
select first_name, round(salary, -3)
from hr2_employee


/* Q9. Display details of jobs in the descending order of the title. */
select * 
from hr2_job
order by job_title desc

