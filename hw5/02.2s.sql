select distinct StudentId, StudentName, GroupName
from Students
         natural join Groups
where StudentName = :StudentName;