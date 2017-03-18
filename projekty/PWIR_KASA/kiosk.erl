-module(kiosk).
-compile(export_all).

spawn_kiosk() -> spawn(kiosk, kiosk, [[], [], 1]).

first_matching_tuple(_, []) -> null;
first_matching_tuple(Typ, [{Pid, Typ} | _]) -> Pid;
first_matching_tuple(Typ, [{klient, Id, Typ, Time} | _]) -> {klient, Id, Typ, Time};
first_matching_tuple(Typ, [_ | Reszta]) ->
    first_matching_tuple(Typ, Reszta).

add_to_waiting_queue(NewElement, List) ->
    case lists:member(NewElement, List) of
        true -> List;
        false -> List ++ [NewElement]
    end.

handle_queue([], ListaKlientow, ListaKas) -> {ListaKlientow, ListaKas};
handle_queue([{Pid, Typ} | T], ListaKlientow, ListaKas) ->
    A = first_matching_tuple(Typ, ListaKlientow),
    case A of
        null -> handle_queue(T, ListaKlientow, ListaKas);
        Klient ->
            Pid ! Klient,
            handle_queue(T, lists:delete(Klient, ListaKlientow), lists:delete({Pid, Typ}, ListaKas))
    end.

kiosk(ListaKas, ListaOczekujacych, I) ->
    io:format('~p~nLista kas: ~p~nLista oczekujacych: ~p~n', [I, ListaKas, ListaOczekujacych]),
    receive
        {klient, KlientHash, Busines, Time} ->
            Klient = {klient, KlientHash, Busines, Time},
            io:format('HOLY SMOKE THE CLIENT IS HERE - ~p~n', [Klient]),
            WolnaKasa = first_matching_tuple(Busines, ListaKas),
            case WolnaKasa of
                null -> kiosk(ListaKas, add_to_waiting_queue(Klient, ListaOczekujacych), I + 1);
                Pid -> Pid ! Klient, kiosk(lists:delete({Pid, Busines}, ListaKas), lists:delete(Klient, ListaOczekujacych), I + 1)
            end;
        {kasa, Pid, Typ} ->
            NowaListaKas = ListaKas ++ [{Pid, Typ}],
            kiosk(NowaListaKas, ListaOczekujacych, I + 1)
    after 1000 ->
        io:format('obsluguje kolejke~n'),
        {NowiKlienci, NoweKasy} = handle_queue(ListaKas, ListaOczekujacych, ListaKas),
        io:format('pozostali klienci: ~p~npozostale kasy: ~p~n', [NowiKlienci, NoweKasy]),
        kiosk(NoweKasy, NowiKlienci, I + 1)
    end.
