

--Listar o nome, email e telefone do usuarios que pegaram emprestado algum livro do setor id 2 
--(caso não tenha setor id 2 no banco de dados de vocês, substituir por um id existente);

SELECT
    u.nome,
    u.email,
    u.telefone
	FROM emprestimos as e
inner join usuarios as u on (e.id_usuario = u.id)
inner join emprestimos_livros as el on (e.id = el.id_emprestimo)
inner join livros as l on (el.id_livro = l.id)
where l.id_sessao = 5;


--Listar título, nome da sessão e nome do autor dos livros que o usuário id 5 pegou emprestado 
--(mesma lógica da anterior, caso não tenha usuario com id 5, substituir por um id de usuario existente)
SELECT 
    l.titulo,
    s.nome,
    l.nome_autor
    
    FROM emprestimos as e
inner join emprestimos_livros as el on (e.id = el.id_emprestimo)
inner join livros as l on (el.id_livro = l.id)
inner join sessoes as s on (l.id_sessao = s.id)
where e.id_usuario = 3

-- Listar o título e data de publicação dos livros emprestados para usuarios com DDD (55)

SELECT 
    l.titulo,
    to_char(l.publicacao, 'DD/MM/YYYY')
	FROM emprestimos as e
inner join usuarios as u on (e.id_usuario = u.id)
inner join emprestimos_livros as el on (e.id = el.id_emprestimo)
inner join livros as l on (el.id_livro = l.id)
where  u.telefone like '(55)%'
