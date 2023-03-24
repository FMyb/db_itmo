select Letter
from (select Letter, sum(Accepted) cnt
      from (
               select distinct Letter, SessionId, Accepted
               from Problems
                        natural left join Runs
               where ContestId = :ContestId
           ) a
      group by Letter) b
where b.cnt = (
    select max(cnt)
    from (select Letter, sum(Accepted) cnt
          from (
                   select distinct Letter, SessionId, Accepted
                   from Problems
                            natural left join Runs
                   where ContestId = :ContestId
               ) a
          group by Letter
         ) c
);