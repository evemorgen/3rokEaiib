-module(lab7).

-compile(export_all).

stop(PID) ->
    io:format("exiting now", []),
    exit(PID, ok).

stop() ->
    PID = get(pid),
    stop(PID).

start() ->
    PID = spawn(lab7, serwer, []),
    put(pid, PID),
    PID.

serwer() ->
    receive
        {Fun, Args} -> mod:handle(Fun, Args);
        {stop} -> stop()
    end,
    serwer().
