select TeamId
from Sessions
where ContestId = :ContestId
  and SessionId in (
    select SessionId
    from Runs
    where Letter = :Letter
      and Accepted = 1
);