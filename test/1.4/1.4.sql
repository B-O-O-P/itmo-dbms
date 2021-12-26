select TeamName
from (
         select distinct TeamsWithoutTasks.TeamId, TeamsWithoutTasks.TeamName
         from (
                  select Teams.TeamId, Teams.TeamName, Contests.ContestId
                  from Teams
                           natural join Contests
                      except
                  select distinct Teams.TeamId, Teams.TeamName, Sessions.ContestId
                  from Sessions
                           natural join Runs
                           natural join Teams
                  where Runs.Accepted = 1
              ) TeamsWithoutTasks
     ) TeamNamesWithoutTasks