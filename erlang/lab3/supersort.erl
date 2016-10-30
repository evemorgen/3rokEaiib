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
superQsort([A]) -> [A];
superQsort(Lista) ->
    Piwo = lists:nth(1, Lista),
    Lewa = [X || X <- Lista, X =< Piwo],
    Prawa = [X || X <- Lista, X > Piwo],
    io:format('~p~n', [Lista]),
    superQsort(Lewa) ++ [Piwo] ++ superQsort(Prawa).

czasySortowania() ->
    Lista = random_list(100),
    {Czas, _} = timer:tc(supersort, bombelkowe, [Lista]),
    io:format('~p s', [Czas/1000000]).
