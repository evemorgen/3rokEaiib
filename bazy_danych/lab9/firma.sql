
set schema 'firma';

drop table pracownicy cascade;
drop table dzialy;

create table dzialy (
    iddzialu    char(5) primary key,
    nazwa       varchar(32) not null,
    lokalizacja varchar(24) not null,
    kierownik   integer
);

create table pracownicy (
    idpracownika        integer primary key,
    nazwisko            varchar(32) not null,
    imie                varchar(16) not null,
    dataurodzenia       date not null,
    dzial               char(5) references dzialy not null,
    stanowisko          varchar(24),
    pobory              numeric(10, 2)
);

insert into dzialy values ('PH101','Handlowy','Marki',77), ('PR202','Projektowy','Olecko',27), ('PK101','Personalny','Niwka',72);
insert into pracownicy values (27,'Kruk','Adam','15/12/1989','PK101','kierownik',2200.00);
insert into pracownicy values (270,'Kowalik','Artur','13/12/1988','PK101','analityk',2400.00);
insert into pracownicy values (72,'Kowalik','Adam','15/11/1989','PR202','kierownik',2600.00);
insert into pracownicy values (720,'Kowalik','Amadeusz','17/12/1988','PK101','analityk',3200.00);
insert into pracownicy values (707,'Kukulka','Antoni','15/12/1999','PH101','robotnik',1600.00);
insert into pracownicy values (207,'Kowal','Alojzy','15/10/1998','PH101','robotnik',2000.00);
insert into pracownicy values (77,'Kowalus','Adam','12/11/1998','PH101','kierownik',5400.00);
insert into pracownicy values (1010,'Kawula','Alojzy','15/11/1998','PK101','robotnik',2500.00);

alter table dzialy add constraint dzial_fk foreign key(kierownik) references pracownicy(idpracownika) on update cascade;
