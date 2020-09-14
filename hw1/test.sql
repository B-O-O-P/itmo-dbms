\c ctd

insert into Students
    (student_id, name, group_id) values
    (4, 'Бумагина Анна Дмитриевна', 2),
    (5, 'Плешаков Алексей Александрович', 2),
    (6, 'Орешников Даниил Михайлович', 2);

select count(*) from Groups;
select count(*) from Groups;
select count(*) from Students;
select count(*) from Students where name like '%ван%' or name like '%ов';

delete from Groups;
delete from Students;
delete from Groups;

insert into Groups
    (group_id, group_no) values
    (1, 'M3435'),
    (2, 'M3436'),
    (3, 'M3437'),
    (4, 'M3439');

insert into Students
    (student_id, name, group_id) values
    (1, 'Чижиков Дмитрий', 1),
    (2, 'Юрченко Артем', 2),
    (3, 'Балахнин Сергей', 2),
    (4, 'Наумов Семён', 3),
    (5, 'Глаголев Михаил', 3),
    (6, 'Янченков Дмитрий', 3),
    (7, 'Орешников Даниил', 4),
    (8, 'Дроздова Александра', 4),
    (9, 'Валерий Тепляков', 4),
    (10, 'Сычев Никита', 4);

select group_no, count(*)
from Groups inner join Students on Groups.group_id = Students.group_id
group by group_no order by group_no desc;