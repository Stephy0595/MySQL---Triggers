### Triggers
This repository demonstrates how to create and manage triggers in a database, specifically focusing on actions related to a teachers table. 

Create a table named teachers with the following fields:
  
    id: Unique identifier for each teacher (Primary Key)

    name: Name of the teacher

    subject: Subject taught by the teacher

    experience: Years of experience the teacher has

    salary: Salary of the teacher.
### Tasks :
1. Insert 8 rows of  data into the teachers table.

2. Create before_insert_teacher Trigger
This trigger will raise an error when an attempt is made to insert a teacher with a negative salary value.

3. Create after_insert_teacher Trigger
This trigger will insert a new row into a teacher_log table when a new teacher is inserted. The log will contain the teacher’s ID, the action (INSERT), and the timestamp of when the row is inserted.

   1.  Create teacher_log Table

   2.  Create after_insert_teacher Trigger

4. Create before_delete_teacher Trigger
This trigger will raise an error when an attempt is made to delete a teacher with more than 10 years of experience.

5. Create after_delete_teacher Trigger
This trigger will insert a log entry into the teacher_log table when a teacher is deleted from the teachers table.

