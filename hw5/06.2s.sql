select StudentId
from Students
where 1 = 1
except
select StudentId
from Plan
         natural join Lecturers
         natural join Marks
         natural join Students
where LecturerName = :LecturerName;