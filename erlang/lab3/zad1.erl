-module(zad1).

-export([hello/1, start/0]).

hello(Message) ->
    io:format("|~s|", [Message]).


start() ->
    Pid1 = spawn(zad1, hello, ["Dupa1"]),
    Pid2 = spawn(zad1, hello, ["Dupa2"]),
    io:format("~w ... ~w", [Pid1, Pid2]).
