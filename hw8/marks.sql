-- ДЗ-5.3.1. Информация о студентах с :Mark по предмету :CourseId
-- ДЗ-5.3.2. Информацию о студентах с :Mark по предмету :CourseName
-- ДЗ-5.3.3. Информацию о студентах с :Mark по предмету :LecturerId
-- покрывающий индекс для поиска по студенту и курсу,
-- по студенту курсу и оценке
create unique index idx_marks_student_id_course_id_mark on Marks using btree (StudentId, CourseId, Mark);

-- ДЗ-6.2.2. Полная информация о студентах, не имеющих оценки по :CourseId
-- ДЗ-6.2.3. Полная информация о студентах, не имеющих оценки по :CourseName
-- ДЗ-6.2.4. Полная информация о студентах, не имеющих оценки по :CourseId, у которых есть этот предмет
-- индекс для поиска записей по курсу.
create index idx_marks_course_id on Marks using hash (CourseId);