select distinct StudentId, StudentName, GroupName
from Students,
     Groups,
     Plan
where Students.GroupId = Groups.GroupId
  and Plan.GroupId = Groups.GroupId
  and Plan.CourseId = :CourseId
  and StudentId not in (
    select StudentId
    from Marks
    where Marks.CourseId = :CourseId
);