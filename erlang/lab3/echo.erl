-module(echo).

-compile(export_all).
%-export()

odbieracz() ->
    receive
        {From, Mess}->
            io:format("got ~s from ~p", [Mess, From]),
            From ! string:concat("echo: ", Mess),
            odbieracz()
    end.

wysylacz() ->
    PID = spawn(echo, odbieracz, []),
    wyslij_odbierz(PID).

wyslij_odbierz(PID) ->
    {ok, Mess} = io:fread("Message: ", "~s"),
    PID ! {self(), Mess},
    c:flush(),
    wyslij_odbierz(PID).
