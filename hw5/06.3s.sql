select StudentId
from Marks
where 1 = 1
except
select StudentId
from (
         select distinct StudentId, LecturersCourse.CourseId
         from Marks,
              (select CourseId
               from Plan
                        natural join Lecturers
               where LecturerName = :LecturerName) LecturersCourse
         where 1 = 1
         except
         select StudentId, CourseId
         from Marks
         where 1 = 1
     ) s
where 1 = 1;