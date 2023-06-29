-- slicing 
select a.Artikel, sum(u.Umsatz)
from dwh.UmsatzFakt u
inner join dwh.Artikel a
on a.Artikel_ID = u.Artikel_ID
where a.KategName = 'Handy'
group by a.Artikel

-- dicing
select a.Artikel
from  dwh.UmsatzFakt u
inner join dwh.Artikel a
on a.Artikel_ID = u.Artikel_ID
where a.KategName = 'PKW'  and a.Firma = 'VIATREXX BIO INCORPORATED'
group by a.Artikel


--Rollup
SELECT z.Quartal, a.Firma, sum(u.Umsatz) 
FROM dwh.UmsatzFakt u
inner join dwh.Zeit z
on z.Zeit_ID = u.Zeit_ID
inner join dwh.Artikel a
on a.Artikel_ID = u.Artikel_ID
GROUP BY ROLLUP(z.Quartal, a.Firma);

--Cube
select a.Artikel, a.Land, sum(u.Umsatz)
from dwh.UmsatzFakt u
left join dwh.Kunden k
on k.Kunden_ID = u.Kunden_ID
left join dwh.Artikel a
on a.Artikel_ID = u.Artikel_ID
GROUP BY CUBE(a.Artikel, a.Land)



-- Slicing
select v.Firma, avg(f.Frachtkosten)
from dwh.FrachtFakt f
left join dwh.VersandFirmen v
on v.Versandfirm_ID = f.Versandfim_ID
where v.Firma = 'Kartal Cooperation'
group by v.Firma


-- dicing
select v.Firma,sum(f.Frachtkosten)
from dwh.FrachtFakt f
inner join dwh.Zeit z
on z.Zeit_ID = f.Zeit_ID
inner join dwh.VersandFirmen v
on v.Versandfirm_ID = f.Versandfim_ID
where z.Quartal= 1 and z.Jahr  = 2022
group by v.Firma


