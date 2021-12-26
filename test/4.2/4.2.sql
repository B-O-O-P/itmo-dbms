select distinct DistinctTasks.TeamId, count(*) as Solved
from (
         select distinct Sessions.TeamId, Sessions.ContestId, Runs.Letter
         from Runs
                  natural join Sessions
         where Accepted = 1
     ) DistinctTasks
group by DistinctTasks.TeamId;