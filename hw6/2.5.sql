select distinct StudentId, StudentName, GroupName
from Students,
     Groups,
     Plan,
     Courses
where Students.GroupId = Groups.GroupId
  and Plan.GroupId = Groups.GroupId
  and Plan.CourseId = Courses.CourseId
  and CourseName = :CourseName
  and StudentId not in (
    select StudentId
    from Marks, Courses
    where Marks.CourseId = Courses.CourseId and Courses.CourseName = :CourseName
);