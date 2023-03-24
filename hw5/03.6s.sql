select Students.StudentId, StudentName, Students.GroupId as GroupId
from Students
         inner join Marks on Marks.StudentId = Students.StudentId
         inner join Plan on Plan.CourseId = Marks.CourseId
         inner join Lecturers on Lecturers.LecturerId = Plan.LecturerId
where Mark = :Mark
  and LecturerName = :LecturerName;