В отношении нет повторяющихся групп, все атрибуты атомарны, а также есть ключ(полученный в прошлом дз) - (StudentId, CourseId). Таким образом можно сделать вывод, что отношение уже в 1НФ.

(StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName, Mark)

Итак, есть 1НФ, но при этом существуют атрибуты которые зависят от лишь от части составного ключа. Например, StudentId -> StudentName и CourseId -> CourseName. Декомпозируем по этим зависимостям исходное отношение и получим отношения:
(StudentId(k), GroupId, GroupName, CourseId(k), LecturerId, LecturerName, Mark)
(StudentId(k), StudentName)
(CourseId(k), CourseName)

Далее рассмотрим МЗ: GroupId -> GroupName. Чтобы использовать ее в декомпозиции рассмотрим такую ФЗ как GroupId, CourseId -> GroupId скомбинировав с которой GroupId -> GroupName получаем: 
GroupId, CourseId -> GroupName.
Далее  из GroupId, CourseId -> LecturerId, LecturerName и GroupId, CourseId -> GroupName получим:
GroupId, CourseId -> LecturerId, LecturerName, GroupName
Декомпозируем по полученной выше ФЗ с помощью теоремы Хита:
(StudentId(k), CourseId(k), GroupId, Mark)
(StudentId(k), StudentName)
(CourseId(k), CourseName)
(GroupId(k), CourseId(k), GroupName, LecturerId, LecturerName)

Рассмотрим еще две МЗ: StudentId -> GroupId и GroupId -> GroupName. Чтобы ничего не потерять произведем декомпозицию сначала по второму и затем по первому, получим:
(StudentId(k), CourseId(k), Mark)
(GroupId(k), GroupName)
(StudentId(k), GroupId)
(StudentId(k), StudentName)
(CourseId(k), CourseName)
(GroupId(k), CourseId(k), LecturerId, LecturerName)

Каждый студент имеет группу и имя, поэтому (StudentId(k), GroupId и (StudentId(k), StudentName) хотелось бы соединить:
(StudentId(k), CourseId(k), Mark)
(GroupId(k), GroupName(k))
(StudentId(k), GroupId, StudentName)
(CourseId(k), CourseName)
(GroupId(k), CourseId(k), LecturerId, LecturerName)

Также проверим что в этих отношениях нет составных ключей:
(GroupId(k), CourseId(k), LecturerId, LecturerName)
LecturerId не входит в замыкание {GroupId}+ и не входит в замыкание {CourseId}+. Аналогично LecturerName не входит в замыкание {GroupId}+ и не входит в замыкание {CourseId}+. Таким образом ни один из неключевых атрибутов этого отношения функционально не зависит от части ключа.

(StudentId(k), CourseId(k), Mark)
Mark не входит в замыкание {StudentId}+ и не входит в замыкание {CourseId}+. Таким образом единственный неключевой атрибут этого отношения функционально не зависит от части ключа.

(GroupId(k), GroupName)
В данном отношении есть 2 атрибута, оба являются ключами, поэтому составного ключа нет.

(StudentId(k), GroupId, StudentName)
StudentId не входит в замыкание {GroupId, StudentName}+ и поэтому входит в любой надключ, а т.к. сам является ключом, то составного нет.

(CourseId(k), CourseName)
CourseIdне входит в замыкание {CourseName}+ и поэтому входит в любой надключ, а т.к. сам является ключом, то составного нет.

(StudentId(k), GroupId, GroupName, CourseId(k), LecturerId, LecturerName, Mark)
 => (StudentId(k), CourseId(k), Mark); (GroupId(k), GroupName); (StudentId(k), GroupId, StudentName); (CourseId(k), CourseName); (GroupId, CourseId(k),  LecturerId, LecturerName);
 
 Итак, есть 2НФ, но т.к. неключевой атрибут LecturerName транзитивно зависит от ключа (GroupId, CourseId) из-за ФЗ GroupId, CourseId -> LecturerId и LecturerId -> LecturerName. Поэтому декомпозируем по последнему:
 (LecturerId(k), LecturerName)
 (StudentId(k), CourseId(k), Mark)
 (GroupId(k), GroupName(k))
 (StudentId(k), GroupId, StudentName)
 (CourseId(k), CourseName)
 (GroupId(k), CourseId(k), LecturerId)
 
 Заметим, что отношение (GroupId(k), GroupName(k)) уже в 3НФ, так как не содержит неключевых атрибутов. Также в 3НФ все кроме (StudentId(k), GroupId, StudentName), так как они содержат лишь один неключевой атрибут,  при том что для транзитивности нужно как минимум два несовпадающих неключевых атрибута. 
 
 Допустим, что (StudentId(k), GroupId, StudentName) не в 3НФ, чтобы неключевой атрибут GroupId или StudentName транзитивно зависели от StudentId необходимо иметь либо GroupId -> StudentName, либо StudentName -> GroupId. Но построив замыкание этих атрибутов заметим, что ни один не принадлежит другому и таким образом ни одна из описанных ФЗ не присутствует.

(StudentId(k), CourseId(k), Mark); (GroupId(k), GroupName); (StudentId(k), GroupId, StudentName); (CourseId(k), CourseName); (GroupId, CourseId(k),  LecturerId, LecturerName); => (LecturerId(k), LecturerName); (StudentId(k), CourseId(k), Mark); (GroupId(k), GroupName(k)); (StudentId(k), GroupId, StudentName); (CourseId(k), CourseName); (GroupId(k), CourseId(k), LecturerId);

Если отношение находится в 3НФ и не имеет пересекающихся ключей, то оно находится в НФБК. Докажем это:
(LecturerId(k), LecturerName);
LecturerId не входит в замыкание {LecturerName}+, т.е LecturerId  входит в любой надключ. Таким образом, т.к. LecturerId - ключ, можем сделать вывод, что у отношения всего лишь один ключ и пересекающихся ключей нет.

StudentId(k), CourseId(k), Mark);
StudentId не входит в замыкание {CourseId, Mark}+ и CourseId не входит в замыкание {StudentId, Mark}+, значит StudentId и CourseId входят в любой надключ(.  Таким образом, т.к. StudentId, CourseId - ключ, можем сделать вывод, что у отношения всего лишь один ключ и пересекающихся ключей нет.

(GroupId(k), GroupName(k))
У ;данного отношения два атрибута, каждый из которых является ключом, значит, ключи не пересекаются.

(StudentId(k), GroupId, StudentName);
StudentId не входит в замыкание {GroupId, StudentName}+, т.е StudentId входит в любой надключ. Таким образом, т.к. StudentId - ключ, можем сделать вывод, что у отношения всего лишь один ключ и пересекающихся ключей нет.

 (CourseId(k), CourseName)
CourseId не входит в замыкание {CourseName}+, т.е CourseId входит в любой надключ. Таким образом, т.к. CourseId - ключ, можем сделать вывод, что у отношения всего лишь один ключ и пересекающихся ключей нет.

(GroupId(k), CourseId(k), LecturerId)
GroupId не входит в замыкание {CourseId, LecturerId}+ и CourseId не входит в замыкание {GroupId, LecturerId}+, значит GroupId и CourseId входят в любой надключ(.  Таким образом, т.к. GroupId, CourseId - ключ, можем сделать вывод, что у отношения всего лишь один ключ и пересекающихся ключей нет.

Теперь, т.к. непересекающихся ключей нет, можем сделать вывод что данное отношение уже в НФБК.

(StudentId(k), CourseId(k), Mark); (GroupId(k), GroupName); (StudentId(k), GroupId, StudentName); (CourseId(k), CourseName); (GroupId, CourseId(k),  LecturerId, LecturerName); => (LecturerId(k), LecturerName); (StudentId(k), CourseId(k), Mark); (GroupId(k), GroupName(k)); (StudentId(k), GroupId, StudentName); (CourseId(k), CourseName); (GroupId(k), CourseId(k), LecturerId);

Рассмотрим отношения:
(LecturerId(k), LecturerName); 
(StudentId(k), CourseId(k), Mark); 
(GroupId(k), GroupName(k)); 
(StudentId(k), GroupId, StudentName); 
(CourseId(k), CourseName); 
(GroupId(k), CourseId(k), LecturerId);

В этих отношениях нет нетривиальных МЗ, которые не являются ФЗ -> каждая нетривиальная МЗ является ФЗ. Т.к. эти отношения находятся в НФБК(по предыдущему пункт),то они находятся в 4НФ.

(StudentId(k), CourseId(k), Mark); (GroupId(k), GroupName); (StudentId(k), GroupId, StudentName); (CourseId(k), CourseName); (GroupId, CourseId(k),  LecturerId, LecturerName); => (LecturerId(k), LecturerName); (StudentId(k), CourseId(k), Mark); (GroupId(k), GroupName(k)); (StudentId(k), GroupId, StudentName); (CourseId(k), CourseName); (GroupId(k), CourseId(k), LecturerId);

Пройдемся по отношениям:
(LecturerId(k), LecturerName);
LecturerId не входит в замыкание {LecturerName}+, т.е LecturerId  входит в любой надключ. Таким образом, т.к. LecturerId - ключ, можем сделать вывод, что у отношения составного ключа не существует и следовательно все ключи - простые.

Аналогично, можем сказать про:
(CourseId(k), CourseName)
(GroupId(k), GroupName(k))
(StudentId(k), GroupId, StudentName)
Так как замыкания в них уже были рассмотрены.

(GroupId(k), CourseId(k), LecturerId)
Найдем все не тривиальные ЗС. Разобьем на 3 части по 2 атрибута и получим:
(GroupId, CourseId)
(GroupId, LecturerId)
(CourseId, LecturerId)
Построив pi(GroupId, CourseId, LecturerId) получим(надеюсь гуглоформа не склеит ее):
GroupId CourseId LecturerId 
     1               1                 1
     1               2                 2
     2               1                 2
     2               2                 1
При этом построив pi от трех частей и соединив получим:
GroupId CourseId LecturerId 
     1               1                 1
     1               2                 1
     1               1                 2
     1               2                 2
     2               1                 1
     2               1                 2
     2               2                 1
     2               2                 2
Как видно они не равны, поэтому для данного отношения нет нетривиальных  ЗС.

Аналогично можно доказать для отношения (StudentId(k), CourseId(k), Mark).
Значит, все отношения в 5НФ.

(StudentId(k), CourseId(k), Mark); (GroupId(k), GroupName); (StudentId(k), GroupId, StudentName); (CourseId(k), CourseName); (GroupId, CourseId(k),  LecturerId, LecturerName); => (LecturerId(k), LecturerName); (StudentId(k), CourseId(k), Mark); (GroupId(k), GroupName(k)); (StudentId(k), GroupId, StudentName); (CourseId(k), CourseName); (GroupId(k), CourseId(k), LecturerId);

