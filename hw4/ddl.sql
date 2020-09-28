create table Groups (
    id   int     not null primary key,
    name char(5) not null unique
);

create table Students (
    id       int         not null primary key,
    name     varchar(50) not null,
    surname  varchar(50) not null,
    group_id int         not null,
    foreign key (group_id) references Groups (id)
);

create table Courses (
    id   int         not null primary key,
    name varchar(50) not null
);

create table Lecturers (
    id      int         not null primary key,
    name    varchar(50) not null,
    surname varchar(50) not null
);

create table Results (
    mark       varchar(2) not null,
    student_id int        not null,
    course_id  int        not null,
    primary key (student_id, course_id),
    foreign key (student_id) references Students (id),
    foreign key (course_id) references Courses (id)
);

create table Plans (
    group_id    int not null,
    course_id   int not null,
    lecturer_id int not null,
    primary key (course_id, group_id),
    foreign key (group_id) references Groups (id),
    foreign key (course_id) references Courses (id),
    foreign key (lecturer_id) references Lecturers (id)
);

insert into Groups(id, name)
    values (1, 'M3435'),
           (2, 'M3437'),
           (3, 'M3439');

insert into Students (id, name, surname, group_id)
    values (1, 'Дмитрий', 'Чижиков', 1),
           (2, 'Сергей', 'Тыньянов', 1),
           (3, 'Михаил', 'Глаголев', 2),
           (4, 'Даниил', 'Орешников', 3),
           (5, 'Александра', 'Дроздова', 3);

insert into Courses(id, name)
    values (1, 'Базы данных'),
           (2, 'Алгоритмы и структуры данных'),
           (3, 'Дискретная математика');

insert into Lecturers (id, name, surname)
    values (1, 'Георгий', 'Корнеев'),
           (2, 'Андрей', 'Станкевич'),
           (3, 'Павел', 'Маврин');

insert into Plans (course_id, group_id, lecturer_id)
    values (1, 1, 1),
           (1, 2, 1),
           (1, 3, 1),
           (2, 1, 1),
           (2, 3, 3),
           (3, 3, 2);


insert into Results (student_id, course_id, mark)
    values (1, 2, 'A'),
           (1, 3, 'D'),
           (1, 1, 'C'),
           (2, 3, 'C'),
           (2, 1, 'E'),
           (3, 3, 'FX'),
           (3, 1, 'A'),
           (4, 2, 'B'),
           (5, 1, 'A'),
           (5, 3, 'A'),
           (5, 2, 'A');