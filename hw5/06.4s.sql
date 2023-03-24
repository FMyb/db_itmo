select distinct StudentId
from (
         select Marks.StudentId, z.StudentId StudentIdDuplicate
         from Marks,
              (select distinct StudentId
               from Plan
                        natural join Lecturers
                        natural join Students
               where LecturerName = :LecturerName
              ) z
         where 1 = 1
         except
         select StudentId, StudentIdDuplicate
         from (
                  select StudentId, StudentIdDuplicate, s.CourseId
                  from Marks,
                       (select distinct StudentId StudentIdDuplicate, CourseId
                        from Plan
                                 natural join Lecturers
                                 natural join Students
                        where LecturerName = :LecturerName
                       ) s
                  where 1 = 1
                  except
                  select StudentId, StudentIdDuplicate, s.CourseId
                  from Marks
                           natural join (select distinct StudentId StudentIdDuplicate, CourseId
                                         from Plan
                                                  natural join Lecturers
                                                  natural join Students
                                         where LecturerName = :LecturerName
                  ) s
                  where 1 = 1
              ) xz
         where 1 = 1
     ) res
where res.StudentId = res.StudentIdDuplicate;