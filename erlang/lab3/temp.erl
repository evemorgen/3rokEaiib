-module(temp).

-compile(export_all).

wrap(PID, Tupel, Target) ->
    PID ! lab1:temp_conv(Tupel, Target).

c_temp(Lista) -> c_temp(self(), Lista, length(Lista)).
c_temp(_, [], N) -> [receive X -> X end || _ <- lists:seq(1, N)];
c_temp(PID, [{From, Temp, Target} | Reszta], N) ->
    spawn(temp, wrap, [PID, {From, Temp}, Target]),
    c_temp(PID, Reszta, N).

