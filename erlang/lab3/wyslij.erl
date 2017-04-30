-module(wyslij).

-export([wysylacz/2]).

wysylacz(PID, Wiadomosc) ->
    PID ! {self(), Wiadomosc}.

