update Students
set Marks = (
    select count(distinct CourseId)
    from Marks
    where Marks.StudentId = Students.StudentId
      and Marks.Mark is not null
)
where 1 = 1;