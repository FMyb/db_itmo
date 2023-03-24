select RunId, SessionId, Letter, SubmitTime, Accepted
from Runs
         natural join Sessions
where TeamId = :TeamId and ContestId = :ContestId;