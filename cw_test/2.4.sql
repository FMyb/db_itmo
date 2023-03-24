select ContestId, Letter
from Problems
where not exists(
        select Sessions.ContestId, Runs.Letter
        from Sessions,
             Runs
        where Sessions.SessionId = Runs.SessionId
          and Sessions.ContestId = Problems.ContestId
          and Runs.Letter = Problems.Letter
          and Runs.Accepted = 1
    );
