USE s_kartal_efekan_1;

--CREATE SCHEMA oltp;
GO
drop table if exists oltp.BestDtl 
drop table if exists oltp.Bestell
drop table if exists oltp.Personal 
drop table if exists oltp.Firmen 
drop table if exists oltp.Artikel 
drop table if exists oltp.Kategor 
drop table if exists oltp.Kunden 
drop table if exists oltp.Liefernt 




create table oltp.Liefernt(
	lieferNr int Primary Key,
	firma varchar(50),
	kontaktPers varchar(30),
	position	varchar(30),
	strasse		varchar(30),
	ort	varchar(30),
	region	varchar(30),
	PLZ varchar(30),
	land	varchar(30),
	telefon	varchar(30),
	telefax	varchar(30)
)

create table oltp.Kategor(
	kategNr int Primary Key,
	kategName varchar(30),
	beschreib varchar(30)
)

create table oltp.Artikel(
	artikelNr int Primary Key,
	lieferNr int foreign key references oltp.Liefernt(lieferNr),
	kategNr int foreign key references oltp.Kategor(KategNr),
	artikel	varchar(30),
	lieferEinh	int,
	einzPreis	decimal(7,2),
	lagerBest	float,
	bestEinh int,
	minBestand	int,
	auslaufArt	varchar(10)
)

create table oltp.Firmen(
	firmenNr int Primary Key,
	firma varchar(30)
)

create table oltp.Kunden(
	kundenCode int Primary Key,
	Firma varchar(60),
	KontkPers varchar(30),
	Position	varchar(30),
	Strasse		varchar(30),
	Ort	varchar(30),
	Region	varchar(30),
	PLZ varchar,
	Land	varchar(20),
	Telefon	varchar(30),
	Telefax	varchar(30)
)

create table oltp.Personal(
	personalNr int Primary Key,
	nachName varchar(30),
	vorName varchar(30),
	position	varchar(30),
	geburtsDat	date,
	einsDat	date,
	strasse	varchar(30),
	ort varchar(30),
	region	varchar(30),
	plz	varchar(30),
	land	varchar(30),
	telPrivat varchar(30),
	telBuero varchar(30),
	bemerkung varchar(30),
	vorgesetzt varchar(30)
)


create table oltp.Bestell(
	bestllNr int Primary Key,
	kundenCode int foreign key references oltp.Kunden(kundenCode),
	personalNr int foreign key references oltp.Personal(personalNr),
	empfaenger	varchar(30),
	strasse	varchar(30),
	ort	varchar(30),
	region	varchar(30),
	zielLand varchar(30),
	versndFirm	int  foreign key references oltp.Firmen(firmenNr),
	bestelldatum date,
	lieferdatum date,
	versanddatum	date,
	frachtKost decimal(7,2)
)

create table oltp.bestDtl(
	bestllNr int foreign key references oltp.Bestell(bestllNr),
	artikelNr int foreign key references oltp.Artikel(artikelNr),
	einzPreis decimal(4,2),
	anzahl int,
	rabatt decimal(4,2),
	primary key(bestllNr,artikelNr)
)


insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (1, 'REMEDYREPACK INC.', 'QPBZu', '5fcE6', 'Kropf', 'rXOLE', 'X0Qk0', '01', 'Afghanistan', '554-899-2411', '557-769-0825');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (2, 'Topco Associates LLC', 'XjJ9d', 'HAJU1', 'Clyde Gallagher', 'ufYjX', 'vYxWd', '126', 'Afghanistan', '772-994-0952', '118-287-7770');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (3, 'Qualitest Pharmaceuticals', 'zt0ma', 'D7zZ3', 'Acker', 'V46R0', 'o4qLH', '31', 'Afghanistan', '834-632-4849', '140-313-7141');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (4, 'Qualitest Pharmaceuticals', 'f0gEQ', 'w51HD', 'Boyd', 'AMj93', 'IJfeZ', '90412', 'Afghanistan', '678-305-4475', '547-311-3181');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (5, 'Nelco Laboratories, Inc.', 'SuEZU', 'glqnM', 'Nobel', 'oIt3Y', 'rPYvC', '45784', 'Afghanistan', '532-581-9087', '178-491-9450');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (6, 'L''Oreal USA Products Inc', '5DOqF', 'Y9X58', 'Vidon', '5gaIw', 'YeCjF', '09', 'Afghanistan', '934-181-7613', '728-846-3060');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (7, 'Bayer HealthCare Pharmaceuticals Inc.', '1iIsh', 'UydTD', 'Parkside', '5H0rQ', 'cpLZy', '802', 'Afghanistan', '512-966-4710', '788-917-1124');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (8, 'Antigen Laboratories, Inc.', 'lIpKF', 'fdVxW', 'Meadow Vale', 'JUclc', 'hBqGG', '97682', 'Afghanistan', '443-219-7099', '275-604-2286');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (9, 'Star Pharmaceuticals, LLC', 'RvjOm', 'qaTlY', 'Luster', 'mIHE1', 'JEzv8', '615', 'Afghanistan', '919-405-6483', '693-841-2215');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (10, 'Validus Pharmaceuticals LLC', 'dUhHN', 'Hg8a1', 'Independence', 'MXMCz', 'mKSGM', '34', 'Afghanistan', '388-486-1799', '411-522-3339');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (11, 'REMEDYREPACK INC.', '5SKKD', 'nANao', 'Bellgrove', 'coAVx', 'IxcHS', '8266', 'Afghanistan', '804-315-2563', '642-914-3884');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (12, 'A-S Medication Solutions LLC', 'R3MjU', 'qaCmF', 'Oak', 'L9HJg', '9pCM5', '75955', 'Afghanistan', '428-785-4410', '142-704-1979');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (13, 'VIATREXX BIO INCORPORATED', 'crdwb', 'aPaw6', 'Harper', 'hiJym', '0l4BC', '67', 'Afghanistan', '752-852-7449', '438-956-0530');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (14, 'Humco Holding Group, Inc.', 'K2geV', 'wvuWP', 'Hoffman', '3Cods', 'OX9eM', '38', 'Afghanistan', '468-326-9179', '746-160-5874');
insert into oltp.Liefernt (liefernr, firma, kontaktpers, position, strasse, ort, region, plz, land, telefon, telefax) values (15, 'Jubilant HollisterStier LLC', 'Ihobu', 'jZkhT', 'Brickson Park', 'ImtcX', 'uLpXD', '05', 'Afghanistan', '436-333-0021', '756-136-2023');

insert into oltp.Kategor (kategnr, kategname, beschreib) values (1, 'PC', 'tpHGX');
insert into oltp.Kategor (kategnr, kategname, beschreib) values (2, 'Staubsauger', 'wtwdh');
insert into oltp.Kategor (kategnr, kategname, beschreib) values (3, 'Küche', 'GnYx1');
insert into oltp.Kategor (kategnr, kategname, beschreib) values (4, 'Badezimmer', 'zVQIJ');
insert into oltp.Kategor (kategnr, kategname, beschreib) values (5, 'Garten', 'tjz00');
insert into oltp.Kategor (kategnr, kategname, beschreib) values (6, 'PKW', 'iwEC4');
insert into oltp.Kategor (kategnr, kategname, beschreib) values (7, 'Moped', 'VZn1Y');
insert into oltp.Kategor (kategnr, kategname, beschreib) values (8, 'Motorrad', 'P3Ut4');
insert into oltp.Kategor (kategnr, kategname, beschreib) values (9, 'Handy', 'XgMnK');

insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (1, '6', '8', 'Vfs2', 14, 37.11, 74, 83, 14, 'jWDfe');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (2, '1', '2', '9DYK', 30, 39.84, 55, 34, 30, 'F9vKm');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (3, '11', '4', 'fz7n', 74, 88.69, 3, 26, 2, 'me6z6');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (4, '3', '5', '55Pr', 2, 23.77, 85, 2, 93, 'wy8N3');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (5, '13', '9', 'tzkh', 91, 10.01, 55, 47, 55, 'saMgZ');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (6, '2', '3', 'sCya', 14, 64.64, 82, 7, 3, 'rPyCj');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (7, '10', '1', 'HULY', 90, 18.24, 54, 38, 54, 'SHlOD');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (8, '12', '7', 'OQbN', 81, 47.28, 30, 83, 50, 'Q589U');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (9, '14', '6', 'd2J9', 100, 97.15, 23, 13, 24, 'yo24Z');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (10, '7', '9', '2wQe', 65, 43.8, 100, 55, 11, 'C7HBc');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (11, '8', '3', 'BqxA', 34, 59.18, 64, 96, 19, 'fs8u8');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (12, '15', '5', 'Uw4l', 43, 80.24, 93, 61, 66, 'oNRMg');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (13, '5', '7', 'ZhyS', 16, 59.49, 27, 100, 43, 'u3iwd');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (14, '9', '8', 'rMUR', 56, 15.27, 42, 87, 88, 'lHwPC');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (15, '4', '1', 'lIRn', 41, 81.37, 37, 95, 74, 'CRLJt');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (16, '13', '6', '45yI', 50, 89.82, 82, 30, 98, '2bh8P');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (17, '4', '2', 'WFzo', 84, 34.72, 43, 76, 83, 'DflpL');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (18, '3', '4', 'e2E9', 20, 19.01, 73, 10, 47, 'OwVfu');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (19, '10', '4', '2hC9', 28, 43.49, 74, 63, 49, 'aHvQp');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (20, '1', '8', 'Fnf1', 68, 67.96, 94, 43, 31, 'WCOA8');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (21, '8', '7', 'U1T7', 40, 64.03, 26, 86, 57, 'IUkBp');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (22, '5', '9', 'lhDo', 24, 68.2, 89, 44, 18, 'tOkXu');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (23, '7', '5', '9GgJ', 11, 95.78, 66, 73, 35, '7RLgx');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (24, '9', '1', 'Qm9W', 75, 28.77, 32, 61, 4, 'l0N4A');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (25, '2', '2', 'zmhK', 75, 93.97, 68, 22, 24, 'XbUMU');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (26, '12', '6', 'nO6P', 30, 48.93, 16, 68, 56, '9Aqao');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (27, '14', '3', 'kkrj', 63, 18.11, 97, 67, 87, 'z5m0k');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (28, '6', '9', 'N7AG', 13, 51.65, 1, 61, 62, '90DfD');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (29, '11', '1', 'bw69', 99, 49.75, 73, 9, 51, 'x0jpj');
insert into oltp.Artikel (artikelnr, liefernr, kategnr, artikel, liefereinh, einzpreis, lagerbest, besteinh, minbestand, auslaufart) values (30, '15', '8', 'NoHM', 18, 32.71, 57, 12, 46, 'Y0fht');

insert into oltp.Firmen (firmennr, firma) values (1, 'Kartal Cooperation');
insert into oltp.Firmen (firmennr, firma) values (2, 'McKartals');
insert into oltp.Firmen (firmennr, firma) values (3, 'Amatal');


insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (1, 'Cardinal Health', 'vvbu', 'puqw', 'Gale', '5653 Straubel Alley', 'utey', 42, 'Germany', '745-944-9234', '379-936-6625');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (2, 'Glenmark Generics Inc., USA', 'fjtt', 'mixr', 'Messerschmidt', '57 Clemons Junction', 'avyf', 91, 'Germany', '550-617-4935', '901-312-0772');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (3, 'Cosmetica Laboratories Inc.', 'awmb', 'ruvj', 'Eggendart', '0 Orin Point', 'uyuz', 49, 'Germany', '807-980-2276', '974-907-2450');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (4, 'Washington Homeopathic Products', 'jjwm', 'hsbr', 'Melby', '51338 Monterey Crossing', 'roci', 98, 'Germany', '757-419-6553', '522-835-8905');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (5, 'Par Pharmaceutical, Inc.', 'yfyc', 'kejz', 'Myrtle', '9087 Myrtle Trail', 'qkio', 89, 'Germany', '634-467-1065', '886-297-1735');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (6, 'Actavis Elizabeth LLC', 'eqxm', 'drwo', 'Steensland', '75 Reinke Road', 'hwnw', 12, 'Germany', '938-825-5702', '721-140-0768');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (7, 'CARDINAL HEALTH', 'cwra', 'hhxo', 'Kingsford', '0813 Esch Crossing', 'qdmv', 99, 'Germany', '150-213-0886', '358-191-8438');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (8, 'Procter & Gamble Manufacturing Company', 'woce', 'whzw', 'Vernon', '43 Nova Park', 'slkf', 5, 'Germany', '647-362-8198', '642-760-2406');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (9, 'Kmart Corporation', 'iemb', 'oboz', 'Swallow', '65 Red Cloud Park', 'alie', 19, 'Germany', '951-672-2227', '315-274-9915');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (10, 'PD-Rx Pharmaceuticals, Inc.', 'ednr', 'kyaj', 'Green Ridge', '8 Columbus Point', 'agkl', 93, 'Germany', '326-435-1781', '678-877-1599');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (11, 'Aphena Pharma Solutions - Tennessee, LLC', 'khqb', 'kkqm', 'Bayside', '4329 Moulton Alley', 'nysw', 54, 'Germany', '964-918-4064', '436-636-3123');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (12, 'Zydus Pharmaceuticals (USA) Inc.', 'nmxg', 'xxtk', 'Forest Run', '74218 Valley Edge Avenue', 'iqwl', 64, 'Germany', '150-194-7584', '738-185-1479');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (13, 'State of Florida DOH Central Pharmacy', 'fmqj', 'wqxj', 'Maryland', '9 Forster Drive', 'hted', 42, 'Germany', '854-136-8393', '481-269-2351');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (14, 'Physicians Total Care, Inc.', 'uwox', 'gmls', 'Hovde', '82790 Gateway Place', 'iuxx', 5, 'Germany', '804-251-7615', '613-629-3596');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (15, 'Boehringer Ingelheim Pharmaceuticals, Inc.', 'uhhg', 'yjsg', 'Jay', '5980 Randy Trail', 'tqeb', 21, 'Germany', '291-570-8235', '868-872-0390');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (16, 'Cypress Pharmaceutical, Inc.', 'tgcp', 'jwkp', 'Hintze', '56063 Ludington Crossing', 'mijl', 91, 'Germany', '630-984-1848', '328-143-8737');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (17, 'Home Smart Products', 'qazk', 'higp', 'Blue Bill Park', '01 Warrior Circle', 'rmzk', 28, 'Germany', '398-124-3520', '828-366-8852');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (18, 'Unit Dose Services', 'zqye', 'ivgj', 'Springs', '0 Oneill Hill', 'bdpf', 93, 'Germany', '950-242-4530', '798-314-6081');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (19, 'Hy-Vee', 'zhfb', 'hier', 'Dixon', '09740 Green Ridge Terrace', 'mkep', 48, 'Germany', '529-624-4540', '187-295-7490');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (20, 'H E B', 'kwah', 'adcs', 'Arkansas', '9350 Talisman Drive', 'gkld', 80, 'Germany', '111-432-8233', '414-122-3819');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (21, 'Empack Spraytech Inc', 'shyn', 'rojj', 'Green Ridge', '31 Maple Wood Place', 'sujs', 33, 'Germany', '103-985-6686', '611-598-2310');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (22, 'Whisk Products, Inc.', 'qjao', 'eqem', 'Stoughton', '31663 Northwestern Way', 'mkol', 89, 'Germany', '249-872-7413', '742-484-7478');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (23, 'Publix Super Markets Inc', 'ejkz', 'stbh', 'Dayton', '228 Myrtle Hill', 'fswa', 48, 'Germany', '788-865-4677', '330-201-8075');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (24, 'Mylan Institutional Inc.', 'hkuk', 'hemm', 'Lighthouse Bay', '0894 Sherman Park', 'jwoy', 100, 'Germany', '752-606-8431', '338-129-3590');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (25, 'Lake Erie Medical DBA Quality Care Products LLC', 'vufu', 'nkfp', 'Green Ridge', '04952 Weeping Birch Drive', 'yaqt', 52, 'Germany', '571-905-5866', '148-450-4611');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (26, 'Amerisource Bergen', 'noau', 'fqgw', 'Anthes', '84745 Fisk Point', 'yqms', 47, 'Germany', '624-585-8676', '728-279-8583');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (27, 'Nelco Laboratories, Inc.', 'xaom', 'uwng', 'Barnett', '47242 Monument Crossing', 'hcjf', 72, 'Germany', '360-451-8663', '588-131-0931');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (28, 'Greenstone LLC', 'qsrf', 'cjxn', 'Shopko', '63 Vahlen Drive', 'yoyc', 67, 'Germany', '558-524-9454', '221-347-6887');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (29, 'Hi-Tech Pharmacal Co., Inc.', 'kddg', 'xzhi', 'Hooker', '860 Del Mar Hill', 'jelh', 28, 'Germany', '332-676-0674', '523-970-5314');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (30, 'Contract Pharmacy Services-PA', 'fyzs', 'filq', 'Manufacturers', '149 Canary Terrace', 'dbtx', 22, 'Germany', '425-993-8667', '549-214-5683');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (31, 'Carilion Materials Management', 'emjr', 'mcoq', 'Fremont', '30889 Longview Circle', 'uoms', 25, 'Germany', '771-811-2169', '936-930-1056');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (32, 'Melaleuca Inc.', 'kfvw', 'iqxk', 'Armistice', '4 Stang Point', 'ciao', 65, 'Germany', '514-151-0088', '180-576-5232');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (33, 'Rebel Distributors Corp.', 'wktd', 'uvdw', 'Southridge', '70474 Lerdahl Park', 'nved', 88, 'Germany', '791-751-2486', '360-368-4246');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (34, 'Sage Products LLC', 'ecnu', 'mhhi', 'Erie', '0 Corben Point', 'phus', 64, 'Germany', '941-496-3081', '617-575-3757');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (35, 'REMEDYREPACK INC.', 'dbet', 'wxel', 'Summit', '872 Delaware Circle', 'zvsw', 73, 'Germany', '489-711-7306', '747-420-4272');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (36, 'Golden State Medical Supply Inc.', 'hvfa', 'gqwz', 'Sycamore', '7 Loeprich Road', 'kfte', 5, 'Germany', '280-847-8490', '450-674-3869');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (37, 'TARGET CORPORATION', 'ijao', 'idya', 'Linden', '23 Kingsford Trail', 'arsu', 85, 'Germany', '521-625-4938', '776-606-6915');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (38, 'Napoleon Perdis Cosmetics, Inc', 'qgpk', 'pyfm', 'Sullivan', '006 Prairieview Terrace', 'uloq', 96, 'Germany', '204-413-5066', '270-888-1958');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (39, 'Nelco Laboratories, Inc.', 'cgqm', 'vktl', 'Chive', '5 Melvin Avenue', 'dfpu', 54, 'Germany', '610-772-7456', '210-709-8909');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (40, 'White Manufacturing Incorporated DBA Micro-West', 'zrzx', 'veho', 'Shasta', '4720 Carey Circle', 'cteg', 20, 'Germany', '128-153-3503', '323-169-4785');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (41, 'Bryant Ranch Prepack', 'vywh', 'zake', 'Lukken', '1711 Corben Place', 'szqd', 23, 'Germany', '259-864-9028', '350-843-0095');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (42, 'Janssen Pharmaceuticals, Inc.', 'goho', 'oitq', 'Muir', '5623 American Ash Lane', 'pqrt', 3, 'Germany', '740-224-2226', '408-682-3748');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (43, 'NMC (Natural Magma Cosmetics)', 'dofd', 'srjg', 'Sauthoff', '1 Oneill Drive', 'tbll', 51, 'Germany', '678-332-3268', '759-457-6272');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (44, 'NeoPharm USA', 'jlro', 'tjcx', 'Truax', '844 Shoshone Plaza', 'ofkt', 4, 'Germany', '866-860-2945', '896-942-4725');
insert into oltp.Kunden (kundencode, firma, kontkpers, position, strasse, ort, region, plz, land, telefon, telefax) values (45, 'Aidance Skincare & Topical Solutions, LLC', 'yaxi', 'daau', 'Lerdahl', '5985 Fisk Drive', 'takk', 28, 'Germany', '313-899-2637', '767-733-1243');


insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (1, 'Veratrum Album Kit Refill', 'Östen', 'log', '03-07-1901', '27-10-1987', 'Pearson', 'afb', 'gvro', 'bgs', 'Portugal', '337-414-3845', '695-997-0051', 'tplk', 'rtjk');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (2, 'Rivastigmine Tartrate', 'Lorène', 'oow', '13-04-1907', '08-08-2004', 'Burning Wood', 'drk', 'llua', 'efn', 'Portugal', '129-466-0839', '458-690-0555', 'uvbc', 'aldx');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (3, 'Quinapril Hydrochloride', 'Aurélie', 'zfr', '20-10-1909', '06-07-2008', 'Sunfield', 'fiz', 'reaw', 'las', 'Portugal', '529-675-9272', '632-355-8455', 'vueb', 'nmfd');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (4, 'Galena Larix', 'Kuí', 'hbl', '28-01-1913', '17-03-1992', 'Little Fleur', 'wet', 'humt', 'eda', 'Portugal', '606-800-0493', '819-204-9600', 'bhwm', 'dazc');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (5, 'Readybath TPC', 'Lén', 'mim', '31-10-1906', '21-11-2015', 'Weeping Birch', 'cvg', 'vccz', 'vmk', 'Portugal', '932-708-5077', '203-840-4420', 'yagh', 'emwc');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (6, 'Petroleum', 'Lóng', 'ufs', '21-09-1910', '26-02-2016', 'Chinook', 'gow', 'kdkn', 'yco', 'Portugal', '262-215-3578', '700-658-7316', 'zdpw', 'jzvg');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (7, 'Hydroxyzine Hydrochloride', 'Loïs', 'jde', '30-01-1904', '28-11-2002', 'Lakeland', 'jaj', 'rxil', 'fkh', 'Portugal', '427-752-5870', '964-229-4123', 'uich', 'iofw');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (8, 'HYZAAR', 'Mylène', 'jen', '22-08-1912', '14-08-1984', 'Grim', 'zfn', 'ofmy', 'xae', 'France', '560-772-6894', '170-217-3053', 'lgok', 'nprp');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (9, 'ESIKA', 'Erwéi', 'jlw', '26-04-1912', '23-09-2013', 'Marquette', 'vgu', 'eeeq', 'yhj', 'Sweden', '920-149-8953', '133-244-1311', 'urxp', 'wrby');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (10, 'Pain Stoppers Regular', 'Lài', 'kqw', '03-06-1902', '24-01-1992', 'Graedel', 'miz', 'jgmb', 'tzh', 'Norway', '865-420-4570', '228-913-3708', 'unio', 'nwzo');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (11, 'Simply Sleep', 'Maëlla', 'etw', '07-12-1914', '27-07-2004', 'American Ash', 'nte', 'jrzt', 'ijn', 'Portugal', '548-892-2462', '377-891-7608', 'trod', 'sfjz');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (12, 'INSTANT Hand Sanitizer Extt', 'Yóu', 'diw', '19-06-1903', '23-09-2015', 'Charing Cross', 'zxb', 'mpjc', 'kyo', 'Ukraine', '495-883-2225', '995-145-1130', 'rnxv', 'nzoy');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (13, 'Ionite APF', 'Adélaïde', 'jsz', '13-03-1902', '07-03-2011', 'Spenser', 'joz', 'jotr', 'sgl', 'Sweden', '100-726-7530', '598-716-3578', 'qvxw', 'rlqw');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (14, 'Hydralazine Hydrochloride', 'Clémence', 'ara', '09-10-1915', '25-05-1994', 'Thierer', 'rhq', 'fcum', 'sns', 'Portugal', '150-172-8460', '530-268-5022', 'etcs', 'hgyj');
insert into oltp.Personal (personalnr, nachname, vorname, position, geburtsdat, einsdat, strasse, ort, region, plz, land, telprivat, telbuero, bemerkung, vorgesetzt) values (15, 'Chantix', 'Esbjörn', 'cmj', '09-10-1917', '25-06-1988', 'Crownhardt', 'fns', 'mipj', 'dly', 'Portugal', '984-163-7186', '759-629-1700', 'ocah', 'jqvy');

insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (1, '40', '8', 'ya', 'Lillian', '15 Memorial Way', 'Schmedeman', 'Portugal', 1, '24-06-2022', '11-03-2022', '12-03-2022', 46.75);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (2, '31', '7', 'cd', 'Fulton', '7 Waxwing Court', 'Dryden', 'Portugal', 2, '01-06-2022', '10-03-2022', '12-03-2022', 9.74);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (3, '7', '14', 'na', 'Morrow', '33 Golf Drive', '4th', 'Portugal', 3, '19-06-2022', '08-03-2022', '12-03-2022', 24.9);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (4, '35', '9', 'cm', 'Larry', '01004 Kenwood Road', 'Hoard', 'Portugal', 1, '10-09-2022', '09-03-2022', '12-03-2022', 52.84);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (5, '12', '12', 'dg', 'Coolidge', '65675 Thackeray Street', 'Dakota', 'Portugal', 1, '26-06-2022', '11-03-2022', '13-03-2022', 17.97);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (6, '6', '11', 'wm', '3rd', '33585 Dovetail Parkway', 'Jackson', 'Portugal', 2, '30-05-2022', '10-03-2022', '13-03-2022', 99.31);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (7, '13', '13', 'gn', 'Springview', '97 Corscot Court', 'Clyde Gallagher', 'Portugal', 3, '08-04-2022', '08-03-2022', '14-03-2022', 20.59);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (8, '4', '6', 'sx', 'East', '96526 Sunfield Place', 'Banding', 'Portugal', 1, '05-07-2022', '09-03-2022', '13-03-2022', 38.64);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (9, '39', '3', 'ko', 'Nelson', '8 Loeprich Court', 'American', 'Portugal', 2, '25-04-2022', '08-03-2022', '12-03-2022', 40.2);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (10, '41', '4', 'hx', 'Acker', '22543 7th Alley', 'Granby', 'Portugal', 3, '22-04-2022', '08-03-2022', '13-03-2022', 77.91);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (11, '14', '5', 'wn', 'Derek', '4747 Merchant Road', 'Green', 'Portugal', 1, '20-08-2022', '08-03-2022', '14-03-2022', 91.9);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (12, '22', '1', 'yw', 'Loomis', '47353 Vernon Court', 'Claremont', 'Portugal',2, '15-04-2022', '11-03-2022', '12-03-2022', 89.51);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (13, '37', '10', 'km', 'Columbus', '19 Rieder Pass', 'Nelson', 'Portugal', 3, '21-06-2022', '08-03-2022', '14-03-2022', 20.33);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (14, '18', '15', 'ms', 'Tony', '57 Vidon Street', 'Harper', 'Portugal', 1, '27-09-2022', '08-03-2022', '13-03-2022', 22.8);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (15, '25', '2', 'bz', 'Manley', '86 Di Loreto Hill', 'Kropf', 'Portugal', 2, '27-06-2022', '08-03-2022', '14-03-2022', 50.7);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (16, '23', '11', 'wp', 'Mallory', '6 Holy Cross Lane', 'Sunbrook', 'Portugal', 3, '22-10-2022', '09-03-2022', '14-03-2022', 63.57);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (17, '29', '4', 'ty', 'Menomonie', '1880 Kenwood Circle', 'Truax', 'Portugal', 1, '16-11-2022', '10-03-2022', '13-03-2022', 30.9);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (18, '24', '12', 'ro', '3rd', '2 Browning Circle', 'Judy', 'Portugal', 2, '08-10-2022', '11-03-2022', '14-03-2022', 2.43);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (19, '27', '8', 'ye', 'Valley Edge', '9 3rd Trail', 'Rockefeller', 'Portugal', 3, '02-08-2022', '09-03-2022', '12-03-2022', 79.97);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (20, '2', '2', 'xe', 'Loomis', '8 Fairfield Point', 'Ryan', 'Portugal', 1, '16-04-2022', '10-03-2022', '13-03-2022', 61.47);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (21, '8', '1', 'td', 'Mitchell', '596 Buell Park', 'Forest Dale', 'Portugal', 2, '30-10-2022', '11-03-2022', '13-03-2022', 59.18);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (22, '9', '5', 'gg', 'Buena Vista', '3 Merchant Way', 'Red Cloud', 'Portugal', 3, '29-07-2022', '08-03-2022', '13-03-2022', 24.19);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (23, '5', '15', 'yb', 'Summerview', '81146 Novick Avenue', 'Sutteridge', 'Portugal', 1, '15-06-2022', '09-03-2022', '14-03-2022', 41.23);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (24, '19', '7', 'fn', 'Hayes', '45 Del Sol Point', 'Warner', 'Portugal', 2, '24-10-2022', '09-03-2022', '12-03-2022', 15.08);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (25, '44', '14', 'ug', 'Straubel', '003 Mcbride Junction', 'Anzinger', 'Portugal', 3, '04-06-2022', '11-03-2022', '13-03-2022', 59.95);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (26, '34', '9', 'ei', 'Lawn', '3 Cody Center', 'Arkansas', 'Poland', 1, '09-10-2022', '11-03-2022', '14-03-2022', 20.35);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (27, '28', '13', 'yy', 'Northview', '897 Corry Lane', 'Clarendon', 'Portugal', 2, '22-05-2022', '08-03-2022', '14-03-2022', 53.2);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (28, '30', '6', 'jq', 'Johnson', '86067 Springview Hill', 'Village Green', 'Ireland', 3, '14-05-2022', '11-03-2022', '14-03-2022', 73.62);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (29, '32', '10', 'wc', 'Carberry', '24003 Heath Parkway', 'Schiller', 'Portugal', 1, '09-10-2022', '10-03-2022', '14-03-2022', 68.73);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (30, '43', '3', 'ip', 'Randy', '6321 Rowland Street', 'Bluestem', 'Portugal', 2, '08-10-2022', '09-03-2022', '12-03-2022', 54.72);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (31, '3', '3', 'tz', 'Walton', '476 Graceland Plaza', 'Prentice', 'Portugal', 3, '30-09-2022', '10-03-2022', '12-03-2022', 44.93);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (32, '45', '2', 'ht', 'Donald', '8725 Elgar Place', 'Sherman', 'Portugal', 1, '04-05-2022', '08-03-2022', '13-03-2022', 25.14);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (33, '11', '7', 'dx', 'Gerald', '56882 Spenser Place', 'Pond', 'France', 2, '02-07-2022', '11-03-2022', '14-03-2022', 1.5);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (34, '16', '8', 'fd', 'Kingsford', '69 Southridge Court', 'Charing Cross', 'Portugal',3, '11-04-2022', '11-03-2022', '12-03-2022', 40.06);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (35, '42', '4', 'tj', 'Oriole', '37822 Sage Alley', 'Pierstorff', 'Greece', 1, '18-08-2022', '10-03-2022', '13-03-2022', 70.76);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (36, '20', '12', 'hc', 'Golf', '077 Upham Center', 'Hayes', 'Portugal', 2, '21-05-2022', '11-03-2022', '12-03-2022', 96.33);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (37, '15', '11', 'zw', 'Monument', '8117 Sachtjen Parkway', 'Hanover', 'Portugal', 3, '24-10-2022', '09-03-2022', '12-03-2022', 56.78);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (38, '17', '5', 'wy', 'Bartelt', '93446 Gale Parkway', 'Packers', 'Portugal', 1, '21-07-2022', '10-03-2022', '12-03-2022', 11.3);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (39, '1', '10', 'hk', 'Sullivan', '40 Fordem Junction', 'Longview', 'Portugal', 2, '15-07-2022', '11-03-2022', '14-03-2022', 72.14);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (40, '33', '6', 'ae', 'Merry', '000 Alpine Avenue', 'Sauthoff', 'Portugal', 3, '10-03-2022', '10-03-2022', '14-03-2022', 92.13);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (41, '36', '1', 'iz', 'Manitowish', '09489 Orin Parkway', 'Pankratz', 'Sweden',1, '06-04-2022', '10-03-2022', '12-03-2022', 65.03);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (42, '38', '13', 'ot', 'Erie', '80 Oakridge Junction', 'Arapahoe', 'Portugal', 2, '13-04-2022', '11-03-2022', '13-03-2022', 19.48);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (43, '21', '15', 'er', 'Eastlawn', '6 Bunting Plaza', 'Dahle', 'Ireland', 3, '09-05-2022', '11-03-2022', '12-03-2022', 43.09);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (44, '10', '14', 'np', 'Troy', '3 Miller Terrace', 'Dovetail', 'Portugal', 1, '10-11-2022', '08-03-2022', '14-03-2022', 58.51);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (45, '26', '9', 'nv', 'Parkside', '6319 Carberry Way', 'Logan', 'Poland', 2, '22-05-2022', '09-03-2022', '13-03-2022', 41.78);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (46, '24', '14', 'fa', 'Division', '4 Truax Park', 'Delaware', 'Norway', 3, '06-07-2022', '09-03-2022', '12-03-2022', 62.26);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (47, '16', '4', 'av', 'Tennessee', '3190 Huxley Junction', 'Sunbrook', 'Portugal', 1, '05-10-2022', '11-03-2022', '12-03-2022', 37.66);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (48, '31', '6', 'su', 'Boyd', '52054 Alpine Park', 'Vermont', 'Portugal', 2, '11-10-2022', '10-03-2022', '14-03-2022', 75.18);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (49, '40', '5', 'qy', 'Menomonie', '50 Golf View Parkway', 'Cody', 'Portugal', 3, '15-06-2022', '09-03-2022', '13-03-2022', 22.45);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (50, '25', '11', 'zf', 'Corben', '71004 Briar Crest Court', 'Graceland', 'Portugal', 1, '05-09-2022', '08-03-2022', '13-03-2022', 43.86);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (51, '43', '2', 'mq', 'Lake View', '1812 Portage Plaza', 'Beilfuss', 'Portugal', 2, '09-11-2022', '10-03-2022', '14-03-2022', 9.27);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (52, '28', '15', 'ig', 'Grasskamp', '4 Kedzie Point', 'Roth', 'Portugal', 3, '12-05-2022', '10-03-2022', '13-03-2022', 70.08);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (53, '22', '7', 'zh', 'Hansons', '512 Esker Court', 'Homewood', 'Portugal', 1, '24-03-2022', '08-03-2022', '13-03-2022', 22.24);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (54, '32', '8', 'ev', 'Knutson', '54 Fuller Plaza', 'Haas', 'Portugal', 2, '07-10-2022', '09-03-2022', '12-03-2022', 12.67);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (55, '17', '3', 'di', 'Crest Line', '9 Lien Street', 'Stang', 'Albania', 3, '19-11-2022', '10-03-2022', '13-03-2022', 81.16);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (56, '42', '12', 'hh', 'Hagan', '25 Sachs Place', 'Graceland', 'Portugal', 1, '22-04-2022', '10-03-2022', '13-03-2022', 13.58);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (57, '38', '13', 'tc', 'Pierstorff', '0 Dawn Drive', 'Park Meadow', 'Portugal', 2, '13-08-2022', '11-03-2022', '12-03-2022', 72.01);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (58, '34', '1', 'em', 'Graceland', '40 Maple Drive', 'American Ash', 'Macedonia', 3, '13-09-2022', '11-03-2022', '14-03-2022', 20.67);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (59, '30', '10', 'ln', 'Toban', '46 Steensland Parkway', 'Green Ridge', 'Portugal', 1, '18-04-2022', '10-03-2022', '13-03-2022', 74.13);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (60, '45', '9', 'es', 'Hollow Ridge', '62 Waubesa Pass', 'Bowman', 'Portugal', 2, '18-11-2022', '09-03-2022', '13-03-2022', 77.6);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (61, '10', '6', 'db', 'Ridgeview', '92021 Luster Crossing', 'Becker', 'Portugal', 3, '18-05-2022', '09-03-2022', '13-03-2022', 70.72);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (62, '8', '5', 'ws', 'Larry', '60 Mitchell Place', 'Schurz', 'Portugal', 1, '08-05-2022', '11-03-2022', '14-03-2022', 91.34);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (63, '13', '9', 'kn', 'Moland', '529 Troy Junction', 'Stang', 'Portugal', 2, '20-10-2022', '08-03-2022', '12-03-2022', 24.65);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (64, '39', '11', 'yi', 'Golf', '8 Mendota Terrace', 'Manufacturers', 'Sweden', 3, '19-10-2022', '11-03-2022', '14-03-2022', 46.1);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (65, '20', '12', 'xp', 'Manitowish', '1 Shoshone Center', 'Clove', 'Portugal', 1, '02-06-2022', '09-03-2022', '12-03-2022', 75.4);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (66, '35', '3', 'gq', 'Morrow', '998 Meadow Ridge Parkway', 'Hudson', 'Portugal', 2, '19-03-2022', '08-03-2022', '12-03-2022', 45.01);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (67, '4', '8', 'tt', 'Rieder', '9259 Shelley Pass', 'Starling', 'Portugal', 3, '29-09-2022', '10-03-2022', '12-03-2022', 67.32);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (68, '26', '1', 'qq', 'Manufacturers', '560 Eagan Alley', 'Mitchell', 'Portugal', 1, '01-06-2022', '08-03-2022', '14-03-2022', 3.21);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (69, '23', '15', 'dm', 'Northfield', '22526 Bartelt Drive', 'Colorado', 'Portugal', 2, '09-03-2022', '08-03-2022', '14-03-2022', 55.62);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (70, '9', '7', 'zi', 'Dottie', '53 Judy Way', 'Marcy', 'Portugal', 3, '26-09-2022', '09-03-2022', '14-03-2022', 32.35);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (71, '19', '2', 'om', 'Ilene', '08 Carioca Court', 'Sutteridge', 'Portugal', 1, '22-07-2022', '08-03-2022', '12-03-2022', 92.12);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (72, '15', '10', 'pd', 'Homewood', '65 Elgar Way', 'Marcy', 'Portugal', 2, '11-09-2022', '08-03-2022', '12-03-2022', 79.96);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (73, '21', '13', 'xx', '3rd', '0 Utah Avenue', 'Sunbrook', 'Portugal', 3, '04-08-2022', '08-03-2022', '13-03-2022', 32.76);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (74, '1', '14', 'bz', 'Cherokee', '4 Mallory Hill', 'Utah', 'Portugal', 1, '03-04-2022', '08-03-2022', '13-03-2022', 22.44);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (75, '6', '4', 'ev', 'Caliangt', '33833 Fuller Pass', 'Bunker Hill', 'Macedonia', 2, '22-10-2022', '11-03-2022', '12-03-2022', 72.38);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (76, '7', '5', 'ao', 'Logan', '974 Fieldstone Road', 'Orin', 'Sweden', 3, '14-08-2022', '09-03-2022', '13-03-2022', 85.67);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (77, '12', '6', 'yp', 'Lillian', '7 Sullivan Alley', 'Esker', 'Portugal', 1, '18-10-2022', '08-03-2022', '14-03-2022', 49.69);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (78, '5', '11', 'yt', 'Birchwood', '34 Jackson Center', 'Sunnyside', 'Portugal', 2, '13-07-2022', '08-03-2022', '14-03-2022', 55.76);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (79, '2', '8', 'xj', 'Coleman', '905 Transport Alley', 'Debs', 'Portugal', 3, '05-08-2022', '11-03-2022', '13-03-2022', 94.32);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (80, '36', '7', 'ut', 'Monument', '57673 Dennis Point', 'Eastwood', 'Portugal', 1, '24-09-2022', '08-03-2022', '14-03-2022', 49.12);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (81, '18', '3', 'xe', 'Pennsylvania', '40562 Moulton Place', 'Killdeer', 'Portugal', 2, '14-05-2022', '08-03-2022', '14-03-2022', 88.88);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (82, '29', '15', 'gu', 'Jenifer', '95 Elmside Lane', 'Mariners Cove', 'Portugal', 3, '22-03-2022', '08-03-2022', '13-03-2022', 5.57);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (83, '41', '13', 'kf', 'Doe Crossing', '96 Mandrake Plaza', 'Linden', 'Portugal', 1, '31-08-2022', '11-03-2022', '13-03-2022', 77.98);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (84, '3', '14', 'ja', 'Westerfield', '48286 Towne Point', 'Center', 'Norway', 2, '30-10-2022', '09-03-2022', '12-03-2022', 42.24);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (85, '14', '10', 'sb', 'School', '17 Reindahl Alley', 'Michigan', 'Portugal', 3, '27-05-2022', '10-03-2022', '13-03-2022', 88.69);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (86, '37', '2', 'lp', 'Dapin', '7928 Buell Pass', 'Monument', 'Portugal', 1, '23-09-2022', '09-03-2022', '13-03-2022', 27.71);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (87, '27', '1', 'mc', 'Stoughton', '7 Green Hill', 'Drewry', 'Portugal', 2, '10-07-2022', '08-03-2022', '14-03-2022', 77.01);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (88, '11', '4', 'jg', 'Hudson', '0962 Stuart Court', 'Eliot', 'Portugal', 3, '03-05-2022', '08-03-2022', '12-03-2022', 12.28);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (89, '44', '9', 'tj', 'Miller', '9380 Green Court', 'Melody', 'Portugal', 1, '28-10-2022', '08-03-2022', '14-03-2022', 12.93);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (90, '33', '12', 'vm', 'Dunning', '97 Basil Place', 'Rusk', 'Portugal', 2, '29-10-2022', '09-03-2022', '14-03-2022', 40.06);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (91, '43', '3', 'hl', 'Vernon', '6 Redwing Alley', 'Moland', 'Portugal', 3, '22-04-2022', '10-03-2022', '14-03-2022', 53.39);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (92, '28', '11', 'ij', 'Corry', '5 Cascade Drive', 'Moulton', 'Portugal', 1, '18-06-2022', '08-03-2022', '13-03-2022', 81.98);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (93, '44', '5', 'iu', 'Mallory', '81670 Morningstar Alley', 'Portugal', 'Czech Republic', 2, '03-07-2022', '09-03-2022', '13-03-2022', 6.48);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (94, '17', '15', 'it', 'Prentice', '2 Maple Parkway', 'Towne', 'Poland', 3, '10-05-2022', '08-03-2022', '13-03-2022', 84.98);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (95, '40', '14', 'kk', 'Jana', '8 Texas Point', 'Pankratz', 'Portugal', 1, '20-10-2022', '10-03-2022', '12-03-2022', 97.01);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (96, '39', '1', 'es', 'John Wall', '15 Leroy Trail', 'Armistice', 'Portugal', 2, '14-05-2022', '08-03-2022', '14-03-2022', 53.39);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (97, '22', '9', 'rb', 'Montana', '17 Hanson Road', 'Service', 'Portugal', 3, '26-09-2022', '10-03-2022', '14-03-2022', 40.51);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (98, '3', '4', 'hl', 'Mayer', '1663 Sugar Center', 'Ridgeway', 'Armenia', 1, '31-10-2022', '10-03-2022', '13-03-2022', 74.16);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (99, '38', '12', 'vv', 'Ridge Oak', '73 Fordem Parkway', 'Porter', 'Portugal', 2, '09-08-2022', '09-03-2022', '12-03-2022', 50.72);
insert into oltp.Bestell (bestllNr, kundenCode, personalNr, empfaenger, strasse, ort, region, zielland, versndfirm, bestelldatum, lieferdatum, versanddatum, frachtKost) values (100, '41', '13', 'nk', 'Katie', '3 Meadow Vale Way', 'Texas', 'Portugal', 3, '26-09-2022', '08-03-2022', '12-03-2022', 19.17);

insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('28', '7', 33.84, 40, 55);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('77', '11', 18.53, 37, 73);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('72', '24', 75.19, 18, 95);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('38', '27', 62.59, 32, 80);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('76', '10', 89.8, 61, 23);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('14', '14', 88.61, 61, 65);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('89', '17', 65.37, 32, 50);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('19', '12', 31.74, 91, 89);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('3', '1', 64.84, 44, 72);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('48', '20', 41.75, 62, 33);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('90', '22', 22.26, 37, 61);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('69', '23', 88.84, 41, 38);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('1', '16', 32.39, 5, 3);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('10', '13', 66.75, 80, 49);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('97', '25', 92.56, 33, 28);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('42', '5', 55.05, 75, 81);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('15', '19', 1.14, 59, 98);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('63', '21', 28.24, 29, 52);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('29', '28', 12.92, 22, 80);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('40', '6', 79.5, 71, 91);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('27', '15', 21.77, 74, 49);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('9', '8', 12.44, 57, 91);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('82', '4', 63.6, 42, 12);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('47', '18', 14.98, 36, 94);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('21', '29', 5.71, 85, 13);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('86', '3', 80.9, 59, 84);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('54', '26', 80.5, 17, 3);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('99', '30', 53.42, 98, 78);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('64', '9', 42.19, 87, 4);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('53', '2', 22.29, 10, 25);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('78', '14', 95.29, 41, 2);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('24', '16', 38.91, 13, 6);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('49', '26', 32.91, 16, 16);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('44', '7', 78.16, 30, 13);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('36', '2', 6.94, 100, 98);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('74', '28', 6.18, 100, 68);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('70', '11', 19.19, 71, 64);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('62', '20', 28.99, 49, 68);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('55', '30', 4.86, 99, 31);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('18', '18', 89.9, 87, 88);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('85', '3', 68.9, 74, 82);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('91', '15', 8.24, 39, 29);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('98', '13', 6.74, 6, 96);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('34', '22', 67.47, 63, 69);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('80', '4', 71.68, 76, 36);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('20', '24', 7.62, 32, 13);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('81', '17', 18.61, 50, 47);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('71', '5', 56.39, 6, 19);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('5', '25', 71.1, 76, 23);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('59', '9', 16.6, 12, 3);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('87', '23', 85.08, 44, 10);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('66', '19', 37.33, 6, 71);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('39', '27', 49.62, 75, 18);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('11', '10', 75.28, 48, 17);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('23', '8', 44.18, 42, 11);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('93', '1', 55.85, 83, 9);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('26', '21', 94.93, 74, 49);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('83', '29', 16.14, 59, 27);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('43', '6', 63.36, 4, 66);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('56', '12', 7.69, 11, 84);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('50', '13', 55.23, 9, 4);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('31', '10', 28.71, 41, 22);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('65', '2', 75.61, 83, 68);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('25', '4', 88.73, 96, 75);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('4', '25', 52.78, 95, 9);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('100', '7', 65.16, 40, 58);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('6', '18', 52.95, 48, 8);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('57', '26', 17.33, 83, 52);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('35', '30', 57.18, 87, 49);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('92', '27', 64.4, 52, 84);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('2', '22', 63.48, 89, 43);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('13', '1', 18.9, 3, 98);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('75', '11', 74.46, 47, 77);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('51', '17', 81.95, 72, 20);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('73', '29', 35.15, 94, 45);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('88', '21', 43.4, 85, 5);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('94', '8', 8.45, 13, 52);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('46', '24', 64.13, 84, 91);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('58', '5', 40.69, 5, 1);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('12', '19', 2.2, 13, 73);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('22', '23', 8.68, 40, 63);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('68', '16', 77.8, 96, 86);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('41', '15', 74.32, 34, 35);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('95', '6', 70.26, 93, 49);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('67', '14', 58.25, 25, 66);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('96', '9', 90.86, 47, 57);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('30', '28', 62.03, 13, 97);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('45', '20', 53.85, 27, 27);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('33', '12', 37.91, 96, 22);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('79', '3', 55.79, 46, 73);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('8', '22', 86.02, 59, 34);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('61', '13', 71.57, 28, 13);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('52', '24', 98.68, 78, 85);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('60', '7', 73.81, 74, 73);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('37', '27', 76.64, 48, 32);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('7', '18', 74.95, 77, 86);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('16', '21', 33.67, 75, 99);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('17', '23', 35.27, 53, 77);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('84', '10', 50.24, 87, 34);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('32', '19', 29.66, 19, 28);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('13', '4', 46.28, 11, 81);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('37', '25', 43.12, 56, 8);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('85', '27', 50.54, 52, 34);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('6', '11', 23.49, 2, 53);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('21', '14', 95.82, 88, 70);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('16', '2', 57.02, 38, 63);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('30', '19', 56.19, 33, 1);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('9', '21', 80.45, 35, 39);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('58', '1', 23.0, 36, 24);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('66', '29', 12.87, 24, 88);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('31', '28', 16.24, 80, 5);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('75', '6', 36.33, 80, 28);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('39', '26', 24.16, 80, 98);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('61', '17', 51.51, 64, 14);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('41', '3', 31.22, 14, 69);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('49', '9', 95.54, 79, 43);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('76', '13', 49.8, 77, 39);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('4', '24', 17.02, 46, 89);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('33', '15', 8.34, 92, 38);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('79', '8', 8.52, 64, 70);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('100', '20', 9.85, 74, 94);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('10', '16', 28.6, 37, 46);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('70', '5', 5.77, 14, 53);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('46', '30', 99.49, 46, 58);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('34', '23', 65.93, 9, 61);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('87', '18', 32.27, 57, 87);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('54', '12', 87.94, 48, 6);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('74', '10', 56.44, 17, 22);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('53', '12', 51.2, 33, 20);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('97', '15', 86.21, 12, 65);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('95', '24', 25.2, 64, 32);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('22', '7', 33.26, 58, 15);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('67', '16', 90.01, 86, 72);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('12', '3', 78.67, 27, 65);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('93', '26', 87.26, 44, 41);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('2', '8', 54.48, 6, 44);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('52', '23', 80.0, 76, 38);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('25', '6', 29.4, 32, 87);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('38', '11', 22.25, 1, 88);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('73', '27', 64.61, 64, 48);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('55', '17', 3.78, 17, 93);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('77', '30', 11.44, 8, 89);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('63', '10', 13.93, 48, 73);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('40', '20', 27.63, 43, 46);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('5', '19', 54.09, 70, 96);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('14', '29', 28.47, 47, 27);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('29', '22', 8.9, 40, 47);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('92', '21', 64.65, 38, 78);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('98', '25', 47.52, 83, 7);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('84', '9', 59.7, 61, 37);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('78', '1', 89.5, 38, 12);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('18', '13', 13.73, 62, 48);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('3', '28', 94.05, 22, 98);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('8', '18', 42.31, 85, 16);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('62', '4', 56.8, 64, 99);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('64', '14', 70.21, 40, 27);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('26', '5', 64.02, 85, 69);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('86', '24', 7.1, 92, 35);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('91', '12', 9.29, 55, 68);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('48', '7', 8.43, 50, 23);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('72', '19', 68.96, 46, 88);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('20', '15', 74.53, 67, 36);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('68', '28', 51.12, 68, 44);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('71', '23', 10.08, 20, 24);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('94', '13', 8.51, 79, 12);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('88', '25', 26.35, 7, 54);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('11', '11', 17.56, 12, 61);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('59', '3', 57.82, 90, 77);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('24', '22', 84.71, 73, 3);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('83', '21', 76.06, 57, 38);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('23', '16', 75.38, 66, 64);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('42', '8', 80.75, 79, 43);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('35', '1', 85.17, 68, 20);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('50', '30', 21.22, 36, 14);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('15', '14', 87.81, 15, 85);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('96', '6', 64.76, 19, 51);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('19', '26', 81.71, 59, 90);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('27', '2', 44.98, 31, 90);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('57', '4', 96.22, 43, 3);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('44', '9', 68.7, 11, 32);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('47', '27', 83.1, 40, 10);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('32', '18', 46.42, 47, 52);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('43', '10', 26.67, 72, 8);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('7', '20', 29.58, 83, 29);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('81', '5', 41.02, 39, 21);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('69', '29', 21.94, 97, 18);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('45', '7', 58.85, 100, 89);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('82', '30', 27.06, 5, 18);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('1', '8', 24.08, 14, 43);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('65', '3', 8.95, 85, 84);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('56', '9', 87.14, 80, 95);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('80', '29', 98.74, 3, 48);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('99', '25', 34.26, 60, 83);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('60', '6', 71.01, 54, 18);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('17', '1', 77.77, 24, 91);
insert into oltp.bestDtl (bestllnr, artikelnr, einzpreis, anzahl, rabatt) values ('36', '11', 47.56, 15, 37);