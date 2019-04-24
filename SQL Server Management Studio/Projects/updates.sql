
select *
from Languages

--table creation
create table lang_temp (alpha2 varchar(2),
		English varchar(50));

select * from lang_temp
where alpha2 = 'zh'

--populating the table
bulk insert lang_temp
	from 'C:\Users\student-cpt-321\Downloads\iso_639_1.csv'
	with( firstrow = 2,
	fieldterminator = ',',
	rowterminator = '\n')

select *
from lang_temp;

--updating
update Languages
	set Languages.language_name = lang_temp.English
	from (Languages
			inner join lang_temp
			on Languages.iso_639_1 = lang_temp.alpha2)

