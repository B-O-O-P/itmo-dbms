select Runs.RunId, Runs.SessionId, Runs.Letter, Runs.SubmitTime, Runs.Accepted
from Sessions natural join Runs natural join Problems
where Sessions.TeamId = :TeamId
 and Sessions.ContestId = :ContestId;