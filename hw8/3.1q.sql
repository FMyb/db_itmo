-- найти лучших студентов по курсу :CourseId
select distinct StudentId
from Students
         natural join Marks
where CourseId = :CourseId
  and Mark >= all (
    select Mark
    from Marks
    where CourseId = :CourseId
);