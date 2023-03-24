select distinct StudentId
from Students
where StudentId not in (
    select Students.StudentId
    from Students,
         Plan,
         Marks
    where Students.GroupId = Plan.GroupId
      and Plan.LecturerId in (
        select LecturerId
        from Lecturers
        where LecturerName = :LecturerName
    )
      and Marks.CourseId = Plan.CourseId
      and Marks.StudentId = Students.StudentId
);