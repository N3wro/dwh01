USE s_kartal_efekan_1;

--CREATE SCHEMA dwh;
GO

drop table if exists dwh.UmsatzFakt;
drop table if exists dwh.FrachtFakt;
drop table if exists dwh.Artikel;
drop table if exists dwh.Kunden;
drop table if exists dwh.Personal;
drop table if exists dwh.VersandFirmen;
drop table if exists dwh.Zeit;

drop sequence if exists dwh.Artikel_Seq;
drop sequence if exists dwh.Kunden_Seq;
drop sequence if exists dwh.Personal_Seq;
drop sequence if exists dwh.Versandfirmen_Seq;
drop sequence if exists dwh.Zeit_Seq;

CREATE SEQUENCE dwh.Artikel_Seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 1000000
CACHE 10;

CREATE SEQUENCE dwh.Kunden_Seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 1000000
CACHE 10;

CREATE SEQUENCE dwh.Personal_Seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 1000000
CACHE 10;

CREATE SEQUENCE dwh.Versandfirmen_Seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 1000000
CACHE 10;

CREATE SEQUENCE dwh.Zeit_Seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 1000000
CACHE 10;


create table dwh.Artikel (
    Artikel_ID int NOT NULL PRIMARY KEY DEFAULT (NEXT VALUE FOR dwh.Artikel_Seq),
    ArtikelNr varchar(300),
    Artikel varchar(400),
    LieferNr varchar(200),
    Firma varchar(200),
    Ort varchar(200),
    Land varchar(200),
    KategNr int,
    KategName varchar(200),
   )

create table dwh.Kunden (
    Kunden_ID int NOT NULL PRIMARY KEY DEFAULT (NEXT VALUE FOR dwh.Kunden_Seq),
    KundenCode int,
    Firma varchar(400),
    Ort varchar(200),
    Land varchar(200),
   )

create table dwh.Personal (
	Personal_ID int NOT NULL PRIMARY KEY DEFAULT (NEXT VALUE FOR dwh.Personal_Seq),
    PersonalNr int,
    Nachname varchar(300),
    Vorname varchar(400),
    Position varchar(200),
   )

create table dwh.VersandFirmen (
    Versandfirm_ID int NOT NULL PRIMARY KEY DEFAULT (NEXT VALUE FOR dwh.Versandfirmen_Seq),
    FirmenNr int,
    Firma varchar(400),
   )

create table dwh.Zeit (
    Zeit_ID  int NOT NULL PRIMARY KEY DEFAULT (NEXT VALUE FOR dwh.Zeit_Seq),
    Monat int,
    Quartal int,
	Jahr int
   )
create table dwh.UmsatzFakt(
Artikel_ID int  foreign key references dwh.Artikel(Artikel_ID),
Kunden_ID int  foreign key references dwh.Kunden(Kunden_ID),
Zeit_ID int  foreign key references dwh.Zeit(Zeit_ID),
Umsatz int,
primary key(Artikel_ID,Kunden_ID, Zeit_ID) 
);


create table dwh.FrachtFakt(
Personal_ID int foreign key references dwh.Personal(Personal_ID),
Versandfim_ID int foreign key references dwh.VersandFirmen(Versandfirm_ID),
Zeit_ID int  foreign key references dwh.Zeit(Zeit_ID),
Frachtkosten int,
primary key(Personal_ID, VersandFim_ID, Zeit_ID)
)
