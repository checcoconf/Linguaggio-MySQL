
select codice, titolo
from libri;

select *
from editori;

select nome
from editori
where stato = 'NY';

select nome
from editori
where stato != 'NY';

select nome
from filiali
where numero_dipendenti >= 10;

select codice,titolo
from libri
where tipo = 'HOR';

select codice,titolo
from libri
where tipo = 'HOR' and paperback = 'Y';

select codice,titolo
from libri
where tipo = 'HOR' or codice_editore = 'PB';

select codice,titolo, prezzo
from libri
where prezzo >= 10 and prezzo <= 20;

select codice,titolo, prezzo
from libri
where prezzo between 10 and 20;

 select codice,titolo
from libri
where tipo = 'MYS' and prezzo < 20;

 select codice,titolo, prezzo, round((prezzo * 0.85),2) as prezzo_scontato
from libri;


 select nome
from editori
where nome like '%and%';


 select codice_editore, titolo
from libri
where tipo in ('FIC','MYS','ART');

 select codice_editore, titolo
from libri
where tipo in ('FIC','MYS','ART')
ORDER BY titolo ASC;

 select codice_editore, titolo
from libri
where tipo in ('FIC','MYS','ART')
ORDER BY titolo DESC;

 select nome,cognome
from autori
ORDER BY cognome;

 select count(distinct (tipo)) as Numero_Tipi_di_Libri
from libri;

 select count(tipo) as Numero_Libri_Tipo_MYS
from libri
where tipo = 'MYS';

 select tipo, concat(round(avg(prezzo),2),'€') as "Prezzo Medio per tipo"
from libri
group by tipo;

 select tipo, concat(round(avg(prezzo),2),'€') as "Prezzo Medio per MYS"
from libri
where tipo = 'MYS'
group by tipo;

 select titolo, prezzo as 'Libro più costoso'
from libri
where  prezzo = (select MAX(prezzo)
from libri);

 select SUM(numero_dipendenti) as 'Numero di tutti i dipendenti'
from filiali;

 select nome, sede, numero_dipendenti as 'Filiale col minor numero di dipendenti'
from Filiali
where numero_dipendenti = (select min(numero_dipendenti) from Filiali);

 select titolo,prezzo
from libri join editori on libri.codice_editore = editori.codice
where prezzo =
      		(select max(prezzo)
                from libri, editori
                where libri.codice_editore = editori.codice
                and editori.nome = 'Pocket Books')
        and editori.nome = 'Pocket Books';
