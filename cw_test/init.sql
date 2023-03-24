create table Teams
(
    TeamId   int primary key not null,
    TeamName varchar(30)     not null
);

create table Contests
(
    ContestId   int primary key not null,
    ContestName varchar(30)     not null
);

create table Problems
(
    Letter      char(1)     not null,
    ProblemName varchar(30) not null,
    ContestId   int         not null,
    primary key (Letter, ContestId),
    foreign key (ContestId) references Contests (ContestId)
);

create table Sessions
(
    SessionId int       not null,
    Start     timestamp not null,
    ContestId int       not null,
    TeamId    int       not null,
    primary key (SessionId),
    foreign key (ContestId) references Contests (ContestId),
    foreign key (TeamId) references Teams (TeamId)
);

create table Runs
(
    RunId      int     not null,
    SubmitTime int     not null,
    Accepted   int     not null,
    Letter     char(1) not null,
    ContestId  int     not null,
    SessionId  int     not null,
    primary key (RunId, SessionId),
    foreign key (Letter, ContestId) references Problems (Letter, ContestId),
    foreign key (SessionId) references Sessions (SessionId)
);

insert into Teams
(TeamId, TeamName)
values (1, 'Cheba Queens'),
       (2, 'No name'),
       (3, 'Quiet Enough'),
       (4, 'Orange Tree'),
       (5, 'Turn off'),
       (6, 'Lights out');

insert into Contests
(ContestId, ContestName)
values (1, 'NWQC'),
       (2, 'Practice 1'),
       (3, 'Practice 2');

insert into Problems
(ContestId, Letter, ProblemName)
values (1, 'A', 'Activist'),
       (1, 'B', 'Bike'),
       (1, 'C', 'Correspondence'),
       (1, 'D', 'Diagram'),
       (1, 'E', 'Easy LL/SC'),
       (1, 'F', 'Failed Trends'),
       (1, 'G', 'Grandma Path'),
       (1, 'H', 'Heroes of SQL'),
       (1, 'I', 'Integer Squared'),
       (1, 'J', 'Just Password'),
       (1, 'K', 'Keys Lost'),
       (1, 'L', 'Lone Permutation'),
       (1, 'M', 'Mind Trick'),
       (1, 'N', 'Nuclear Shop'),
       (2, 'X', 'XOR'),
       (2, 'Y', 'Yell'),
       (2, 'Z', 'Zero'),
       (3, 'Y', 'Yell'),
       (3, 'Z', 'Zero');

insert into Sessions
(SessionId, TeamId, ContestId, Start)
values (1, 1, 1, to_timestamp('14.11.2020', 'DD.MM.YYYY')),
       (2, 2, 1, to_timestamp('14.11.2020', 'DD.MM.YYYY')),
       (3, 3, 2, to_timestamp('10.11.2020', 'DD.MM.YYYY')),
       (4, 3, 2, to_timestamp('14.11.2020', 'DD.MM.YYYY')),
       (5, 4, 1, to_timestamp('14.11.2020', 'DD.MM.YYYY')),
       (6, 4, 2, to_timestamp('14.11.2020', 'DD.MM.YYYY')),
       (7, 4, 3, to_timestamp('14.11.2020', 'DD.MM.YYYY')),
       (8, 5, 1, to_timestamp('14.11.2020', 'DD.MM.YYYY')),
       (9, 5, 2, to_timestamp('14.11.2020', 'DD.MM.YYYY')),
       (10, 5, 3, to_timestamp('14.11.2020', 'DD.MM.YYYY')),
       (11, 6, 3, to_timestamp('14.11.2020', 'DD.MM.YYYY')),
       (12, 6, 1, to_timestamp('14.11.2020', 'DD.MM.YYYY'));

insert into Runs
(RunId, SessionId, Letter, SubmitTime, Accepted, ContestId)
values (1, 1, 'B', 71, 0, 1),
       (2, 1, 'B', 87, 0, 1),
       (3, 1, 'B', 157, 0, 1),
       (4, 1, 'B', 202, 0, 1),
       (5, 1, 'C', 2, 1, 1),
       (6, 1, 'E', 6, 0, 1),
       (7, 1, 'E', 96, 0, 1),
       (8, 1, 'E', 106, 0, 1),
       (9, 1, 'F', 4, 0, 1),
       (10, 1, 'F', 89, 0, 1),
       (11, 1, 'F', 186, 0, 1),
       (12, 1, 'F', 259, 0, 1),
       (13, 1, 'F', 322, 1, 1),
       (14, 1, 'G', 52, 0, 1),
       (15, 1, 'G', 71, 0, 1),
       (16, 1, 'G', 146, 1, 1),
       (17, 1, 'K', 52, 0, 1),
       (18, 1, 'L', 64, 0, 1),
       (19, 1, 'M', 30, 0, 1),
       (20, 1, 'N', 90, 0, 1),
       (21, 1, 'N', 128, 0, 1),
       (22, 2, 'A', 2, 0, 1),
       (23, 2, 'A', 101, 0, 1),
       (24, 2, 'C', 4, 0, 1),
       (25, 2, 'C', 94, 0, 1),
       (26, 2, 'F', 24, 0, 1),
       (27, 2, 'G', 72, 0, 1),
       (28, 2, 'G', 90, 0, 1),
       (29, 2, 'G', 148, 0, 1),
       (30, 2, 'H', 43, 1, 1),
       (31, 2, 'I', 85, 0, 1),
       (32, 2, 'I', 97, 0, 1),
       (33, 2, 'K', 26, 0, 1),
       (34, 2, 'M', 50, 1, 1),
       (35, 2, 'N', 56, 0, 1),
       (36, 2, 'N', 84, 0, 1),
       (37, 3, 'X', 52, 0, 2),
       (38, 3, 'X', 127, 1, 2),
       (39, 3, 'Y', 55, 1, 2),
       (40, 3, 'Z', 81, 0, 2),
       (41, 3, 'Z', 144, 1, 2),
       (42, 4, 'Y', 55, 1, 2),
       (43, 5, 'A', 84, 0, 1),
       (44, 5, 'A', 103, 0, 1),
       (45, 5, 'A', 174, 1, 1),
       (46, 5, 'C', 57, 0, 1),
       (47, 5, 'C', 91, 1, 1),
       (48, 5, 'E', 26, 0, 1),
       (49, 5, 'F', 91, 0, 1),
       (50, 5, 'F', 112, 0, 1),
       (51, 5, 'F', 199, 0, 1),
       (52, 5, 'F', 223, 0, 1),
       (53, 5, 'F', 295, 1, 1),
       (54, 5, 'H', 54, 0, 1),
       (55, 5, 'H', 114, 1, 1),
       (56, 5, 'J', 72, 0, 1),
       (57, 5, 'L', 73, 0, 1),
       (58, 5, 'L', 126, 0, 1),
       (59, 5, 'L', 221, 0, 1),
       (60, 5, 'M', 98, 1, 1),
       (61, 5, 'N', 15, 0, 1),
       (62, 5, 'N', 52, 0, 1),
       (63, 5, 'N', 139, 0, 1),
       (64, 5, 'N', 227, 0, 1),
       (65, 5, 'N', 264, 0, 1),
       (66, 5, 'N', 329, 0, 1),
       (67, 5, 'N', 400, 0, 1),
       (68, 6, 'X', 72, 1, 2),
       (69, 6, 'Y', 27, 1, 2),
       (70, 6, 'Z', 99, 0, 2),
       (71, 6, 'Z', 103, 1, 2),
       (72, 7, 'Y', 18, 1, 3),
       (73, 7, 'Z', 17, 0, 3),
       (74, 8, 'B', 1, 0, 1),
       (75, 8, 'B', 83, 0, 1),
       (76, 8, 'B', 94, 0, 1),
       (77, 8, 'B', 119, 0, 1),
       (78, 8, 'C', 47, 0, 1),
       (79, 8, 'C', 58, 0, 1),
       (80, 8, 'D', 47, 0, 1),
       (81, 8, 'D', 100, 0, 1),
       (82, 8, 'D', 108, 0, 1),
       (83, 8, 'E', 28, 0, 1),
       (84, 8, 'G', 88, 1, 1),
       (85, 8, 'H', 24, 0, 1),
       (86, 8, 'J', 12, 1, 1),
       (87, 8, 'K', 68, 0, 1),
       (88, 8, 'L', 76, 1, 1),
       (89, 9, 'X', 19, 1, 2),
       (90, 9, 'Y', 74, 0, 2),
       (91, 10, 'Y', 72, 0, 3),
       (92, 10, 'Y', 141, 0, 3),
       (93, 10, 'Y', 224, 0, 3),
       (94, 10, 'Y', 252, 1, 3),
       (95, 10, 'Z', 72, 0, 3),
       (96, 10, 'Z', 139, 0, 3),
       (97, 10, 'Z', 168, 0, 3),
       (98, 10, 'Z', 187, 0, 3),
       (99, 10, 'Z', 286, 1, 3),
       (100, 10, 'Z', 300, 1, 3),
       (101, 10, 'Z', 394, 0, 3),
       (102, 11, 'Z', 394, 0, 3);