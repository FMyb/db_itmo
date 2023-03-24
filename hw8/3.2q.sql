-- вывести всех студентов и фамилией Ильин в группе :GroupId.
select StudentId, StudentName
from Students
where StudentName like 'Ильин %'
    and GroupId = :GroupId;