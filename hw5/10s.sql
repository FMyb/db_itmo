select Students.StudentId,
       count(distinct Plan.CourseId)                                  as Total,
       count(distinct Marks.CourseId)                                 as Passed,
       count(distinct Plan.CourseId) - count(distinct Marks.CourseId) as Failed
from Students
         left join Groups on Students.GroupId = Groups.GroupId
         left join Plan on Plan.GroupId = Students.GroupId
         left join Marks on Marks.StudentId = Students.StudentId and Marks.CourseId = Plan.CourseId
group by Students.StudentId;
