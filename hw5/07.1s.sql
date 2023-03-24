select CourseId, GroupId
from Marks,
     Students
where 1 = 1
except
select CourseId, GroupId
from (
         select CourseId, Students.StudentId StudentId, GroupId
         from Marks,
              Students
         where 1 = 1
         except
         select CourseId, StudentId, GroupId
         from Marks
                  natural join Students
         where 1 = 1
     ) xz
where 1 = 1;