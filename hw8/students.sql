-- ДЗ-5.1.1. Информация о студентах по :StudentId
-- ДЗ-5.2.1. Полная информация о студентах по :StudentId
-- ДЗ-6.1.3. Информация о студентах по :Mark и :CourseId
-- выбираем хеш потому что primary key, ищем по значению ключа
-- или проверяем существование ключа в in, и делаем это быстрее
-- чем в дереве.
create unique index pk_students on Students using hash (StudentId);

-- ДЗ-5.1.2. Информация о студентах по :StudentName
-- ДЗ-5.2.2. Полная информация о студентах по :StudentName
-- ДЗ-6.1.1. Информация о студентах по :StudentName
-- Хотим искать в таблице Students по StudentName, при этом не ходя
-- в таблицу, для этого делаем покрывающий индекс.
create unique index idx_students_student_name_student_id on Students using btree (StudentName, StudentId, GroupId);

-- ДЗ-6.1.2. Информация о студентах по :GroupName
-- ДЗ-5.8.3. SumMark студентов каждой группы (GroupName)
-- ДЗ-5.9.3. AvgMark каждой группы (GroupName)
-- Внешний ключ на таблицу groups.
create index fk_students_groups_group_id on Students using hash (GroupId);