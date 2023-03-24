select ContestId, Letter
from (select ContestId, Letter, sum(Accepted) cnt
      from (
               select distinct Letter, SessionId, ContestId, Accepted
               from Problems
                        natural left join Runs
           ) a
      group by ContestId, Letter) b
where b.cnt = (
    select max(cnt)
    from (select ContestId, Letter, sum(Accepted) cnt
          from (
                   select distinct Letter, SessionId, ContestId, Accepted
                   from Problems
                            natural left join Runs
               ) a
          group by ContestId, Letter
         ) c
);