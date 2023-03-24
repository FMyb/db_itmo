create view StudentDebts (StudentId, Debts) as
select Students.StudentId, coalesce(Debts.Debts, 0)
from Students
         left join (
    select Students.StudentId, count(distinct Plan.CourseId) Debts
    from Students
             natural join Plan
             natural left join Marks
    where Marks.Mark is null
    group by Students.StudentId
) Debts on Students.StudentId = Debts.StudentId;