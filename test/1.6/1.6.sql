select distinct Sessions.SessionId
from Sessions except
select distinct SessionId
from (
         select Sessions.SessionId, Problems.Letter
         from Sessions
                  natural join Problems
             except
         select Runs.SessionId, Runs.Letter
         from Runs
     ) NotSolvedTasks