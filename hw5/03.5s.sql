select StudentId, StudentName, Students.GroupId as GroupId
from Students
         natural join Marks
         inner join Plan on Plan.CourseId = Marks.CourseId
where Mark = :Mark
  and Plan.LecturerId = :LecturerId;