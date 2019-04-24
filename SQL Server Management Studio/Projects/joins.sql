-----------------------Joins in sql
--What is the primary key for the table “movies”?

select m.title,g.genre_name
from Movies m
inner join GenreMap gm
on m.movie_id = gm.movie_id
inner join Genres g
on g.genre_id = gm.genre_id
where g.genre_name = 'romance'

--In how many movies did Tom Cruise portray the character Ethan Hunt? (Hint: Characters are listed in the Casts table.)

select m.title, c.characters, a.actor_name
from Movies m
inner join Casts c
on m.movie_id = c.movie_id
inner join Actors a
on c.actor_id = a.actor_id
where a.actor_name = 'Tom cruise'
and c.characters = 'ethan hunt'

select m.title, m.budget
from Movies m
inner join Oscars o
on o.film= m.title
where winner is not null

--How many movies have managed to win Best Picture at the Oscars even though they had a budget of less than $10 000 000? (Hint: The winner is given by a 1 in the “winner” field.)

select year,award, winner,name ,film
from Oscars os
inner join Movies m
on m.title = os.film
where os.award = ' best picture'
and os.winner is not null
and m.budget < 10000000

--How many movies contain at least one of the languages, Afrikaans or Zulu?

select *
from LanguageMap
where iso_639_1 = 'af' or iso_639_1= 'zu'

select PCp.iso_3166_1
from ProductionCountryMap PCp
inner join Movies m
On m.movie_id=PCp.movie_id
where m.movie_id = 8681

select M.title, A.actor_name, C.characters
from Movies M
right join Casts C
on M.movie_id = M.movie_id
right join Actors A
on C.actor_id  = A.actor_id
where C.characters = 'Ethan Hunt'

--In which countries was the movie “Taken” produced?

select M.title, PCON.production_country_name
from Movies M
inner join ProductionCountryMap PC
on M.movie_id = PC.movie_id
inner join ProductionCountries PCON
on PC.iso_3166_1 = PCON.iso_3166_1
where title = 'Taken'

--
Select G.genre_name,M.title,  M.movie_id
from Movies M
inner join GenreMap GM
on GM.movie_id = M.movie_id
inner join Genres G
on GM.genre_id = G.genre_id
where genre_name = 'Comedy'
order by movie_id


--10.How many movies are in the database that are both a Romance and a Comedy?

select M.title, count(genre_name)
from Movies M
inner join GenreMap GM
on GM.movie_id = M.movie_id
inner join Genres G
on GM.genre_id = G.genre_id
where genre_name = 'Romance' or genre_name = 'comedy'
group by title
having count(genre_name) >1