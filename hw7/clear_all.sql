drop table if exists groups cascade;

drop table if exists students cascade;

drop table if exists courses cascade;

drop table if exists lecturers cascade;

drop table if exists plan cascade;

drop table if exists marks cascade;

drop table if exists newmarks cascade;

create table Groups
(
    GroupId   int not null,
    GroupName varchar(6)
);

create table Students
(
    StudentId   int          not null,
    StudentName varchar(100) not null,
    GroupId     int,
    Marks       int,
    Debts       int
);

create table Courses
(
    CourseId   int         not null,
    CourseName varchar(50) not null
);

create table Lecturers
(
    LecturerId   int         not null,
    LecturerName varchar(50) not null
);

create table Plan
(
    GroupId    int not null,
    CourseId   int not null,
    LecturerId int not null
);

create table Marks
(
    StudentId int not null,
    CourseId  int not null,
    Mark      int not null
);

create table NewMarks
(
    StudentId int not null,
    CourseId  int not null,
    Mark      int not null
);


insert into groups (groupid, groupname)
values (1, 'M3435'),
       (2, 'M3439'),
       (3, 'M3238'),
       (4, 'M3239');

insert into students (studentid, studentname, groupid)
values (1, 'Иванов И.И.', 1),
       (2, 'Петров П.П.', 1),
       (3, 'Петров П.П.', 2),
       (4, 'Сидров С.С.', 2),
       (5, 'Неизвестный Н.Н.', 3),
       (6, 'Безымянный Б.Б', 4);

insert into courses (courseid, coursename)
values (1, 'Базы данных'),
       (2, 'Управление проектами'),
       (3, 'ППО'),
       (4, 'Теория информации'),
       (6, 'Математический анализ'),
       (7, 'Технологии Java');

insert into lecturers (lecturerid, lecturername)
values (1, 'Корнеев Г.А.'),
       (2, 'Будин Н.А.'),
       (3, 'Кузнецова Е.М.'),
       (4, 'Киракозов А.Х.'),
       (6, 'Трофимюк Г.А.'),
       (7, 'Беляев Е.А.'),
       (8, 'Кохась К.П.');

insert into plan (groupid, courseid, lecturerid)
values (1, 1, 2),
       (2, 1, 1),
       (1, 2, 3),
       (1, 3, 4),
       (2, 3, 4),
       (2, 4, 6),
       (1, 4, 7),
       (2, 4, 7),
       (4, 6, 8),
       (1, 7, 1),
       (2, 7, 1),
       (3, 7, 1),
       (4, 7, 1);

insert into marks (studentid, courseid, mark)
values (1, 1, 5),
       (2, 1, 4),
       (3, 1, 3),
       (2, 2, 3),
       (3, 2, 4),
       (4, 2, 5),
       (7, 1, 5),
       (8, 1, 5),
       (7, 7, 5),
       (8, 7, 5),
       (5, 7, 5),
       (6, 7, 5),
       (3, 3, 3);

insert into newmarks (studentid, courseid, mark)
values (1, 1, 3),
       (2, 1, 1),
       (3, 1, 2),
       (2, 3, 5),
       (3, 2, 1),
       (4, 3, 5),
       (7, 1, 5);