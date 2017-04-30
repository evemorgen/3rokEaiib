-module(primes).
-export([sieve/1]).
-include_lib("eunit/include/eunit.hrl").

sieve([]) ->
    [];
sieve([H|T]) ->
    List = lists:filter(fun(N) -> N rem H /= 0 end, T),
    [H|sieve(List)];
sieve(N) ->
    sieve(lists:seq(2,N)).
