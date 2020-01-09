/* 1ST TABLE TO POPULATE */
/* POPULATING HR2_REGION */
insert into hr2_region(region_id, region_name)
    select distinct region_id, region_name 
    from hr_stage
    where region_id is not null

/* OUTPUT FOR HR2_REGION */
select * from hr2_region



/* 2ND TABLE TO POPULATE */
/* POPULATING HR2_COUNTRY */
insert into hr2_country(country_id, country_name, region_id)
    select distinct country_id, country_name, region_id
    from hr_stage

/* OUTPUT FOR HR2_COUNTRY */
select * from hr2_country
