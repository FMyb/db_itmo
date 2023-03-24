select GroupName, sum(Mark) SumMark
from Groups
         left join Students on Students.GroupId = Groups.GroupId
         left join Marks on Marks.StudentId = Students.StudentId
group by Groups.GroupId, Groups.GroupName;