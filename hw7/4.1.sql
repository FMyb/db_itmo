insert into Marks (StudentId, CourseId, Mark)
select NewMarks.StudentId, NewMarks.CourseId, NewMarks.Mark
from NewMarks
         left join Marks on Marks.StudentId = NewMarks.StudentId and Marks.CourseId = NewMarks.CourseId
where Marks.Mark is null;