select avg(cast(Mark as float)) AvgMark
from Marks
where StudentId = :StudentId;