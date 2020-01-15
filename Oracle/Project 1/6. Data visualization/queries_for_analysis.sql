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


/*  Q10. Display employees where the first name or last name starts with S. */
select *
from hr2_employee
where first_name like 'S%' or last_name like 'S%'


/* Q11. Display employees who joined in the month of May. */
select *
from hr2_employee
where extract(month from hire_date) = 5



/* Q12. Display details of the employees where commission percentage is null and salary in the 
range 5000 to 10000 and department is 50.*/
select *
from hr2_employee
where commission_pct = 0 and salary <10000 and salary > 5000  and department_id = 50



/*Q13. Display first name and date of first salary of the employees.*/
/* version 1 */
select hr2_employee.first_name, hr2_job_hist.start_date+30 first_day_salary -- salary after a month of work 
from hr2_job_hist
inner join hr2_employee
on hr2_job_hist.employee_id = hr2_employee.employee_id

/* version 2 */
select first_name, last_day(hire_date) first_day_salary -- salary at the end of the month of hire date
from hr2_employee


/* 14. Display first name and experience of the employees. */
select distinct hr2_employee.first_name, hr2_employee.last_name, hr2_job.job_title, hr2_department.department_name,
                 hr2_employee.hire_date, hr2_job_hist.start_date, hr2_job_hist.end_date
from hr2_employee
inner join hr2_job_hist on hr2_employee.employee_id = hr2_job_hist.employee_id
inner join hr2_job on hr2_employee.job_id = hr2_job.job_id
inner join hr2_department on hr2_employee.department_id = hr2_department.department_id
order by last_name asc



/* Q15. Display first name of employees who joined in 2001. */
select first_name
from hr2_employee
where extract(year from hire_date) = 2001


