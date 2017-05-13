-module(egzamin).
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

normal_fibo(N) -> normal_fibo(N, 1, 1).
normal_fibo(0, _, Wynik) -> Wynik;
normal_fibo(N, Aktualna, Wynik) -> normal_fibo(N-1, Wynik, Wynik+Aktualna).

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
    PIDY = [spawn(egzamin, start, []) || _ <- lists:seq(1,10)],
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

usrednij(Lista) -> usrednij(Lista, []).
usrednij([], Wynik) -> Wynik;
usrednij([Ostatni], Wynik) -> usrednij([], Wynik ++ [Ostatni]);
usrednij([Pierwszy, Drugi | Reszta], Wynik) -> usrednij(Reszta, Wynik ++ [(Pierwszy+Drugi)/2.0]).


start_100_proc() ->
    PIDY = [spawn(egzamin, pa_proces, []) || _ <- lists:seq(1,100)],
    receive
	_ -> nope
    after 2000 ->
        wyslij_pa(PIDY)
    end,
    PIDY.

wyslij_pa(PIDY) ->
    lists:map(fun(PID) -> PID ! pa end, PIDY).

pa_proces() ->
    io:format('heja, to ja: ~p', [self()]),
    receive
        pa ->
	  io:format('ok, zdycham ~p', [self()]),
          exit(papa)
    end.

zegar(T) ->
    receive
        {Msg,InneT} ->
           case InneT > T of
              true -> zegar(InneT+1);
              false -> zegar(T+1)
           end
           %do sth smart with msg
    end.


a(PID_B, PID_C) ->
    % sztuczny receive tylko po to, żeby wywoływać co 1s
    receive
      _ -> ok
    after 1000 ->
      PID_B ! 'Hello B',
      receive
        _ -> ok
      after 500 ->
        io:format('umieram :('),
        io:format('ale nie sam!'),
        exit(PID_B, umarlem),
        exit(PID_C, umarlem),
        exit(self(), umarlem)
      end
    end.

b(PID_C) ->
    receive
      Data -> PID_C ! Data
    end.

c(PID_A) ->
    receive
      Data -> PID_A ! Data
    end.



karuzela(SuperWiadomosc) ->
    PIDY = [spawn(egzamin, konik, []) || _ <- lists:seq(1,100)],
    lists:nth(1, PIDY) ! {PIDY ++ [self()], 2, SuperWiadomosc},
    receive
        {_, _, Wiad} -> io:format('glowny dostal: ~p~n', [Wiad])
    end.


konik() ->
    receive
        {PIDY, N, Wiad} ->
            io:format('pid: ~p o numerze ~p dostal wiadomosc~n', [self(), N]),
            lists:nth(N, PIDY) ! {PIDY, N+1, Wiad}
    end.

nparz(Lista) -> [X || X <- Lista, X rem 2 == 1].

sum_n(N) -> sum_n(N, 0).
sum_n(0, Sum) -> Sum;
sum_n(N, Sum) -> sum_n(N-1, Sum+N).

sum_n_m(N, M) ->
    case N > M of
        true -> exit('n < m');
        false -> sum_n_m(N, M, 0)
    end.

sum_n_m(N, N, Suma) -> Suma;
sum_n_m(N, M, Suma) -> sum_n_m(N+1, M, Suma + N).
