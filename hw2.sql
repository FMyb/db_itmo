CREATE TABLE Groups
(
    GroupId   INT     NOT NULL,
    GroupName char(6) NOT NULL,
    PRIMARY KEY (GroupId),
    UNIQUE (GroupName)
);

CREATE TABLE Students
(
    StudentId   INT         NOT NULL,
    StudentName VARCHAR(50) NOT NULL,
    GroupId     INT         NOT NULL,
    PRIMARY KEY (StudentId),
    CONSTRAINT fk_students_groups
        FOREIGN KEY (GroupId)
            REFERENCES Groups (GroupId)
);

CREATE TABLE Lecturers
(
    LecturerId   INT         NOT NULL,
    LecturerName varchar(50) NOT NULL,
    PRIMARY KEY (LecturerId)
);

CREATE TABLE Courses
(
    CourseId   INT          NOT NULL,
    CourseName varchar(100) NOT NULL,
    PRIMARY KEY (CourseId),
    UNIQUE (CourseName)
);

CREATE TABLE CoursesLecturers
(
    CourseId  INT,
    LectureId INT,
    PRIMARY KEY (CourseId, LectureId),
    CONSTRAINT fk_courses_lecturers_courses
        FOREIGN KEY (CourseId)
            REFERENCES Courses (CourseId),
    CONSTRAINT fk_courses_lecturers_lecturers
        FOREIGN KEY (LectureId)
            REFERENCES Lecturers (LecturerId)
);

CREATE TABLE Marks
(
    StudentId  INT NOT NULL,
    LecturerId INT NOT NULL,
    CourseId   INT NOT NULL,
    Mark       char(1),
    PRIMARY KEY (StudentId, LecturerId, CourseId),
    UNIQUE (StudentId, CourseId),
    CONSTRAINT fk_marks_students
        FOREIGN KEY (StudentId)
            REFERENCES Students (StudentId),
    CONSTRAINT fk_marks_lecturers
        FOREIGN KEY (LecturerId)
            REFERENCES Lecturers (LecturerId),
    CONSTRAINT fk_marks_courses
        FOREIGN KEY (CourseId)
            REFERENCES Courses (CourseId)
);