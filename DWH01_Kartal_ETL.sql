
INSERT INTO dwh.Artikel (artikelNr, artikel, lieferNr, firma, ort, land, kategNr, kategName)
SELECT a.artikelNr, a.artikel, a.lieferNr, l.firma, l.ort, l.land, a.kategNr, k.kategName
FROM oltp.Artikel a
INNER JOIN oltp.Liefernt l ON a.lieferNr = l.lieferNr
INNER JOIN oltp.Kategor k ON a.kategNr = k.kategNr;

INSERT INTO dwh.Kunden (KundenCode, Firma, Ort, Land)
SELECT kundenCode, firma, ort, land
FROM oltp.Kunden

Insert into dwh.Personal(PersonalNr,Nachname,Vorname,Position)
select personalNr, nachName, vorName, position
from oltp.Personal

insert into dwh.VersandFirmen(FirmenNr, Firma)
select  firmenNr,firma
from oltp.Firmen

insert into dwh.Zeit(Monat, Quartal, Jahr)
select distinct MONTH(b.bestelldatum), DATEPART(QUARTER, b.bestelldatum), YEAR(b.bestelldatum)
from oltp.Bestell b


insert into dwh.UmsatzFakt(Artikel_ID, Kunden_ID, Zeit_ID, umsatz)
select dwh.Artikel.Artikel_ID, dwh.Kunden.Kunden_ID, z.Zeit_ID, sum([EinzPreis]*[Anzahl]-([EinzPreis]*[Anzahl]*([Rabatt]*0.01))) AS Umsatz 
from dwh.Zeit z, oltp.BestDtl bd
left join dwh.Artikel 
on dwh.Artikel.ArtikelNr = bd.ArtikelNr
left join dwh.Kunden
on dwh.Kunden.Kunden_ID = (select kundencode from oltp.Bestell where bestllNr = bd.bestllNr)
where z.Monat = MONTH((select bestelldatum from oltp.Bestell where bestllNr = bd.bestllNr)) and 
z.Jahr = YEAR((select bestelldatum from oltp.Bestell where bestllNr = bd.bestllNr))
group by dwh.Artikel.Artikel_ID, dwh.Kunden.Kunden_ID, z.Zeit_ID



insert into dwh.FrachtFakt(Personal_ID, Versandfim_ID, Zeit_ID, Frachtkosten)
select dwh.Personal.Personal_ID, dwh.VersandFirmen.Versandfirm_ID, z.Zeit_ID, sum(FrachtKost) 
from dwh.Zeit z, oltp.Bestell b
left join dwh.Personal 
on dwh.Personal.Personal_ID = b.PersonalNr
left join dwh.VersandFirmen
on dwh.VersandFirmen.Versandfirm_ID = b.VersndFirm
where z.Monat = MONTH(b.bestelldatum) and 
z.Jahr = YEAR(b.bestelldatum)
group by dwh.Personal.Personal_ID, dwh.VersandFirmen.Versandfirm_ID, z.Zeit_ID

