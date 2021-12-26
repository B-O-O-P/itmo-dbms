delete
from Runs
where SessionId in (
    select SessionId
    from Sessions
    where Sessions.ContestId = :ContestId
)