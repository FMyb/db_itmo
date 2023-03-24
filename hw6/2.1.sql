select StudentId, StudentName, (select GroupName from Groups where Students.GroupId = Groups.GroupId) GroupName
from Students
where GroupId in (select GroupId from Groups);