-- индекс для внешнего ключа таблицы students по groupid
create index fk_students_groups_group_id on Students using hash (GroupId);

-- для соединения и поиска оценки по курсу и студентам группы
create unique index idx_marks_course_id_student_id_mark on Marks using btree (CourseId, StudentId, Mark);

-- первичный ключ таблицы groups
create index pk_groups_group_id on Groups using hash (GroupId);