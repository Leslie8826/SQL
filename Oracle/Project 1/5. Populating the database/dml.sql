/* POPULATING HR2_REGION */
insert into hr2_region(region_id, region_name)
    select distinct region_id, region_name 
    from hr_stage
    where region_id is not null

/* CHECKING THE DATA */
select * from hr2_region

