-- ДЗ-5.3.4. Информацию о студентах с :Mark по предмету :LecturerName
-- ДЗ-5.6.3. StudentId имеющих оценки по всем предметам :LecturerName
-- ДЗ-5.6.4. StudentId имеющих оценки по всем предметам :LecturerName, которые он у него вёл
-- Primary key таблицы Lecturers
create unique index pk_lecturers_lecturer_id on Lecturers using hash (LecturerId);

-- ДЗ-5.3.6. Информацию о студентах с :Mark по предмету :LecturerName
-- ДЗ-5.6.1. StudentId имеющих хотя бы одну оценку у :LecturerName
-- ДЗ-5.6.2. StudentId не имеющих оценок у :LecturerName
-- Индекс для поиска лектора по LecturerName, покрывающий нужен,
-- чтобы не обращаться к таблице
create unique index idx_lecturers_lecturer_name_lecturer_id on Lecturers using btree (LecturerName, LecturerId);