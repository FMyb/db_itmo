select sum(Mark) SumMark
from Marks
where StudentId = :StudentId;