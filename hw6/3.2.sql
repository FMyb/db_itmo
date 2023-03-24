select StudentName, CourseName
from (select StudentId, CourseId
      from Students,
           Plan
      where Students.GroupId = Plan.GroupId
      union
      select StudentId, CourseId
      from Marks
      where 1 = 1) ids,
     Students,
     Courses
where Students.StudentId = ids.StudentId
  and Courses.CourseId = ids.CourseId;
