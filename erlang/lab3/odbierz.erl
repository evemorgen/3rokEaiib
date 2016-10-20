-module(odbierz).

-export([ odbieracz/0, startuj/0 ]).

startuj() ->
    PID = spawn(odbierz, odbieracz, []),
    io:format("~w", [PID]),
    {ok, Mess} = io:read("Twoja super wiadomosc: "),
    wyslij:wysylacz(PID, Mess).

odbieracz(SenderPid) ->
    receive
        {Sender, Message} ->
            io:format("Message from ~w: ~s", [Sender, Message]),
            io:format("Sending it back, right away! (with additional dupa attached)"),
            SenderPid ! {self(), string:concat(Message, " DUPADUPA")},
    end.
