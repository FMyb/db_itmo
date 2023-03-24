select TeamName, Solved, Penalty
from sessions
         natural join teams
         natural join
     (select SessionId, count(distinct Letter) Solved, sum(SubmitTime) Penalty
      from sessions
               natural join Runs
               natural join Problems
      where contestid = :ContestId
        and Accepted = 1
      group by SessionId) a
order by Solved desc, Penalty desc, SessionId;