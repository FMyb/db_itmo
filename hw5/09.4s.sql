select GroupName, avg(cast(AvgMark as float)) AvgAvgMark
from Groups
         left join
     (select GroupId, avg(cast(Mark as float)) AvgMark
      from Students
               natural join Marks
      group by StudentId, GroupId) s on s.GroupId = Groups.GroupId
group by Groups.GroupId, Groups.GroupName;