-module(run).
-compile(export_all).

run() ->
    compile:file(kiosk),
    compile:file(kasa),
    compile:file(klient_spawner),
    KIOSK = kiosk:spawn_kiosk(),
    kasa:spawn_kasa(raty, KIOSK),
    kasa:spawn_kasa(kupno, KIOSK),
    kasa:spawn_kasa(kupno, KIOSK),
    kasa:spawn_kasa(odbior, KIOSK),
    klient_spawner:spawn_klient_spawner(KIOSK, 200, 5000).
