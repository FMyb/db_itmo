select StudentId, StudentName, GroupId
from Students
where StudentId in (
    select StudentId
    from Marks
    where CourseId in (
        select CourseId
        from Courses
        where CourseName = :CourseName
    )
      and Mark = :Mark
);