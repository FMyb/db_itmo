select GroupName, CourseName
from Groups,
     Courses
where not exists(
        select StudentId
        from Students
        where Students.GroupId = Groups.GroupId
          and Students.StudentId not in (
            select Marks.StudentId
            from Marks
            where Marks.CourseId = Courses.CourseId
        )
    );