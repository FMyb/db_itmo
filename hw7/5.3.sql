create view Debts (StudentId, Debts) as
select StudentId, count(distinct CourseId)
from Plan
         natural join Students
where Plan.CourseId not in (
    select CourseId
    from Marks
    where Marks.StudentId = Students.StudentId
)
group by StudentId;