select StudentId
from Students
where StudentId not in (
    select StudentId
    from Plan,
         Lecturers,
         Students
    where Plan.LecturerId = Lecturers.LecturerId
      and Lecturers.LecturerName = :LecturerName
      and Plan.GroupId = Students.GroupId
      and not exists(
            select StudentId, CourseId
            from Marks
            where Marks.StudentId = Students.StudentId
              and Marks.CourseId = Plan.CourseId
        )
);