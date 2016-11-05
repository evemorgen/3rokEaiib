-module(pmap).
-compile(export_all).

random_list(N) ->
    [rand:uniform(9) || _ <- lists:seq(1, N)].

add_thirteen(X) -> X + 13.

do_and_send(PID, Fun, Arg) ->
    PID ! Fun(Arg).

awesome_map(Fun, Lista) ->
    awesome_map(Fun, Lista, length(Lista)).
awesome_map(_, [], Ile) ->
    [receive X -> X end || _ <- lists:seq(1, Ile)];
awesome_map(Fun, [Pocz | Reszta], Ile) ->
    spawn(pmap, do_and_send, [self(), Fun, Pocz]),
    awesome_map(Fun, Reszta, Ile).

czasyMapowania(Fun, N) ->
    Lista = random_list(N),
    {Czas1, _} = timer:tc(lists, map, [Fun, Lista]),
    {Czas2, _} = timer:tc(pmap, awesome_map, [Fun, Lista]),
    io:format('zwykla mapa:~p us~n', [Czas1]),
    io:format('awesome mapa:~p us~n', [Czas2]).
