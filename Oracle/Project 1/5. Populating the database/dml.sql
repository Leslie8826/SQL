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


/* 3RD TABLE TO POPULATE */
/* POPULATING HR2_LOCATION */
insert into hr2_location(location_id, street_address, postal_code, city, state_province, country_id)
    select distinct location_id, street_address, postal_code, city, state_province, country_id
    from hr_stage
    
/* OUTPUT FOR HR2_LOCATION */
select * from hr2_location
