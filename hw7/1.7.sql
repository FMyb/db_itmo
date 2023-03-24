delete
from Students
where StudentId in (
    select StudentId
    from Plan
             natural join Students
             natural left join Marks
    where Mark is null
    group by StudentId
    having count(distinct CourseId) >= 2
);