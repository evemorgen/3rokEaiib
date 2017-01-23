-module(kolos).
-compile(export_all).

sumka([], Suma) -> Suma;
sumka([P | K], Suma) -> sumka(K, P + Suma).
sumka(Lista) -> sumka(Lista, 0).


sluchacz(Lista) ->
    receive
        {new, Pid} -> sluchacz(lists:append(Lista, [Pid]));
        {del, Pid} -> sluchacz(lists:delete(Pid, Lista))
    after 1000 ->
              lists:map(fun(X) -> X ! self() end, Lista),
              sluchacz(Lista)
    end.

fibo_reku(0) -> 0;
fibo_reku(1) -> 1;
fibo_reku(N) -> fibo_reku(N-1) + fibo_reku(N-2).

fibo_iter(N) -> fibo_iter(N, 0, 1).
fibo_iter(0, Wynik, _) -> Wynik;
fibo_iter(Iter, Wynik, Next) -> fibo_iter(Iter-1, Next, Wynik+Next).

foo(N) -> [spawn(fun() -> self() end) || _ <- lists:seq(1, N)].

foo2(Lista) -> lists:map(fun(Pid) -> Pid ! 'Hello' end, Lista).

superProces() ->
    receive
        die ->
            exit(self(), ok)
    end,
    superProces().

pita(N) -> pita(N, []).
pita(0, Wynik) -> Wynik;
pita(N, Wynik) -> pita(N-1, Wynik ++ [{2*N + 1, 2*N*(N + 1), 2*N*N + 2*N + 1}]).

start() ->
    PIDY = [spawn(kolos, start, []) || _ <- lists:seq(1,100)],
    wysylaj(PIDY).

wysylaj(PIDY) ->
    lists:map(fun(PID) -> PID ! "wassup process?" end, PIDY),
    wysylaj(PIDY).

a(PID) ->
    receive
        stop -> zatrzymane
    after 1000 ->
              PID ! {'LOL', self()},
              receive
                  _ -> io:format('spoko', []), a(PID)
              after 200 ->
                  io:format('nope', []),
                  exit(self(), bye)
              end
    end.

b() ->
    receive
        {Wiad, PID} -> PID ! Wiad, b()
    end.

pyth1(N) ->
    [ {A,B,C} ||
        A <- lists:seq(1,N),
        B <- lists:seq(1,N),
        C <- lists:seq(1,N),
        A+B+C =< N,
        A*A+B*B == C*C
    ].

pyth2(N) ->
    [ {A,B,C} ||
        A <- lists:seq(1,N),
        B <- lists:seq(1,N),
        C <- lists:seq(1,N),
        A*A+B*B == C*C
    ].
