create table Groups (
    id         int         not null primary key,
    group_name char(5) not null
);

create table Students (
    id          int primary key,
    first_name  varchar(50) not null,
    second_name varchar(50) not null,
    birthday    date,
    group_id    int         not null references Groups (id)
);

create table Teachers (
    id          int         not null primary key,
    first_name  varchar(50) not null,
    second_name varchar(50) not null
);

create table Subjects (
    id           int         not null primary key,
    subject_name varchar(50) not null,
    teacher_id   int         not null references Teachers (id)
);

create table Marks (
    mark_value int  not null,
    mark_date  date not null,
    student_id int  not null references Students (id),
    subject_id int  not null references Subjects (id),
    primary key (subject_id, student_id)
);

insert into Groups (id, group_name)
    values (1, 'M3439'),
           (2, 'M3438'),
           (3, 'M3436'),
           (4, 'M3435');

insert into Students (id, first_name, second_name, birthday, group_id)
    values (1, 'Dmitriy', 'Chizhikov', '1999-06-04', 4),
           (2, 'Yaroslav', 'Abubakirov', '1999-03-05', 4),
           (3, 'Alexandra', 'Drozdova', '1999-10-12', 1),
           (4, 'Ali', 'Alekperov', '1999-05-05', 3),
           (5, 'Ildar', 'Amirov', null, 2);

insert into Teachers (id, first_name, second_name)
    values (1, 'Georgiy', 'Korneev'),
           (2, 'Andrew', 'Stankevich'),
           (3, 'Pavel', 'Mavrin');


insert into Subjects (id, subject_name, teacher_id)
    values (1, 'Databases', 1),
           (2, 'Algorithms and Data Structures', 3),
           (3, 'Translation methods', 2),
           (4, 'Java advanced', 1);

insert into Marks (mark_value, mark_date, subject_id, student_id)
    values (92, '2021-01-16', 1, 1),
           (74, '2021-01-18', 3, 2),
           (80, '2021-01-21', 2, 3),
           (61, '2021-01-17', 4, 4),
           (88, '2021-01-25', 2, 5);

select * from Groups;
select * from Students;
select * from Teachers;
select * from Subjects;
select * from Marks;

select Students.second_name,
       Students.first_name,
       Groups.group_name
from Students
         inner join Groups
                    on Students.group_id = Groups.id;

select Students.second_name,
       Students.first_name,
       Subjects.subject_name,
       Marks.mark_value,
       Marks.mark_date
from Students
         inner join Marks
                    on Students.id = Marks.student_id
         inner join Subjects
                    on Marks.subject_id = Subjects.id;