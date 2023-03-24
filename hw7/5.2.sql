create view AllMarks(StudentId, Marks) as
select Students.StudentId, count(CourseId)
from Students
         natural left join (
    select StudentId, CourseId
    from Marks
    union all
    select StudentId, CourseId
    from NewMarks
) AllMarks
group by Students.StudentId;