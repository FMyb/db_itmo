update Runs
set Accepted = 1
where Runs.RunId in (
    select RunId
    from Runs
             natural join
         (select SessionId, Letter, max(SubmitTime) SubmitTime
          from Runs
          group by SessionId, Letter
         ) a
);