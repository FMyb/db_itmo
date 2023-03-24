select avg(cast(Mark as float)) AvgMark
from Students
         natural join Groups
         natural join Marks
where GroupId = :GroupId
  and CourseId = :CourseId;