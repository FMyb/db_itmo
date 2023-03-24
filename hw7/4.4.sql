merge into Marks
    using NewMarks
    on NewMarks.StudentId = Marks.StudentId and NewMarks.CourseId = Marks.CourseId
    when matched then
        update set Marks.Mark =
                case
                    when Marks.Mark >= NewMarks.Mark then Marks.Mark
                    else NewMarks.Mark
                    end
    when not matched then
        insert (StudentId, CourseId, Mark) values (NewMarks.StudentId, NewMarks.CourseId, NewMarks.Mark);


merge into Runs
    using (select SessionId
           from Sessions
           where ContestId = 4)
    on s.SessionId = Runs.SessionId and Runs.Letter = 'A'
    when matched and Runs.Accepted = 1 then update set submittime = 0
    when matched and Runs.Accepted = 0 then insert (runid, submittime, accepted, letter, contestid, sessionid)
    values ((select max (runid) + s.SessionId from Runs), 0, 1, 'A', 4, s.sessionid);


merge into Sessions s
    using Teams t
    on s.TeamId = t.TeamId and s.ContestId = :ContestId
    when matched then
        update set Start = current_timestamp
    when not matched then
        insert (TeamId, ContestId, Start)
            values (t.TeamId, :ContestId, current_timestamp);

