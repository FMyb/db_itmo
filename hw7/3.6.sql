update Students
set Debts = (
    select count(distinct CourseId)
    from Plan
    where Plan.GroupId = Students.GroupId
      and Plan.CourseId not in (
        select CourseId
        from Marks
        where Marks.StudentId = Students.StudentId
    )
)
where 1 = 1;