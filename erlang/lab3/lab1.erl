-module(lab1).

-export([area/1, volume/1, len/1, amin/1, amax/1, tmin_max/1, lmin_max/1, lista_pol/1, listaN/1, lista_jedynek/1, lista_elementow/2, temp_conv/2]).

%
% Zadanie 1.
%
area({rect,X,Y}) ->
    X*Y;
area({cir,X}) -> 3.14*X*X;
area({tri, A, H}) ->
    (A*H)/2;
area({trap, A, B, H}) ->
    (A + B)*H/2;
area({kula, R}) -> 4*math:pi()*math:pow(R,2);
area({szescian, A}) -> area({rect, A, A})*6;
area({stozek, R, L}) -> math:pi()*R*(R+L).


volume({kula, R}) -> (4/3)*(math:pi())*(math:pow(R, 3));
volume({szescian, A}) -> math:pow(A,3);
volume({stozek, A, H}) -> (1/3)*math:pi()*math:pow(A,2)*H.

%
% Zadanie 2.
%
len([]) -> 0;
len([_ | Tail]) -> 1 + len(Tail).

%
% Zadanie 3.
%
amin([H|T]) -> amin(T, H).
amin([], A) -> A;
amin([Head | Tail], A) ->
    if
        Head > A ->
            amin(Tail, A);
        true ->
            amin(Tail, Head)
    end.

%
% Zadanie 4.
%
amax([H|T]) -> amax(T, H).
amax([], A) -> A;
amax([Head | Tail], A) ->
    if
        Head < A ->
            amax(Tail, A);
        true->
            amax(Tail, Head)
    end.

%
% Zadanie 5.
%
tmin_max(Lista) -> {amin(Lista), amax(Lista)}.

%
% Zadanie 6.
%
lmin_max(Lista) -> [amin(Lista), amax(Lista)].

%
% Zadanie 7.
%
lista_pol(ListaKrotek) -> [area(X) || X <- ListaKrotek].

%
% Zadanie 8.
%
listaN(N) -> lists:reverse(lists:seq(1, N)).

%
% Zadanie 9.
%
temp_conv({c, C}, k) -> {k, 273.15 + C};
temp_conv({f, F}, k) -> {k, (F + 459.67) * 5/9};
temp_conv({n, N}, k) -> {k, (N/0.33000) + 273.14};
temp_conv({r, R}, k) -> {k, R * 5/9};
temp_conv({k, K}, k) -> {k, K};

temp_conv({k, K}, c) -> {c, K - 273.15};
temp_conv({k, K}, f) -> {f, (K - 273.15)*1.8 + 32};
temp_conv({k, K}, n) -> {n, (K - 273.15)*0.33};
temp_conv({k, K}, r) -> {r, K * 9/5};
temp_conv({OTHER, Value}, Target) -> temp_conv(temp_conv({OTHER, Value}, k), Target).

%
% Zadanie 10.
%
lista_jedynek(N) -> [1 || _ <- lists:seq(1, N)].
lista_elementow(N, Elem) -> [Elem || _ <- lists:seq(1, N)].
