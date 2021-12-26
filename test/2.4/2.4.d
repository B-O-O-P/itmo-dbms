SomeoneSolved(ContestId, Letter) :-
    Sessions(SessionId, _, ContestId, _),
    Runs(_, SessionId, Letter, _, 1).
NooneSolved(ContestId, Letter) :-
    Problems(ContestId, Letter, _),
    not SomeOneSolved(ContestId, Letter).