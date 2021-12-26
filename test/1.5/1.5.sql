select Teams.TeamName
from Teams
where Teams.TeamId in (
    select TeamsWithoutOneTask.TeamId
    from (
             select Teams.TeamId, Sessions.ContestId
             from Teams natural join Sessions
                 except
             select Sessions.TeamId, Sessions.ContestId
             from Sessions natural join Runs
             where Runs.Accepted = 1
         ) TeamsWithoutOneTask
)