select distinct Problems.ContestId, Problems.Letter
from Problems
where not exists(
        select Sessions.ContestId, Runs.Letter
        from Sessions, Runs
        where Runs.SessionId = Sessions.SessionId
          and Runs.Letter = Problems.Letter
          and Runs.Accepted = 1
          and Sessions.ContestId = Problems.ContestId
    );