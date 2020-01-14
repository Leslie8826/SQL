/* In this analysis, we query the database we created earlier */
/* We also visualize the resulted data using tableau */
/* See the screeshots of tableau for each query attached in the analysis folder */

/* 1. Display details of jobs where the minimum salary is greater than 10000.*/
select *
from hr2_job
where min_salary>10000
