-module(node).

-export([node_start/3, node_loop/0, init/3]).

node_start(Aktualna, DolnyIndeks, GornyIndeks) ->
    PID = spawn(node, init, [Aktualna, DolnyIndeks, GornyIndeks]),
    PID.

init(Aktualna, DolnyIndeks, GornyIndeks) ->
    put("tabela", Aktualna),
    put("dolnyIndeks", DolnyIndeks),
    put("gornyIndeks", GornyIndeks),
    node_loop().

wykresl(Co) ->
    Tabela = get("tabela"),
    G = get("gornyIndeks"),
    D = get("dolnyIndeks"),
    io:format("~p ~p ~p ~p", [G, D, Tabela, Co]),
    wykresl(G, D, 0, Co, Tabela).

wykresl(G, D, Ind, Ile, Tabela) ->
    if
        (D + Ind*2) rem Ile == 0 ->
           A1 = array:set(Ind, true, Tabela);
        true ->
           A1 = Tabela
    end,
    if
        D + Ind*2 > G ->
          A1;
        true ->
           wykresl(G, D, Ind+1, Ile, A1)
    end.

node_loop() ->
    receive
        {_, umrzyj} -> exit(ok);
        {PID, CO} -> PID ! wykresl(CO)
    end,
    node_loop().
