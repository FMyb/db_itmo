-- btree - упорядоченный индекс, ускорит like
create index idx_students_student_name_group_id on Students using btree (StudentName, GroupId);