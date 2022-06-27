-- 1. consulta que lista o nome, 
-- email e telefone de todos os usuarios
select nome, email, telefone from usuarios 

-- 2. consulta que liste o nome de todas as 
-- sessões cadastradas
select nome from sessoes

-- 3. consulta que liste o titulo, autor e
-- data de publicacao de todos os livros
    -- DESAFIO: exibir a data no formato DD/MM/YYYY
    -- Pesquisar sobre o uso da funcao to_char()
select 
    titulo, 
    nome_autor, 
    to_char(publicacao, 'DD/MM/YYYY') as data_publicacao
from livros

-- 4. consulta que lista todos os emprestimos
-- filtrando por apenas um usuario
-- utilizar WHERE
select * from emprestimos
where id_usuario = 3


-- 5. consulta que liste todos os emprestimo_livros
-- filtrando por apenas um emprestimo
-- utilizar WHERE
select * from emprestimo_livros
where id_emprestimo = 2