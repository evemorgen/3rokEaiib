-module(mod).

-export([fun1/1, dodaj5/1]).

fun1(Mess) ->
    "Healthcheck - " ++ Mess.

dodaj5(Liczba) ->
    Liczba + 5.
