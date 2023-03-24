select distinct StudentId, StudentName, GroupId
from Students
where Students.GroupId in (
    select GroupId
    from Groups
    where GroupName = :GroupName
);