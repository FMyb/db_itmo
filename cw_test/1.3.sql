select RunId, SessionId, Letter, SubmitTime
from Runs
         natural join sessions
where contestid = :ContestId
  and Accepted = 1;