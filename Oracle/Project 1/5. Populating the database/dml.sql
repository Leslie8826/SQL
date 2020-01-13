/* 1ST TABLE TO POPULATE */
/* POPULATING HR2_REGION */
insert into hr2_region(region_id, region_name)
    select distinct region_id, region_name 
    from hr_stage
    where region_id is not null

/* OUTPUT FOR HR2_REGION CAN BE SEE WITH THE FOLLOWING */
select * from hr2_region



/* 2ND TABLE TO POPULATE */
/* POPULATING HR2_COUNTRY */
insert into hr2_country(country_id, country_name, region_id)
    select distinct country_id, country_name, region_id
    from hr_stage

/* OUTPUT FOR HR2_COUNTRY CAN BE SEE WITH THE FOLLOWING */
select * from hr2_country


/* 3RD TABLE TO POPULATE */
/* POPULATING HR2_LOCATION */
insert into hr2_location(location_id, street_address, postal_code, city, state_province, country_id)
    select distinct location_id, street_address, postal_code, city, state_province, country_id
    from hr_stage
    
/* OUTPUT FOR HR2_LOCATION CAN BE SEE WITH THE FOLLOWING */
select * from hr2_location


/* 4TH TABLE TO POPULATE */
/* POPULATING HR2_DEPARTMENT */
insert into hr2_department(department_id, department_name, manager_id, location_id)
    select distinct department_id, department_name, manager_id, location_id
    from hr_stage

/* OUTPUT FOR HR2_DEPARTMENT CAN BE SEE WITH THE FOLLOWING */
select * from hr2_department


/* 6TH TABLE TO POPULATE */
/* POPULATING HR2_JOB_HIST */
insert into hr2_job_hist(employee_id, start_date, end_date, job_id, department_id)
    select distinct employee_id, start_date, end_date, job_id, department_id
    from hr_stage
    
    select * from hr2_job_hist

