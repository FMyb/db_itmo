select StudentName, avg(cast(Mark as float)) AvgMark
from Students
         left join Marks on Marks.StudentId = Students.StudentId
group by Students.StudentId, Students.StudentName;