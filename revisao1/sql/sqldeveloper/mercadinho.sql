
CREATE TABLE CLIENTE
(
CODIGO INTEGER,
NOME VARCHAR(30),
CIDADE VARCHAR(20)
);

insert into cliente (codigo, nome, cidade) values (1, 'Fernando', 'Blumenau');

insert into 
CREATE TABLE CLIENTE
(
CODIGO INTEGER,
NOME VARCHAR(30),
CIDADE VARCHAR(20)
);

insert into cliente (codigo, nome, cidade) values (1, 'Fernando', 'Blumenau');

insert into cliente values (2, 'Carla', 'Blumenau');
insert into cliente values (3, 'Cassio', 'Blumenau');
insert into cliente values (4, 'Pamela', 'Joinville');
insert into cliente values (5, 'Valtair', 'Curitiba');
insert into cliente values (6, 'Cassandra de Paula', 'Joinville');
insert into cliente values (7, 'Sabrina de Paula', 'Joinville');
insert into cliente values (8, 'Ariane Souza', 'Curitiba');
insert into cliente values (9, 'Maria Eduarda', 'Curitiba');
insert into cliente values (10, 'Andreia Weitzel', 'Rio das Ostras');
insert into cliente values (11, 'Luana Capzta', 'Balneário Camboriú');
insert into cliente values (12, 'André Weitzel', 'Penha');

update cliente set codigo = 2 where nome = 'Carla'

select * from cliente order by codigo, nome

--like %a% = ...a...
select * from cliente where nome like '%er%';

--between campo BETWEEN 1 AND 5
select * from cliente where codigo between 2 and 4 order by 1 desc

--in campo in(x, 1)
select * from cliente where codigo in(2,3,5)
select * from cliente where nome in('Fernando','Carla')

--seleciona registro não duplicados do campo
select distinct(cidade) from cliente



cliente values (2, 'Carla', 'Blumenau');
insert into cliente values (3, 'Cassio', 'Blumenau');
insert into cliente values (4, 'Pamela', 'Joinville');
insert into cliente values (5, 'Valtair', 'Curitiba');
insert into cliente values (6, 'Cassandra de Paula', 'Joinville');
insert into cliente values (7, 'Sabrina de Paula', 'Joinville');
insert into cliente values (8, 'Ariane Souza', 'Curitiba');
insert into cliente values (9, 'Maria Eduarda', 'Curitiba');
insert into cliente values (10, 'Andreia Weitzel', 'Rio das Ostras');
insert into cliente values (11, 'Luana Capzta', 'Balneário Camboriú');
insert into cliente values (12, 'André Weitzel', 'Penha');

update cliente set codigo = 2 where nome = 'Carla'

select * from cliente order by codigo, nome

--like %a% = ...a...
select * from cliente where nome like '%er%';

--between campo BETWEEN 1 AND 5
select * from cliente where codigo between 2 and 4 order by 1 desc

--in campo in(x, 1)
select * from cliente where codigo in(2,3,5)
select * from cliente where nome in('Fernando','Carla')

--seleciona registro não duplicados do campo
select distinct(cidade) from cliente

create table produto
(
pro_codigo integer not null,
pro_nome varchar2(30) not null,
pro_preco numeric(8,2) not null,
constraint pk_pro_codigo primary key (pro_codigo)
);

select * from produto

drop table cliente

create table cliente
(
cli_codigo integer not null,
cli_nome varchar2(30) not null,
cli_cidade varchar2(30),
cli_uf char(2),
cli_sexo char(2) not null,
constraint pk_cli_codigo primary key (cli_codigo)
);

insert into cliente values (1, 'Fernando de Paula de Lima', 'Blumenau', 'SC', 'M');
insert into cliente values (2, 'Carla Weitzel', 'Blumenau', 'SC', 'F');
insert into cliente values (3, 'Cassio Sperry', 'Blumenau','SC', 'M');
insert into cliente values (4, 'Pamela Aparecida de Paula', 'Joinville', 'SC', 'F');
insert into cliente values (5, 'Valtair de Paula', 'Curitiba', 'PR', 'M');
insert into cliente values (6, 'Cassandra de Paula', 'Joinville', 'SC', 'F');
insert into cliente values (7, 'Sabrina de Paula', 'Joinville', 'SC', 'F');
insert into cliente values (8, 'Ariane Souza', 'Curitiba', 'PR', 'F');
insert into cliente values (9, 'Maria Eduarda', 'Curitiba', 'PR', 'F');
insert into cliente values (10, 'Andreia Weitzel', 'Rio das Ostras', 'RJ', 'F');
insert into cliente values (11, 'Luana Capzta', 'Balneário Camboriú', 'SC', 'F');
insert into cliente values (12, 'André Weitzel', 'Penha', 'SC', 'M');
insert into cliente (cli_codigo, cli_nome, cli_sexo) values (13, 'Carmen Lúcia', 'F');

SELECT * FROM CLIENTE

--descrição da tabela
describ cliente
desc cliente

--alterando tabelas
alter table cliente add cli_data_nasc date;
alter table cliente modify cli_nome varchar2(50);
alter table cliente drop (cli_data_nasc);

update cliente set cli_uf = 'BR' WHERE cli_uf in('PR');
delete from cliente where cli_codigo between 5 and 10 and cli_uf='PR';

--elemina os dados da tabela sem commit
truncate table cliente;

desc produto

insert into produto values (1, 'TOMATE', '2,50');
insert into produto values (2, 'LARANJA', '1,50');
insert into produto values (3, 'ARROZ', '3,0');
insert into produto values (4, 'PERA', '6,50');
insert into produto values (5, 'UVA', '5,0');
insert into produto values (6, 'MACARRÃO', '2,0');
insert into produto values (7, 'CERVEJA', '3,50');
insert into produto values (8, 'CARNE', '22,0');
insert into produto values (9, 'CARVÃO', '9,0');
insert into produto values (10, 'GELO', '4,50');
insert into produto values (11, 'QUEIJO', '12,50');

select * from produto

--media
select avg(pro_preco) from produto

--soma
select sum(pro_preco) as "PRECO TOTAL", sum(pro_codigo) as CODIGO from produto

select count(*) from produto
--so conta campos não nulos
select count(cli_cidade) from cliente

--busca o maior valor do campo
select max(pro_preco) from produto
--busca o menor valor do campo
select min(pro_preco) from produto


--transforma em maiusculas
select upper(cli_nome) from cliente
select * from cliente where upper(cli_nome) LIKE 'FERNANDO%'

--transforma em minusculas
select lower(cli_nome) from cliente

--concatenando tabelas em uma so
select pro_codigo || ' - ' || pro_nome || ' - R$  ' || pro_preco as "PRODUTO COMPLETO" FROM produto

--criando indices
create unique index idx_produto on produto (pro_nome, pro_preco);
drop index idx_produto;

select * from cliente where cli_cidade is not null

--group by - agrupando tabelas
select count(*), cli_cidade from cliente  where cli_cidade is not null group by cli_cidade

select count(*) as total, cli_cidade from cliente  where cli_cidade is not null group by cli_cidade

create table funcionario
(
fun_codigo integer not null,
fun_nome varchar2(50) not null,
fun_cidade varchar2(30),
fun_sexo char(2) not null,
fun_salario numeric(8,2),
constraint pk_fun_codigo primary key (fun_codigo)
);


insert into funcionario values (1, 'Fernando de Paula de Lima', 'Blumenau', 'M', '7500');
insert into funcionario values (2, 'João da Silva', 'Joinville', 'M', '7500');
insert into funcionario values (3, 'Roberta Marinha', 'Joinville', 'M', '3500');
insert into funcionario values (4, 'Bruna Cida', 'Penha', 'M', '3500');
insert into funcionario values (5, 'Bela Adormecida', 'Blumenau', 'M', '9500');
insert into funcionario values (6, 'Mucilon Prado', 'Rio de Janeiro', 'M', '1500');
insert into funcionario values (7, 'Marilha Mara Meira', 'São Paulo', 'M', '2500');
insert into funcionario values (8, 'Carla Weitzel', 'Blumenau', 'M', '17500');

update funcionario set fun_sexo = 'F' where fun_codigo in(3, 4, 5, 7, 8);

select * from funcionario

select fun_cidade, fun_salario from funcionario
--somando os salarios por cidade e agrupando por cidade
select fun_cidade, sum(fun_salario) from funcionario group by fun_cidade
--media dos salarios por cidade e agrupando por cidade
select fun_cidade, avg(fun_salario) from funcionario group by fun_cidade

select count(*), fun_sexo from funcionario group by fun_sexo

select fun_sexo, avg(fun_salario) from funcionario group by fun_sexo

create table cidade
(
    ci_codigo integer not null,
    ci_nome varchar(30) not null,
    constraint pk_ci_codigo primary key (ci_codigo)
);

insert into cidade values (1, 'Blumenau');
insert into cidade values (2, 'Penha');
insert into cidade values (3, 'Rio de Janeiro');
insert into cidade values (4, 'São Paulo');
insert into cidade values (5, 'Balneário Camboriú');
insert into cidade values (6, 'Rio das Ostras');
insert into cidade values (7, 'Curitiba');

select * from cidade

select * from cliente

Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('1','Fernando de Paula de Lima','Blumenau','SC','M ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('2','Carla Weitzel','Blumenau','SC','F ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('3','Cassio Sperry','Blumenau','SC','M ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('4','Pamela Aparecida de Paula','Joinville','SC','F ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('5','Valtair de Paula','Curitiba','PR','M ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('6','Cassandra de Paula','Joinville','SC','F ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('7','Sabrina de Paula','Joinville','SC','F ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('8','Ariane Souza','Curitiba','PR','F ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('9','Maria Eduarda','Curitiba','PR','F ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('10','Andreia Weitzel','Rio das Ostras','RJ','F ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('11','Luana Capzta','Balneário Camboriú','SC','F ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('12','André Weitzel','Penha','SC','M ');
Insert into cliente (CLI_CODIGO,CLI_NOME,CLI_CIDADE,CLI_UF,CLI_SEXO) values ('13','Carmen Lúcia',null,null,'F ');

delete from cliente;

--alterando tabela, adicionando campo novo na tabela
alter table cliente add cli_cod_cidade integer not null;

--incluindo uma chave extrangeira na tabela de cliente que terá a ligação para o campo 
--código da tabela de cidades
alter table cliente
add constraint fr_cli_cod_cidade
foreign key (cli_cod_cidade)
references cidade (ci_codigo);

--deletando a chave estrangeira (foreign key)
alter table cliente
drop constraint fr_cli_cod_cidade;

--union - une 2 ou mais selects, não duplicando registros, porém a quantidade de tabelas selecionadas tem q ser a mesma
select ci_nome from cidade
union
select fun_cidade from funcionario
-- traz todos os registros da união dos resultados
select ci_nome from cidade
union all
select fun_cidade from funcionario

create table venda
(
    ve_doc integer,
    ve_produto integer,
    ve_quandtidade integer,
    ve_preco numeric(8,2)
);

