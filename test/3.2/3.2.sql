delete
from Runs
where SessionId in (
    select SessionId
    from Sessions
             natural join Teams
    where Teams.TeamName = :TeamName
)