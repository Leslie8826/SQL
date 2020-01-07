CREATE TABLE hr2_country (
    country_id     VARCHAR2(5 CHAR) NOT NULL,
    country_name   VARCHAR2(70 CHAR),
    region_id      NUMBER(2) NOT NULL
);

ALTER TABLE hr2_country ADD CONSTRAINT hr2_country_pk PRIMARY KEY ( country_id );

CREATE TABLE hr2_department (
    department_id     NUMBER(4) NOT NULL,
    department_name   VARCHAR2(10 BYTE),
    manager_id        NUMBER(10) NOT NULL,
    location_id       NUMBER NOT NULL
);

ALTER TABLE hr2_department ADD CONSTRAINT hr2_department_pk PRIMARY KEY ( department_id );

CREATE TABLE hr2_employee (
    employee_id      NUMBER(10) NOT NULL,
    first_name       VARCHAR2(50 CHAR),
    last_name        VARCHAR2(50 CHAR),
    email            VARCHAR2(80 CHAR),
    phone_number     VARCHAR2(25 CHAR),
    hire_date        DATE,
    job_id           VARCHAR2(20 CHAR) NOT NULL,
    salary           NUMBER(8),
    commission_pct   NUMBER(5),
    manager_id       NUMBER(10),
    department_id    NUMBER(4) NOT NULL
);

ALTER TABLE hr2_employee ADD CONSTRAINT hr2_employee_pk PRIMARY KEY ( employee_id );

CREATE TABLE hr2_job (
    job_id       VARCHAR2(20 CHAR) NOT NULL,
    job_title    VARCHAR2(50 CHAR),
    min_salary   NUMBER(10),
    max_salary   NUMBER(10)
);

ALTER TABLE hr2_job ADD CONSTRAINT hr2_job_pk PRIMARY KEY ( job_id );

CREATE TABLE hr2_job_hist (
    employee_id     NUMBER(10) NOT NULL,
    start_date      DATE,
    end_date        DATE,
    job_id          VARCHAR2(20 CHAR) NOT NULL,
    department_id   NUMBER(4) NOT NULL
);

ALTER TABLE hr2_job_hist ADD CONSTRAINT hr2_job_hist_pk PRIMARY KEY ( employee_id );

CREATE TABLE hr2_location (
    location_id      NUMBER NOT NULL,
    street_address   VARCHAR2(100 CHAR),
    postal_code      VARCHAR2(12 CHAR),
    city             VARCHAR2(50 CHAR),
    state_province   VARCHAR2(50 CHAR),
    country_id       VARCHAR2(5 CHAR) NOT NULL
);

ALTER TABLE hr2_location ADD CONSTRAINT hr2_location_pk PRIMARY KEY ( location_id );

CREATE TABLE hr2_region (
    region_id     NUMBER(2) NOT NULL,
    region_name   VARCHAR2(50 CHAR)
);

ALTER TABLE hr2_region ADD CONSTRAINT hr2_region_pk PRIMARY KEY ( region_id );

ALTER TABLE hr2_country
    ADD CONSTRAINT hr2_country_hr2_region_fk FOREIGN KEY ( region_id )
        REFERENCES hr2_region ( region_id );

ALTER TABLE hr2_department
    ADD CONSTRAINT hr2_department_hr2_employee_fk FOREIGN KEY ( manager_id )
        REFERENCES hr2_employee ( employee_id );

ALTER TABLE hr2_department
    ADD CONSTRAINT hr2_department_hr2_location_fk FOREIGN KEY ( location_id )
        REFERENCES hr2_location ( location_id );

ALTER TABLE hr2_employee
    ADD CONSTRAINT hr2_employee_hr2_department_fk FOREIGN KEY ( department_id )
        REFERENCES hr2_department ( department_id );

ALTER TABLE hr2_employee
    ADD CONSTRAINT hr2_employee_hr2_employee_fk FOREIGN KEY ( manager_id )
        REFERENCES hr2_employee ( employee_id );

ALTER TABLE hr2_employee
    ADD CONSTRAINT hr2_employee_hr2_job_fk FOREIGN KEY ( job_id )
        REFERENCES hr2_job ( job_id );

ALTER TABLE hr2_job_hist
    ADD CONSTRAINT hr2_job_hist_hr2_department_fk FOREIGN KEY ( department_id )
        REFERENCES hr2_department ( department_id );

ALTER TABLE hr2_job_hist
    ADD CONSTRAINT hr2_job_hist_hr2_employee_fk FOREIGN KEY ( employee_id )
        REFERENCES hr2_employee ( employee_id );

ALTER TABLE hr2_job_hist
    ADD CONSTRAINT hr2_job_hist_hr2_job_fk FOREIGN KEY ( job_id )
        REFERENCES hr2_job ( job_id );

ALTER TABLE hr2_location
    ADD CONSTRAINT hr2_location_hr2_country_fk FOREIGN KEY ( country_id )
        REFERENCES hr2_country ( country_id );
