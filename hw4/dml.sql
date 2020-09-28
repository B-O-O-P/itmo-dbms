select Lecturers.surname, Courses.name, Groups.name
from Plans
         inner join Lecturers on Plans.lecturer_id = Lecturers.id
         inner join Courses on Plans.course_id = Courses.id
         inner join Groups on Plans.group_id = Groups.id;


select Students.surname, Students.name, Groups.name, Courses.name, Results.mark
from results
         inner join Students on Results.student_id = Students.id
         inner join Groups on Students.group_id = Groups.id
         inner join Courses on Results.course_id = Courses.id;
