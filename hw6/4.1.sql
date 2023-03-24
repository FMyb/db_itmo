select StudentName, CourseName
from (
         select distinct StudentId, StudentName, CourseId
         from Students,
              Plan
         where Students.GroupId = Plan.GroupId
           and not exists(
                 select StudentId, CourseId
                 from Marks
                 where Marks.StudentId = Students.StudentId
                   and Marks.CourseId = Plan.CourseId
             )
     ) r,
     Courses
where Courses.CourseId = r.CourseId;
