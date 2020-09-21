Дано отношение с атрибутами StudentId, StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName, Mark.

1. Найдите функциональные зависимости в данном отношении.
StudentId -> StudentName, GroupId
GroupId -> GroupName
CourseId -> CourseName
LecturerId -> LecturerName
StudentId, CourseId -> LecturerId, Mark

2. Найдите все ключи данного отношения.
StudentId, CourseId

Довольно просто понять что ключом является StudentId, CourseId, т.к. он может идентифицировать кортеж и при этом минимален по включению. 

Проверим это путем минимизации. Набор из всех атрибутов является надключом. Он не является ключом, так как есть StudentId -> StudentName(который извлекается путем расщепления StudentId -> StudentName, GroupId), то есть данный набор не минимален по включению. Тогда уберем StudentName.
Аналогично, подобное можно сказать и про GroupId -> GroupName, CourseId -> CourseName и LecturerId -> LecturerName. Убираем их из набора.

Остались StudentId, GroupId, CourseId, LecturerId, Mark.
Т.к. есть еще ФЗ: 
StudentId -> GroupId(полученная путем расщепления из 1-ой ФЗ)
StudentId, CourseId -> LecturerId(полученная путем расщепления из последней ФЗ)
StudentId, CourseId -> Mark(полученная путем расщепления из последней ФЗ)
Таким образом убираем из набора GroudId, LecturerId и Mark. 

Получаем ключ: StudentId, CourseId. т.к. больше зависимостей нет между атрибутами оставшимся в наборе, то он минимален по включению.


3. Найдите замыкание множеств атрибутов:
    1. GroupId, CourseId;
    2. StudentId, CourseId;
    3. StudentId, LecturerId.

{ GroupId, CourseId }
{ GroupId, CourseId, GroupName }
{ GroupId, CourseId, GroupName, CourseName }

{ StudentId, CourseId }
{ StudentId, CourseId, StudentName }
{ StudentId, CourseId, StudentName, GroupId }
{ StudentId, CourseId, StudentName, GroupId, GroupName }
{ StudentId, CourseId, StudentName, GroupId, GroupName, CourseName }
{ StudentId, CourseId, StudentName, GroupId, GroupName, CourseName, Mark }
{ StudentId, CourseId, StudentName, GroupId, GroupName, CourseName, Mark, LecturerId }
{ StudentId, CourseId, StudentName, GroupId, GroupName, CourseName, Mark, LecturerId, LecturerName }

{ StudentId, LecturerId }
{ StudentId, LecturerId, StudentName }
{ StudentId, LecturerId, StudentName, GroupId }
{ StudentId, LecturerId, StudentName, GroupId, GroupName }
{ StudentId, LecturerId, StudentName, GroupId, GroupName, LecturerName }

4. Найдите неприводимое множество функциональных зависимостей для данного отношения.

Пройдем по всем 3-м пунктам теоремы о НМФЗ и таким образом построим его из ФЗ. 

Для начала в НМФЗ каждая правая часть содержит один атрибут. Поэтому в ФЗ воспользуемся правилом расщепления ко всем к кому его можно применить:
StudentId -> StudentName, GroupId превратится в две зависимости:
StudentId -> StudentName
StudentId -> GroupId
StudentId, CourseId -> LecturerId, Mark превратится в:
StudentId, CourseId -> LecturerId
StudentId, CourseId -> Mark

Больше правило расщепления применить не к чему, и теперь в правой части каждой зависимости ровно один атрибут.

StudentId -> StudentName
StudentId -> GroupId
GroupId -> GroupName
CourseId -> CourseName
LecturerId -> LecturerName
StudentId, CourseId -> LecturerId
StudentId, CourseId -> Mark

Далее,  в НФМЗ каждая левая часть ФЗ минимальная по включению. Будем пытаться удалять по одному атрибуту из каждой левой части. 5 из 7 ФЗ содержат лишь один атрибут в левой части. Рассмотрим остальные:

StudentId, CourseId -> Mark:
Пробуем убрать StudentId. Построим замыкание CourseId+ = { CourseName }. Как видно, в нем не содержится Mark, значить убрать StudentId мы не можем, т.к. только CourseId не хватает чтобы определить Mark.
Пробуем убрать CourseId. Построим замыкание StudentId+ = { StudentName }, GroupId, GroupName. Как видно, в нем не содержится Mark, значить убрать CourseId мы не можем.

StudentId, CourseId -> LecturerId - Аналогично можем заметить что в замыканиях обоих атрибутов нет LecturerId. Значит ни один из них убрать мы не можем.

StudentId -> StudentName
StudentId -> GroupId
GroupId -> GroupName
CourseId -> CourseName
LecturerId -> LecturerName
StudentId, CourseId -> LecturerId
StudentId, CourseId -> Mark

По 3-му пункту S должно быть минимально по включению. Попытаемся удалить каждое правило:
StudentId -> StudentName:
S' = S \ {StudentId -> StudentName}
Замыкание StudentId+S' = { GroupId, GroupName }. StudentName не принадлежит замыканию и значит удалить это правило нельзя.

StudentId -> GroupId:
S' = S \ { StudentId -> GroupId }
StudentId+S' = { StudentName } -> следовательно нельзя убрать.

GroupId -> GroupName:
S' = S \ { GroupId -> GroupName }
GroupId+S' = { StudentName, GroupId } -> следовательно нельзя убрать.

CourseId -> CourseName:
S' = S \ { CourseId -> CourseName }
CourseId+S' = { } -> следовательно нельзя убрать.

LecturerId -> LecturerName:
S' = S \ { LecturerId -> LecturerName }
LecturerId+S' = { } -> следовательно нельзя убрать.

StudentId, CourseId -> Mark:
S' = S \ { StudentId, CourseId -> Mark }
{ StudentId, CourseId }+S' = { StudentName, GroupId, GroupName, CourseId, CourseName, LecturerId, LecturerName } -> следовательно нельзя убрать.

StudentId, CourseId -> LecturerId:
S' = S \ { StudentId, CourseId -> LecturerId }
{ StudentId, CourseId }+S' = { StudentName, GroupId, GroupName, CourseId, CourseName, Mark } -> следовательно нельзя убрать.

Таким образом S уже является минимальным по включению.

StudentId -> StudentName
StudentId -> GroupId
GroupId -> GroupName
CourseId -> CourseName
LecturerId -> LecturerName
StudentId, CourseId -> LecturerId
StudentId, CourseId -> Mark