-module(mod).

-export([fun1/1]).

fun1(Mess) ->
    io:fwrite('Healthcheck - ~s~n', [Mess]).

handle(fun, Args) ->

