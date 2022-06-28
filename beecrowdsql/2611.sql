SELECT 
    m.id, 
    m.name
	FROM movies as m
    
inner join genres as g on(m.id_genres = g.id)
where g.description = 'Action';