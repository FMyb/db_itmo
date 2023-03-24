update Runs
set Accepted = 1
where RunId in (
    select RunId
    from Runs
             natural join
         (select SessionId, max(submittime) submittime
          from Runs
          group by SessionId
         ) a
);