-- имена студентов в алфавитном порядке учащиеся в группе :GroupId
select StudentName
from Students
where GroupId = :GroupId
order by StudentName;