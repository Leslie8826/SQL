4. Creation of stage table <br>
We also created a stage table where we inserted all the data that exist from the excel file HR_Data.xlsx (attached here). <br>
<br> To get the data loaded in a table, we did the following: 
   - we clicked on the import-data option when we right-clicked on Tables in SQL Developer. 
   - we selected the file HR_Data.xlsx that is locally on our computer.
   - we selected the import method (insert) and defined the name of table that will be generated: HR_STAGE
   - we selected the columns to import from the data set and arranged them in the order we wanted. At this stage we could select at minimum one column. We selected all the columns that are in the HR_Data.xlsx 
   - for each column, we defined the column details of the table that would be created
   - we validated the creation of the stage table by clicking on the finish button
   - if an error occurred, we simply redid the process (all steps of point 4) and changed what needed to be changed
   - once all errors were taken care of, we checked if the table called HR_STAGE appeared in the Table section of SQL Developer
   - we querryed the table to check if the data were inside. An example of a query: 
      select * from hr_stage
