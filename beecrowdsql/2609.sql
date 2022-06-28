SELECT 
    c.name, 
    sum(p.amount)
    
	FROM products as p
inner join categories as c on (p.id_categories = c.id)
group by c.name, id_categories
order by c.name asc;