select StudentName, sum(Mark) SumMark
from Students
         left join Marks on Marks.StudentId = Students.StudentId
group by Students.StudentId, Students.StudentName;