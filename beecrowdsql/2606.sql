SELECT 
    p.id,
    p.name
        
        
	FROM products as p
    
inner join categories as c on(p.id_categories = c.id)
where c.name like 'super%';