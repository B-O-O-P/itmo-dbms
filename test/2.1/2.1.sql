select distinct Sessions.TeamId
from Sessions, Runs
where Sessions.ContestId = :ContestId
  and Sessions.SessionId = Runs.SessionId
  and Runs.Letter = :Letter
  and Runs.Accepted = 1;