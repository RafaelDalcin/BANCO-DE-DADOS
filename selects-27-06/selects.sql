-- Operadores para usar com WHERE

-- Por padrão, o where sempre está no final do sql
-- isso não significa que é a ULTIMA COISA, mas é uma das últimas

-- Operador de Igualdade (=)
-- Ex: filtrar da tabela livros o registro com id 5
select * from livros 
where id = 5;

-- Operador de Diferença/Desigualdade (!=)
-- Ex: filtrar da tabela usuarios todos os registros
-- com exceção do registro com nome 'Gabriel';
select * from usuarios
where nome != 'Gabriel';

-- Operador de Comparação
-- Serve pra todos os tipos de dados
    -- inteiro, string, date, timestamp (data com horario)
-- Maior que (>), Maior ou Igual (>=) 
-- Menor que (<), Menor ou Igual (<=)
-- Between (between primeiro and segundo)
-- Ex: Consultar livros, listando titulo, editora e 
-- data de publicacao, filtrando apenas os com publicação 
-- posterior ao ano de 2000;
select 
    titulo, 
    editora, 
    to_char(publicacao, 'DD/MM/YYYY') as publicacao 
from livros
where publicacao > '1999-12-31';

-- Ex de Between
-- Filtrar se o valor esta ENTRE dois outros valores INCLUSIVE
-- os valores;
-- Filtrar os livros publicados entre os meses de fevereiro de 2020
-- e outubro de 2021 
select * from livros 
where publicacao between '2020-02-01' and '2021-10-31';

-- Listar o nome de todos os usuarios cujo código (id)
-- esteja entre 5 e 9;
select nome from usuarios
where id between 5 and 9;

-- Operador (in)
-- Verifica se o valor passado (coluna)
-- está presente em uma lista de possiveis valores aceitos
-- equivalente ao .includes() do JavaScript;
-- ex: Listar apenas usuarios com id (8 ou 9)
-- no SQL, é equivalente a fazer um encadeamento de ORs
select * from usuarios
where id in (8, 9)

-- Operador LIKE
-- Like: CONTEM
-- Mais utilizado pra filtrar colunas STRING
-- where coluna like '';
---- '%texto': termina com texto;
---- 'texto%': inicia com texto;
---- '%texto%: se tem o texto;
-- % representa qualquer valor;
-- Saber se o telefone começa com DDD (49);
select * from usuarios
where telefone like '(49)%';

-- AND e OR
-- Quero listar o titulo de todos os livros com data de
-- publicacao anteriores ao ano de 2000 e que id da sessao
-- seja igual a 6
select titulo from livros 
where publicacao < '2000-01-01' and id_sessao = 6