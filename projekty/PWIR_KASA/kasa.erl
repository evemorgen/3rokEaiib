-module(kasa).
-compile(export_all).

spawn_kasa(Rodzaj, ObserverPid) -> spawn(kasa, register_kasa, [Rodzaj, ObserverPid]).

register_kasa(Rodzaj, ObserverPid) ->
    PID = spawn(kasa, kasa, [Rodzaj, ObserverPid]),
    ObserverPid ! {kasa, PID, Rodzaj}.

kasa(Rodzaj, ObserverPid) ->
    receive
        {klient, Id, _, Time} ->
            io:format("[~p] obsluguje klienta ~p~n", [self(), Id]),
            timer:sleep(Time),
            ObserverPid ! {kasa, self(), Rodzaj},
            kasa(Rodzaj, ObserverPid)
    end.
