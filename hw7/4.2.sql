update Marks
set Mark = (
    select NewMarks.Mark
    from NewMarks
    where Marks.StudentId = NewMarks.StudentId
      and Marks.CourseId = NewMarks.CourseId
)
where exists(
    select StudentId, CourseId
    from NewMarks
    where StudentId = Marks.StudentId
      and CourseId = Marks.CourseId
);