
set schema 'kwiaciarnia';

drop table klienci;
drop table kompozycje;
drop table zamowienia;
drop table odbiorcy;
drop table historia;
drop table zapotrzebowanie;

create table klienci (
    idklienta   varchar(10) primary key,
    haslo       char(10) check(char_length(haslo) >= 4) not null,
    nazwa       varchar(40) not null,
    miasto      varchar(40) not null,
    kod         varchar(6) check(char_length(haslo) = 6),
    adres       varchar(40) not null,
    email       varchar(40) not null,
    telefon     varchar(16) not null,
    fax         varchar(16),
    nip         char(13),
    regon       char(9))
);

create table kompozycje (
    idkompozycji        char(5) primary key,
    nazwa               varchar(40) not null,
    opis                varchar(100),
    cena                numeric(10, 2) check(cena >= 40.0),
    minimum             integer,
    stan                integer
);

create table odbiorcy (
    idodbiorcy  serial primary key,
    nazwa       varchar(40) not null,
    miasto      varchar(40) not null,
    kod         varchar(6) not null,
    adres       varchar(40) not null
);

create table zamowienia (
    idzamowienia        integer primary key,
    idklienta           varchar(10) references klienci not null,
    idodbiorcy          integer references odbiorcy not null,
    idkompozycji        char(5) references kompozycje not null
    termin              date not null,
    cena                numeric(10,2),
    zaplacone           boolean,
    uwagi               varchar(200)
);

create table historia (
    idzamowienia        integer primary key,
    idklienta           varchar(10),
    idkompozycji        char(5),
    cena                numeric(10,2),
    termin              date
);

create table zapotrzebowanie (
    idkompozycji        char(5),
    data                date,
    primary key (idkompozycji),
    foreign key (idkompozycji) references zapotrzebowanie
);
