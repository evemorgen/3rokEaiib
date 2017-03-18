-module(klient_spawner).
-compile(export_all).

businesses() -> [kupno, raty, odbior].

spawn_klient_spawner(KIOSK, Min, Rem) ->
    spawn(klient_spawner, spawner, [KIOSK, Min, Rem]).

random_element(Lista) ->
    lists:nth(rand:uniform(length(Lista)), Lista).

generate_client() ->
    Business = random_element(businesses()),
    Time = (round(rand:uniform()*10000) rem 5000 + 1000),
    {klient, erlang:system_time(), Business, Time}.

spawner(ShopAddress, Min, Rem) ->
    A = (round(rand:uniform()*10000) rem Rem + Min),
    receive
        _ -> 0
    after A ->
        Client = generate_client(),
        io:format('Hello, i generated client ~pms~n', [Client]),
        ShopAddress ! Client,
        spawner(ShopAddress, Min, Rem)
    end.
