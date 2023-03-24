merge into Sessions s
    using Teams t
    on s.TeamId = t.TeamId and s.ContestId = :ContestId
    when matched then
update set Start = current_timestamp
    when not matched then
insert (TeamId, ContestId, Start)
values (t.TeamId, :ContestId, current_timestamp);