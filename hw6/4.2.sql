select StudentName, CourseName
from (
         select distinct Students.StudentId, StudentName, Plan.CourseId
         from Students,
              Plan,
              Marks
         where Students.GroupId = Plan.GroupId
           and Students.StudentId = Marks.StudentId
           and Plan.CourseId = Marks.CourseId
           and Marks.Mark <= 2
     ) r,
     Courses
where Courses.CourseId = r.CourseId;