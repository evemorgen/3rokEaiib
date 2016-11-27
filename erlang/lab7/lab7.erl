-module(lab7).

-compile(export_all).

stop(PID) ->
    io:format("exiting now", []),
    exit(PID, ok).

start() ->
    PID = spawn(lab7, serwer, []),
    put(pid, PID),
    put(logs, ["Server started"]),
    PID.

put_log(Mess, Args) ->
    put(logs, [io_lib:format(Mess, Args) | get(logs)]).

serwer() ->
    receive
        {SenderPid, Fun, Args} ->
            put_log("Runs functions ~p with args ~p~n", [Fun, Args]),
            Rep = apply(mod, Fun, Args),
            put_log("Returned value ~p~n", [Rep]),
            SenderPid ! Rep;
        {SenderPid, logs} ->
            put_log("Sending logs", []),
            SenderPid ! get(logs);
        {_, save} ->
            %% fix me pls
            file:write_file(io_lib:format("server-~p.log", [self()]), io_lib:format("~p", [lists:append(get(logs))]));
        {_, stop} ->
            put_log("Stopping server with pid ~p", [self()]),
            self() ! {self(), save},
            stop(self())
    end,
    serwer().
