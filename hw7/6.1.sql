-- psql (PostgreSQL) 14.5

create function check_extra_marks() returns trigger as
$$
declare
    is_correct boolean;
    bad        record;
begin
    is_correct = false;
    for bad in select StudentId, CourseId
               from Marks
               where (StudentId, CourseId) not in (select StudentId, CourseId
                                                   from Plan
                                                            natural join Students)
        loop
            is_correct = false;
            raise notice 'Student (id = %) have extra mark on course (id = %)', bad.StudentId, bad.CourseId;
        end loop;
    if not is_correct
    then
        raise exception 'Violated the rule that students do not have marks in courses not according to their plan';
    end if;
end;
$$ language plpgsql;

create trigger NoExtraMarksOnMarks
    after insert or update of StudentId, CourseId
    on Marks
    for each statement
execute procedure check_extra_marks();

create trigger NoExtraMarksOnStudents
    after insert or update of StudentId, GroupId
    on Students
    for each statement
execute procedure check_extra_marks();

create trigger NoExtraMarksOnPlan
    after insert or update of GroupId, CourseId or delete
    on Plan
    for each statement
execute procedure check_extra_marks();
