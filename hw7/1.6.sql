delete
from Students
where StudentId in (
    select Students.StudentId
    from Plan
             natural join Students
             left join Marks on Marks.StudentId = Students.Studentid and Marks.CourseId = Plan.CourseId
    where Mark is null
);