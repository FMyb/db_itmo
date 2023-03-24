select TeamId, sum(a.cnt) Solved
from Sessions
         natural join
     (select SessionId, count(distinct Letter) cnt
      from Runs
      where Accepted = 1
      group by SessionId
     ) a
group by TeamId;