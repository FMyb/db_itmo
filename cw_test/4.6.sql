select ContestId, TeamName, SubmitTime
from Teams
         natural join
     (select ContestId, TeamId, SubmitTime
      from (select ContestId, TeamId, SubmitTime
            from sessions
                     natural join Runs) a
      where SubmitTime = (
          select max(b.SubmitTime)
          from (select ContestId, TeamId, SubmitTime
                from sessions
                         natural join Runs) b
          where a.contestid = b.contestid
      )
     ) c;