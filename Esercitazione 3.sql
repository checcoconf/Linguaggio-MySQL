/* Query 1 */
select l.codice as codice_libro, l.titolo as titolo_libro,
       e.codice as codice_editore, e.nome as nome_editore
       from libri l, editori e
where l.codice_editore = e.codice;

/* Query 2 */
select l.titolo as titolo_libro, l.prezzo
from  libri l, editori e
where  l.codice_editore = e.codice and e.nome = 'Signet';

/* Query 3 */
select l.titolo as titolo_libro, l.codice
from  libri l, editori e
where  l.codice_editore = e.codice and e.nome = 'Bantam Books' and l.prezzo > 10;

/* Query 4 */
select l.codice, l.titolo as titolo_libro, s.num_copie_disponibili
from libri l, scorte s, filiali f
where s.codicelibro = l.codice and s.numero_filiale = f.numero_filiale
  and f.numero_filiale = 3;

/* Query 5 */
select l.titolo as titolo_libro
from  libri l, editori e
where  l.codice_editore = e.codice
  and e.nome = 'Best and Furrow' and l.tipo = 'COM';


/* Query 6 */
select l.titolo as titolo_libro
from libri l , autori a, hascritto h
where l.codice = h.codice_libro and h.numero_autore = a.numero_autore
and a.numero_autore IN (01);

/* Query 7 */
select titolo as titolo_libro
from  libri
where tipo = 'COM'
and exists(
    select *
    from editori
    where nome = 'Best and Furrow'
);

/* Query 8 */
select l.titolo as titolo_libro, l.codice
from libri l, scorte s, filiali f
where s.codicelibro = l.codice and s.numero_filiale = f.numero_filiale
  and f.numero_filiale = 2;

/* Query 9 */
select s.codicelibro, s1.codicelibro
from scorte s, scorte s1
where s.numero_filiale = s1.numero_filiale and s.codicelibro < s1.codicelibro;

/* Query 10 */
select s.num_copie_disponibili, l.titolo as titolo_libro, a.cognome as cognome_autore
from libri l, autori a, hascritto h, scorte s
where s.codicelibro = l.codice
and l.codice = h.codice_libro
and h.numero_autore = a.numero_autore
and s.numero_filiale = 4;

/* Query 11 */
select l.titolo as titolo_libro
from  libri l, editori e
where  l.codice_editore = e.codice
and e.nome = 'Best and Furrow' and l.tipo = 'COM' and l.paperback = 'Y';

/* Query 12 */
select distinct l.codice, l.titolo
from libri l, editori e
where l.codice_editore = e.codice
  and l.prezzo > 5.00 or e.citta = 'New York';

/* Query 13 */
select distinct l.codice, l.titolo
from libri l, editori e
where l.codice_editore = e.codice
  and l.prezzo > 5.00 and e.citta != 'New York';

/* Query 14 */
select l.titolo as titolo_libro, l.codice_editore as codice_editore
from libri l
where prezzo >  all (select prezzo
              from libri
              where libri.tipo = 'HOR');

/* Query 15 */
select l.titolo as titolo_libro, l.codice_editore as codice_editore
from libri l
where prezzo >  any (select prezzo
              from libri
              where libri.tipo = 'HOR');