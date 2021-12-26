select DistinctTasks.SessionId, sum(DistinctTasks.Accepted) as Solved
from (select distinct Runs.SessionId, Runs.Letter, Runs.Accepted
      from Runs
      where Runs.Accepted = 1
     ) DistinctTasks
group by DistinctTasks.SessionIdl;