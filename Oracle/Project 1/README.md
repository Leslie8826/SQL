# Database Design and Management

## Author: 
Leslie8826

## Overview
We are given an excel file, HR_data.xlsx, with a lot of data on a company's employees. We are asked to:
  - Design a database model according to the excel file
  - Create a database from the model created
  - Insert the data that appear in the excel file into the tables of the newly created database
  - Query the data from the database to get the information needed
  - Use Tableau Software to visualize the data

## How we did it
1. Brainstorming <br>
We analyzed the excel file and came up with a list of categories based upon the type of data. Each category would represent a table in our database. We wrote everyting on paper.

2. Designing the database model <br>
We draw each table on paper and added the relationships between tables when necessary, which formed our data model. Then we draw our data model in Oracle Data Modeler.

3. Creation of our database
We created our database with ddl statements in Oracle SQL Developer from the database model built in point 2.

4. Creation of stage table
We also creates a stage table where we inserted all the data that exist from the excel file HR_Data.xlsx.

5. Populating the database
We inserted the data in the tables of our database with dml statements. The data inserted came from the stage table.

6. Analysis
With dml statements we could query the table and get the information we needed to get the company analyzed.

