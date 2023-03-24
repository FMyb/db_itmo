insert into runs (SubmitTime, Accepted, Letter, SessionId)
select SubmitTime + 1, 1, Letter, SessionId
from runs
         natural join
     (select SessionId, Letter
      from runs
      except
      select SessionId, Letter
      from runs
      where Accepted = 1
     ) a
         natural join
     (select SessionId, Letter, max(SubmitTime) SubmitTime
      from runs
      group by SessionId, Letter
     ) b