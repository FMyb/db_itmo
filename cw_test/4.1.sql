select SessionId, count(distinct Letter) Solved
from Runs
where Accepted = 1
group by SessionId;