select Teams.TeamName
from Teams
where Teams.TeamId in (
    select distinct TeamId
    from Sessions, Runs
    where Sessions.SessionId = Runs.SessionId
      and Sessions.ContestId = :ContestId
      and Runs.Letter = :Letter
      and Runs.Accepted = 1
)