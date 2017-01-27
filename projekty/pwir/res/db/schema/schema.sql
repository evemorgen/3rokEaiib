\c shadow_killer

drop table audit_log;
drop table available_jobs;
drop table registred_workers;
drop table dictionary;
drop table nicknames;

create table audit_log (
    id      serial primary key,
    owner   text not null,
    email   text not null,
    shadow  text not null,
    ts      timestamp not null
);

create table available_jobs (
    id              serial primary key,
    username        text not null,
    hash            text not null,
    salt            text not null,
    algorithm       text not null,
    job_status      text,
    dict_failure    boolean,
    worker_id       text,
    last_update     timestamp,
    status          text,
    result          text,
    checked_letters hstore default '"a" => false, "b" => false, "c" => false, "d" => false, "e" => false, "f" => false, "g" => false, "h" => false, "i" => false, "j" => false, "k" => false, "l" => false, "m" => false, "n" => false, "o" => false, "p" => false, "r" => false, "s" => false, "t" => false, "u" => false, "v" => false, "w" => false, "x" => false, "y" => false, "z" => false' 
);

create table registred_workers (
    id              text primary key,
    nickname        text,
    host_id         text,
    cluster_type    text not  null,
    time_alive      timestamp
);

create table dictionary (
    word_index      char(1),
    word            text
);
