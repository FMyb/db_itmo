-- psql (PostgreSQL) 14.5

create function is_correct_same_marks() returns boolean as
$$
declare
    bad_student_with_course record;
    is_correct              boolean;
begin
    is_correct = true;
    for bad_student_with_course in select distinct StudentId, CourseId
                                   from Students
                                            natural join (
                                       select distinct GroupId, CourseId
                                       from Students
                                                natural join Marks
                                   ) GroupCourses
                                   where (StudentId, CourseId) not in (
                                       select StudentId, CourseId
                                       from Students
                                                natural join Marks
                                   )
        loop
            is_correct = false;
            raise notice 'Student (id = %) does not have a mark in the course (id = %), which the students of his group should have',
                bad_student_with_course.StudentId,
                bad_student_with_course.CourseId;
        end loop;
    return is_correct;
end;
$$ language plpgsql;

create function same_marks() returns trigger as
$$
begin
    if is_correct_same_marks()
    then
        return null;
    else
        raise exception 'The rule is violated that all students of each group have an assessment in the same set of disciplines';
    end if;
end;
$$ language plpgsql;

create trigger SameMarksOnMarks
    after insert or update of StudentId, CourseId or delete
    on Marks
    for each statement
execute procedure same_marks();

create trigger SameMarksOnStudent
    after insert or update of StudentId, GroupId
    on Students
    for each statement
execute procedure same_marks();
