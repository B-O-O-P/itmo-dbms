SolvedByTeam(ContestId, Letter) :-
    Sessions(SessionId, :TeamId, ContestId, _),
    Runs(_, SessionId, Letter, _, 1).
TeamsAlsoSolved(TeamId) :-
    Teams(TeamId, _),
    Problems(ContestId, ).