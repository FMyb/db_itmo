select StudentName, CourseName
from (
         select StudentId, StudentName, CourseId, CourseName
         from Students
                  natural join Plan
                  natural join Courses
         where 1 = 1
         except
         select StudentId, StudentName, CourseId, CourseName
         from Students
                  natural join Plan
                  natural join Courses
                  natural join Marks
         where 1 = 1
     ) StudentsCoursesWithoutMarks
where 1 = 1;