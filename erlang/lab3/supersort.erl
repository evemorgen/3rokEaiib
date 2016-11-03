-module(supersort).

-compile(export_all).

random_list(N) ->
    [rand:uniform(9) || _ <- lists:seq(1, N)].

bombelek([A,B]) ->
    if A > B ->
           [A, B];
    true ->
           [B, A]
    end.

bombelkowe(Lista) ->
    abba(Lista, 0, length(Lista)-1, length(Lista)-1).

abba(Lista, Gdzie, IleJeszcze, IleJeszcze2) ->
    if IleJeszcze2 > 0 ->
        if
            IleJeszcze > 0 ->
                {Pierwsza, Reszta} = lists:split(Gdzie, Lista),
                {DoSortu, Koniec} = lists:split(2, Reszta),
                Posort = bombelek(DoSortu),
                Wynik = Pierwsza ++ Posort ++ Koniec,
                abba(Wynik, Gdzie+1, IleJeszcze-1, IleJeszcze2);
            true -> abba(Lista, 0, length(Lista)-1, IleJeszcze2-1)
        end;
       true -> Lista
    end.

superQsort([]) -> [];
superQsort([Piwo|Reszta]) ->
        superQsort([ X || X <- Reszta, X < Piwo]) ++
        [Piwo] ++
        superQsort([ X || X <- Reszta, X >= Piwo]).

czasySortowania(N) ->
    Lista = random_list(N),
    {Czas1, _} = timer:tc(supersort, bombelkowe, [Lista]),
    {Czas2, _} = timer:tc(supersort, superQsort, [Lista]),
    io:format('bombelek:~p s', [Czas1]),
    io:format('qsort:~p s', [Czas2]).

merge([], [], A) -> A;
merge([], B, A) -> A ++ B;
merge(B, [], A) -> A ++ B;
merge(C, B, A) ->
    FirstC = lists:nth(1, C),
    FirstB = lists:nth(1, B),
    if FirstC < FirstB ->
           BezC = lists:delete(FirstC, C),
           merge(BezC, B, A++[FirstC]);
       true ->
           BezB = lists:delete(FirstB, B),
           merge(C, BezB, A++[FirstB])
    end.


concurrentSort({PID,[]}) -> io:format('ZEROELEMENTOWA []~n'), PID ! {self(), []};
concurrentSort({PID,[A]}) -> io:format('JEDNOELEMENTOWA ~p PID ~p~n', [A, PID]), PID ! {self(), [A]};
concurrentSort({PID, [A, B]}) ->
    io:format('DWUELEMENTOWA ~p ~p, PID ~p~n', [A, B, PID]),
    if
        A < B -> PID ! {self(), [A, B]};
        true -> PID ! {self(),[B, A]}
    end;
concurrentSort({_, Lista}) ->
    {Pierwsza, Druga} = lists:split(length(Lista) div 2, Lista),
    io:format('P: ~p, D: ~p, PID: ~p~n', [Pierwsza, Druga, self()]),
    PID1 = spawn(supersort, concurrentSort, [{self(),Pierwsza}]),
    PID2 = spawn(supersort, concurrentSort, [{self(),Druga}]),
    Zwiazana1 = receive {PID1, PierwszaPolowa} -> PierwszaPolowa end,
    Zwiazana2 = receive {PID2, DrugaPolowa} -> DrugaPolowa end,
    io:format('O1: ~p, O2: ~p, PID: ~p~n', [Zwiazana1, Zwiazana2, self()]),
    Zmerdzowane = merge(Zwiazana1, Zwiazana2, []),
    io:format('MERGED: ~p~n', [Zmerdzowane]),
    {self(),Zmerdzowane};
concurrentSort(Lista) -> concurrentSort({self(), Lista}).


