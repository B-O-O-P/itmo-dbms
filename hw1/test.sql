\c ctd

insert into Students
    (student_id, name, group_id) values
    (4, '�������� ���� ����������', 2),
    (5, '�������� ������� �������������', 2),
    (6, '��������� ������ ����������', 2);

select count(*) from Groups;
select count(*) from Groups;
select count(*) from Students;
select count(*) from Students where name like '%���%' or name like '%��';

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
    (1, '������� �������', 1),
    (2, '������� �����', 2),
    (3, '�������� ������', 2),
    (4, '������ ����', 3),
    (5, '�������� ������', 3),
    (6, '�������� �������', 3),
    (7, '��������� ������', 4),
    (8, '�������� ����������', 4),
    (9, '������� ��������', 4),
    (10, '����� ������', 4);

select group_no, count(*)
from Groups inner join Students on Groups.group_id = Students.group_id
group by group_no order by group_no desc;