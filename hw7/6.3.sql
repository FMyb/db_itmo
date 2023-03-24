-- psql (PostgreSQL) 14.5

create function preserve_marks() returns trigger as
'begin
    if new.Mark > old.Mark then
        return new;
    else
        return old;
    end if;
end;'
    language plpgsql;

create trigger PreserveMarks
    before update
    on Marks
    for each row
execute procedure preserve_marks();