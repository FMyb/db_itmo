-- так как b-tree индекс - упорядоченный, ускорит запрос
create index idx_students_group_id_student_name on Students using btree (GroupId, StudentName);