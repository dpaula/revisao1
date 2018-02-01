
-----------------------VIEW

create or replace view vw_programadores (id, nome, sal�rio_anual) as --cabe�alho da view com nome e suas informa��es que ser�o espelhadas pelo select. as para definir o select
    select employee_id, first_name, salary * 12 -- as colunas selecionadas, tem q ter a mesma qtd da defini��o acima da view
    from employees 
    where job_id = 'IT_PROG';
    
desc vw_programadores;

--chamando a view.. igual select, mas ao inv�z do nome da tabela, vem o nome da view
select * from vw_programadores;
    
    
    -----------------VIEWS COMPLEXAS

--criando view com inner join e group by
CREATE VIEW SAL_CARGOS (NOME, SAL_MENOR, SAL_MAIOR, SAL_MEDIA) AS
    SELECT j.job_title, min(e.salary), max(e.salary), avg(e.salary)
    from employees e
    inner join jobs j
    on (e.job_id = j.job_id)
    group by j.job_title;
    
desc sal_cargos;

select * from sal_cargos;

--WITH CHECK OPTION CONSTRAINT 
--cria uma view 
create or replace view vw_dp50 as
    select * from employees
    where department_id = 50
    with check option constraint ck_dp50;
    
    
update vw_dp50
set salary = salary+10
where department_id = 50;

--n�o deixa alterar departamento <> 50
update vw_dp50
set department_id = 20
where employee_id = 120;

---WITH READ ONLY
--view de somente leitura.. se for tentar deletar n�o deixa
create or replace view vw_dep20 (id, nome, cargo) as
    select employee_id, first_name, job_id
    from employees
    where department_id = 20
    WITH READ ONLY;

DELETE FROM vw_dep20
where id = 202;

----------INDICES

--criando um indice
CREATE INDEX nome_empregado
    on employees(first_name);
    
--deletando..
drop index nome_empregado;

---------------SEQUENCE

create table teste_01
(
    teste_numero number,
    teste_char varchar2(30)
);

alter table teste_01
modify teste_numero number not null;

desc teste_01

--criando uma sequence
create sequence sq_teste_01 --declara��o do nome da sequence
    INCREMENT BY 15 --definindo quantidade de incremento a cada cria��o
    START WITH   34 --numero de inicio da sequence
    MAXVALUE     999999999 --valor m�ximo
    NOCACHE --definindo n�o vai guardar valores no cache
    NOCYCLE; --definido para n�o recome�ar caso chegar no valor maximo definido

--inserindo registro e usando a sequence para incluir o registro teste_numero    
INSERT INTO TESTE_01 (TESTE_NUMERO, TESTE_CHAR)
VALUES (SQ_TESTE_01.NEXTVAL, 'FERNANDO'); --chamando a sequence e sua fun��o de nextval

SELECT * FROM TESTE_01

--verificando o valor atual da sequence com a fun��o currval
select sq_teste_01.currval from dual;

--para excluir uma sequence
drop sequence sq_teste_01;

------------------------SINONIMOS
--apenas um nome para a tabela

--criando sinonimo
create synonym teste_table --defini��o da cria��o
for teste_01; --para a tabela

--usando o sinonimo
select * from teste_table;

--excluindo..
drop synonym teste_table;

--------------------------------VIEWS DOS USER OBJECTS

select * from dictionary;
select * from user_objects
where object_type = 'TABLE';

describe user_tables
select * from user_tables

select * from user_views
select * from user_sequences


----------------CRIANDO COMENTARIOS NAS TABELAS

--INCLUINDO COMENT�RIO NA TABELA
comment on table employees
    is 'Informa��es dos Empregados';

--incluindo coment�rio na coluna
comment on column employees.employee_id
    is 'Identificador dos funcion�rios..';
    
--pesquisando a descri��o e coment�rios da tabela
select * from all_tab_comments
where table_name = 'EMPLOYEES'

select * from USER_tab_comments
where table_name = 'EMPLOYEES'

--pesquisando a descri��o e coment�rios da coluna
SELECT * FROM ALL_COL_COMMENTS
WHERE TABLE_NAME = 'EMPLOYEES'
AND COLUMN_NAME = 'EMPLOYEE_ID';