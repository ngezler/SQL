 --USE tmdb
--GO



BULK INSERT lang_temp
		FROM 'C:\Users\student-cpt-321\Downloads\iso_639_1-a-76.csv'
		WITH ( FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n')

/*UPDATE Languages
	SET Language.language_name = lang_temp.English
	FROM (
		INNER JOIN lang_temp
		ON languages.iso_369_1 = lang.temp.alpha2
	)

--DROP TABLE lang_temp*/
