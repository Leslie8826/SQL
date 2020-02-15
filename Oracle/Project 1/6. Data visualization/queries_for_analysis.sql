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


/* Q14. Display first name and experience of the employees. */
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


/* Q16. Display first name and last name after converting the first letter of each name to upper
case and the rest to lower case. */
select initcap(first_name || ' ' || last_name) full_name_employee
from hr2_employee
where last_name is not null


/*Q17. Display the first word in job title. */
select job_title, substr(job_title, 1, instr(job_title, ' ')-1)
from hr2_job
where job_title is not null


/* Q20. Display employees who joined before the year 2000 */
select employee_id, last_name, first_name, hire_date
from hr2_employee
where extract(year from hire_date) < 2000


/* 22. Display how many employees joined in each month of year 1997. */
select extract(month from hire_date) month_in_year_1997, count(employee_id) nb_employees_hired
from hr2_employee
where hire_date < '31-DEC-1997' and hire_date > '01-JAN-1997'
group by extract(month from hire_date)
order by month_in_year_1997 asc


/* Q23. Display manager ID and number of employees managed by the manager. */
select count(employee_id) nb_employee, manager_id
from hr2_employee
group by manager_id


/* Q25. Display number of employees joined after 15th of the month. */
select count(employee_id) number_of_employee
from hr2_employee
where extract(day from hire_date) > 15


/* Q26. Display the country ID and number of cities we have in the country. */
select country_id, count(city) number_of_cities
from hr2_location
group by country_id


/* Q30. Display years in which more than 10 employees joined. */
select count(employee_id) as nb_of_employees, extract(year from hire_date) as year_of_hire_date
from hr2_employee
group by hire_date
having count(employee_id) > 10


/* Q31. Display departments in which more than five employees have commission percentage.*/
select department_name, count(employee_id) nb_of_employees
from hr2_employee
inner join hr2_department
on hr2_employee.department_id = hr2_department.department_id
where commission_pct is not null
group by hr2_department.department_name
having count(employee_id) > 5


/* 32. Display employee ID for employees who did more than one job in the past. */
select employee_id, count(job_id) nb_of_jobs
from hr2_job_hist
group by employee_id
having count(job_id) > 1


/* 33. Display job ID of jobs that were done by more than 3 employees for more than 100 days. */
select hr2_job.job_id, count(hr2_employee.employee_id) nb_of_days_in_jobs
from hr2_job
inner join hr2_employee
on hr2_job.job_id = hr2_employee.job_id
inner join hr2_job_hist
on hr2_job.job_id = hr2_job_hist.job_id
where (end_date - start_date) > 100
group by hr2_job.job_id
having count(hr2_employee.employee_id) > 3


/* Display department ID, year, and Number of employees joined. */
select department_id, extract (year from hire_date) as year_hired, count (employee_id) as number_of_employees
from hr2_employee
where extract (year from hire_date) is not null
group by extract (year from hire_date), department_id


/* 41. Display department name and number of employees in the department. */
select distinct hr2_department.department_name, count(hr2_employee.employee_id) nb_of_employees
from hr2_department
inner join hr2_employee
on hr2_department.department_id = hr2_employee.department_id
group by hr2_department.department_name


/* 43. Display department name and manager first name. */
select hr2_employee.last_name, hr2_employee.first_name, hr2_department.department_name, 
       hr2_employee.job_id, hr2_job.job_title
from hr2_employee
inner join hr2_department
on hr2_employee.manager_id = hr2_department.manager_id
inner join hr2_job
on hr2_employee.job_id = hr2_job.job_id
where hr2_employee.job_id like '%MGR%' or hr2_employee.job_id like '%MAN%'


/* 46. Display job title, department name, employee last name, starting date for all jobs from
2000 to 2005. */
select hr2_job.job_title, hr2_department.department_name, hr2_employee.last_name, hr2_job_hist.start_date
from hr2_employee
inner join hr2_job
on hr2_employee.job_id = hr2_job.job_id
inner join hr2_job_hist
on hr2_job.job_id = hr2_job_hist.job_id
inner join hr2_department
on hr2_department.department_id = hr2_job_hist.department_id
where extract (year from start_date) > 2000 and extract (year from start_date) < 2005


/* 47. Display job title and average salary of employees */
select hr2_job.job_title, avg(hr2_employee.salary)
from hr2_employee
inner join hr2_job
on hr2_employee.job_id = hr2_job.job_id
group by hr2_job.job_title


/* 68. Display the details of employees drawing the highest salary in the department. */
select distinct department_name, department_id, greatest(salary) highest_salary_in_department
                , last_name, first_name, job_title
from hr2_employee
inner join hr2_job on hr2_employee.job_id = hr2_job.job_id
inner join hr2_department using (department_id) -- performs an inner join between hr2_employee table and hr2_department table on the condition that hr2_employee.department_id is equal to hr2_department.department_id
where salary is not null
order by greatest(salary) asc


/* 69. Display the city of employee whose employee ID is 105. */
select hr2_location.city, hr2_employee.last_name, hr2_employee.first_name, hr2_employee.employee_id
from hr2_employee
inner join hr2_department
on hr2_employee.manager_id = hr2_department.manager_id
inner join hr2_location
on hr2_department.location_id = hr2_location.location_id
where hr2_employee.employee_id = 105


/* 70. Display third highest salary of all employees */
select * from (
    select distinct salary
    from hr2_employee
    where salary is not null
    order by salary desc
) where rownum <= 3;

