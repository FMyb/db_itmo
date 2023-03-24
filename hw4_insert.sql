INSERT INTO Groups (GroupId, GroupName)
VALUES (1, 'M34381'),
       (2, 'M34391');

INSERT INTO Students (StudentId, StudentName, GroupId)
VALUES (1, 'Ильин Ярослав Дмиртриевич', 1),
       (2, 'Казаков Михаил Вячеславович', 2);

INSERT INTO Lecturers (LecturerId, LecturerName)
VALUES (1, 'Корнеев Георгий Александрович'),
       (2, 'Трифонов Петр Владимирович');

INSERT INTO Courses (CourseId, CourseName)
VALUES (1, 'Проектирование баз данных'),
       (2, 'Современные вопросы информатики'),
       (3, 'Введение в программирование');

INSERT INTO Marks (StudentId, CourseId, Mark)
VALUES (1, 3, 'C'),
       (2, 3, 'B'),
       (1, 2, 'A'),
       (2, 1, 'A');

INSERT INTO Plans (Groupid, Courseid, Lecturerid)
VALUES (1, 1, 1),
       (2, 3, 1),
       (1, 2, 2);