

/*
Exercício 01

O departamento de recursos humanos precisa de um relatório para exibir o número do funcionário, o sobrenome, 
o salário e o salário com 15,5% de aumento (especificado como um número inteiro) de cada funcionário. 
Atribua o nome Novo Salário à coluna.
*/

select employee_id, last_name, round(salary * 1.15) as "Novo Salário"
from employees;

/*
Exercício 02
Crie uma consulta que exiba o sobrenome (com a primeira letra maiúscula e todas as outras minúsculas)
e o tamanho do sobrenome de todos os funcionários cujos nomes comecem com a letra J, A ou M. Atribua 
um nome apropriado a cada coluna. Ordene os resultados pelos sobrenomes dos funcionários.
*/

select initcap(last_name) "Sobrenome", length(last_name) "Tamanho"
from employees
where first_name like 'J%'
or first_name like 'A%'
or first_name like 'M%'
order by 1;


/*
Exercício 03
Crie um relatório com o tempo de emprego de cada funcionário. Para cada funcionário, exiba o sobrenome 
e calcule o número de meses entre hoje e a data de admissão do funcionário. 
Atribua o nome MESES_TRABALHADOS à coluna. Ordene os resultados pelo número de meses 
em que o funcionário está empregado. Arredonde o número de meses para o número inteiro mais próximo.*/
select last_name, round(months_between(sysdate, hire_date)) MESES_TRABALHADOS
from employees
order by 2;

/*
Exercício 04
Crie um relatório que produza estas informações para cada funcionário:
recebe <salário>mensalmente, mas deseja receber <3 vezes o salário>. Atribua o nome Salários dos Sonhos à coluna.
*/

select 'Recebe '||salary||' mensalmente, mas deseja receber '||salary * 3||'.' "salários dos Sonhos"
from employees;

/*
Exercício 05
Crie uma consulta que exiba o sobrenome e o salário de todos os funcionários. 
Formate o salário para defini-lo com um tamanho de 15 caracteres e preenchê-lo 
à esquerda com o símbolo $. Atribua o nome SALARIO à coluna.
*/

select last_name, lpad(salary, 15, '$') SALARIO
from employees;

/*
***Exercício 06
Exiba o sobrenome, a data de admissão e a data de revisão de salário de cada funcionário, 
que é a primeira segunda-feira após seis meses de serviço. Atribua o nome REVISÃO à coluna. 
Formate as datas para que sejam exibidas no formato semelhante a "Monday, the Thirty-First of July, 2000".
*/

select last_name, hire_date, to_char(next_day(add_months(hire_date, 6), 2), 'fmDay, "the" Ddspth "of" Month, YYYY') REVISÃO
from employees;

/*
***Exercício 07 
Crie uma consulta que exiba os sobrenomes e as comissões dos funcionários. 
Se um funcionário não ganhar comissão, a informação "Sem Comissão" deverá ser exibida. 
Atribua o nome Comissão à coluna.
*/

select last_name, nvl(to_char(commission_pct), 'Sem Comissão') Comissão
from employees;

/*
***Exercício 08
Crie uma consulta que exiba os oito primeiros caracteres dos sobrenomes dos funcionários 
e indique os valores dos salários com asteriscos. Cada asterisco representa mil dólares. 
Classifique os dados em ordem decrescente de salário. Atribua o nome SALARIOS_EMPREGADOS à coluna.
*/

select rpad(substr(last_name, 1, 8), (salary/1000)+1, '*') SALARIOS_EMPREGADOS
from employees
order by salary desc;
/*
Exercício 09
Com a function DECODE, crie uma consulta que exiba o nível de todos os funcionários com base no valor da coluna JOB_ID. Use estes dados:
Cargo Nível
AD_PRES A
ST_MAN B
IT_PROG C
SA_REP D
ST_CLERK E
Nenhuma das opções anteriores 0.
*/

select last_name,
    decode(
        JOB_ID, 'AD_PRES', 'A',
                'ST_MAN', 'B',
                'IT_PROG', 'C',
                'SA_REP', 'D',
                'ST_CLERK', 'E',
        '0'    
        ) NIVEL
FROM EMPLOYEES;

/*
Exercício 10
Recriar o relatório acima com a função CASE.
*/

select last_name,
    case job_id when 'AD_PRES' then 'A'
                when 'ST_MAN' then 'B'
                when 'IT_PROG' then 'C'
                when 'SA_REP' then 'D'
                when 'ST_CLERK' then 'E'
            ELSE '0'
    end NIVEL
FROM EMPLOYEES;

---------------------------------M4
/*
Exercício 01 4
Faça uma query que retorne salário máximo, o salário mínimo, a soma dos salários e o salário médio de todos os funcionários. 
Atribua os nomes às colunas Máximo, Mínimo, Soma e Média, respectivamente, às colunas. 
Arredonde os resultados para o número inteiro mais próximo.
*/

select round(max(salary)) Máximo, round(min(salary)) Mínimo, round(sum(salary)) Soma, round(avg(salary)) Média
from employees;

/*
Exercício 02
Agora faça a mesma query, porém ela deve ser agrupado pelo job_id dos funcionários.
*/

select job_id, round(max(salary)) Máximo, round(min(salary)) Mínimo, round(sum(salary)) Soma, round(avg(salary)) Média
from employees
group by job_id;

/*
Exercício 03
Crie uma query para retornar o número de funcionários, agrupados pelo job_id. 
Onde quem for executar a consulta poderá escolher o cargo que será utilizado nela.
*/

select job_id, count(*)
from employees
where job_id = :cargo
group by job_id;


/*
Exercício 04
Determine o número de gerentes que atuam nesta empresa, para fazer isso use a coluna MANAGER_ID da tabela employees.
*/

SELECT COUNT(DISTINCT(MANAGER_ID))
FROM EMPLOYEES;

/*
Exercício 05
Faça uma query que retorne a diferença entre o salário mais alto e o mais baixo dos empregados desta empresa.
*/

select max(salary) - min(salary)
from employees;

/*
Exercício 06
Crie uma consulta que exiba o número total de funcionários e, desse total, mostre o número de funcionários
admitidos em 2005, 2006, 2007 e 2008. para cada coluna você deve usar como alias 
o ano em que esses funcionários foram admitidos.
*/

select count(1) "Total de Funcionarios", 
    sum(DECODE(
        to_char(hire_date, 'RRRR'), '2005', 1, 0
    )) "2005",
    sum(DECODE(
        to_char(hire_date, 'RRRR'), '2006', 1, 0
    )) "2006",
    sum(DECODE(
        to_char(hire_date, 'RRRR'), '2007', 1, 0
    )) "2007",
    sum(DECODE(
        TO_CHAR(HIRE_DATE, 'RRRR'), '2008', 1, 0
    )) "2008"
from employees;

------------------------------------M5

/*
Exercício 01
Crie uma consulta para o departamento de recursos humanos a fim de gerar os endereços de todos os departamentos. 
Use as tabelas LOCATIONS e COUNTRIES. Mostre o ID do local, o endereço, a cidade, 
o estado e o país na saída. Use NATURAL JOIN para gerar os resultados.
*/

select l.location_id, l.street_address, l.city, l.state_province, c.country_name
from locations l
natural join countries c

/*
Exercício 02
O departamento de recursos humanos precisa de um relatório de todos os funcionários. 
Crie uma consulta para exibir o sobrenome, o número do departamento e o 
nome do departamento de todos os funcionários.
*/

select e.last_name, e.department_id, d.department_name
from employees e
join departments d
on (e.department_id = d.department_id);

select last_name, department_id, department_name
from employees
join departments
using (department_id);

/*
Exercício 03
O departamento de recursos humanos precisa de um relatório dos funcionários em Toronto. 
Exiba o sobrenome, o cargo, o número do departamento e o nome do 
departamento de todos os funcionários que trabalham em Toronto.
*/

select e.last_name, e.job_id, e.department_id, d.department_name
from employees e
join departments d
on (e.department_id = d.department_id)
join locations l
on (d.location_id = l.location_id)
where upper(l.city) = 'TORONTO';



/*
Exercício 04
Crie um relatório para exibir o sobrenome e o número dos funcionários, 
bem como o sobrenome e o número dos respectivos gerentes. Atribua às colunas os
labels Employee, Emp#, Manager e Mgr#, respectivamente.
*/

select e.last_name Employee, e.employee_id Emp#, m.last_name "Manager", m.employee_id Mgr#
from employees e
join employees m
on (e.manager_id = m.employee_id);

/*
Exercício 05
Crie um relatório para o departamento de recursos humanos que exiba os sobrenomes e os
números de departamento dos funcionários, bem como todos os funcionários que trabalham no 
mesmo departamento como um funcionário específico.
*/

select e.last_name DEPARTAMENTO, e.department_id EMPREGADO, c.last_name COLEGA
from employees e
join employees c
on (e.department_id =c.department_id)
where e.employee_id <> c.employee_id
order by e.department_id, e.last_name, c.last_name;


/*
Exercício 06
O departamento de recursos humanos precisa de um relatório sobre níveis de cargos e salários. 
Para se familiarizar com a tabela JOBS, primeiro mostre a estrutura dessa tabela. 
Em seguida, crie uma consulta que exiba o nome, o cargo, o nome do departamento,
o salário e o nível de todos os funcionários.
*/

select e.last_name, j.job_title, d.department_name, e.salary, j.min_salary, j.max_salary
from employees e
join departments d
on (e.department_id = d.department_id)
join jobs j
on (e.job_id = j.job_id);

/*
Exercício 07 - Desafio
Crie uma query para obter os nomes e as datas de admissão de todos os funcionários 
admitidos antes dos respectivos gerentes, além dos nomes e das datas de admissão desses gerentes.
*/
select e.last_name, e.hire_date, m.last_name, m.hire_date
from employees e
join employees m
on (e.manager_id = m.employee_id)
where e.hire_date < m.hire_date;


-----------------------------------------M6

/*
Crie um relatório que exiba o número e o sobrenome de todos os
funcionários cujo salário é maior que o salário médio. Classifique
os resultados em ordem crescente de salário.
*/

select employee_id, last_name
from employees
where salary > (select avg(salary)
                from employees)
order by salary;

/*
Crie uma consulta que exiba o número e o sobrenome de todos os
funcionários que trabalham em um departamento com funcionários
cujos sobrenomes contêm a letra z.
*/

select employee_id, last_name
from employees
where department_id in (select department_id 
                        from employees
                        where last_name like '%z%');

/*
Cire uma query que exiba o sobrenome, o número do
departamento e o ID do cargo de todos os funcionários cujo ID de
local do departamento é 1700.
*/

select last_name, department_id, job_id
from employees
where department_id in(select department_id 
                        from departments
                        where location_id = 1700);


/*
Crie um relatório que exiba o número do departamento, o
sobrenome e o ID do cargo de todos os funcionários no
departamento executivo.
*/

select department_id, last_name, job_id
from employees
where department_id = (select department_id
                        from departments
                        where upper(department_name) = 'EXECUTIVE');


---------------------------------M7

/*
Exercício 01
Crie um relatório com uma lista de países nos quais não há departamentos. 
Exiba o ID e o nome dos países. Use os operadores de conjunto para criar esse relatório.
*/

select country_id, country_name from countries
minus
select l.country_id, c.country_name from locations l, countries c
where l.country_id = c.country_id;

/*
Exercício 02
Produza uma lista de cargos dos departamentos 10, 50 e 20, nessa ordem. 
Exiba o ID de cargo e o ID de departamento usando operadores de conjunto.
*/

select job_id, department_id, 1
from employees
where department_id = 10
union
select job_id, department_id, 2
from employees
where department_id = 50
union
select job_id, department_id, 3
from employees
where department_id = 20
order by 3;


/*
Exercício 03
Crie uma query com as seguintes especificações:
Sobrenome e ID do departamento de todos os funcionários da tabela EMPLOYEES, mesmo que não pertençam a um departamento
ID e nome de todos os departamentos da tabela DEPARTMENTS, mesmo que não tenham funcionários
*/

select last_name, employee_id, null
from employees
union
select null, department_id, department_name
from departments;


------------------------------------M8

/*
Exercício 01
Crie um novo departamento com o próximo department_id da tabela departments, este departamento deve ter o nome de Exercicio, 
não deve conter um gerente e deve estar situado na cidade 1700. Para este exercício você deve declarar todas as colunas da tabela
*/


insert into departments (department_id, department_name, manager_id, location_id)
values (271, 'Exercicio', NULL, 1700);

/*
Exercício 02
A Informação inserida no exercício 01 deve ser atualizada e agora ela o novo departamento inserido deve-se chamar "Exercícios 08"
*/

update departments
set department_name = 'Exercícios 08'
where department_name = 'Exercicio';

/*
Exercício 03
Insira um registro novo na tabela employees com o id de 1234 e com o primeiro nome que deve ser composto 
com a primeira letra do primeiro nome e as 3 últimas letras do sobrenome do funcionário 100, 
o seu sobrenome deve ser o mesmo do funcionário 100, seu e-mail deve ser "EMAIL123", seu telefone deve ser 1,
sua data de admissão deve ser a data atual, o JOB ID, deve ser o mesmo do funcionário 100, 
seu salário deve ser 10000, ele não deve possuir comissão e o seu gerente deve ser o employee_id do funcionário 100,
e o seu departamento deve ser o código do novo departamento. As colunas não devem ser declaradas nessa instrução.
*/

insert into employees
select 1234, substr(first_name, 1, 1)||substr(last_name, -3, 3), last_name, 'EMAIL123', 1, sysdate, job_id, 10000, null, employee_id, 271
from employees 
where employee_id = 100


/*
Exercício 04
Deletar todos os funcionários do novo departamento criado no Exercício 01, Obs: Deve-se usar subquery para fazer este exercício
*/

delete from employees
where employee_id in (select employee_id
                        from employees
                        where department_id = 271);

/*
Exercício 05
Todas as informações feitas até aqui não devem ser confirmadas, escreva o comando que faz isso.
*/

commit;

----------------------------------M9

/*
Exercício 01

Crie a tabela EMPLOYEES2 com base na estrutura da tabela EMPLOYEES. Inclua somente as colunas EMPLOYEE_ID, 
FIRST_NAME, LAST_NAME, SALARY e DEPARTMENT_ID. Nomeie as colunas da nova tabela como ID, 
FIRST_NAME, LAST_NAME, SALARY e DEPT_ID, respectivamente.
*/

CREATE TABLE EMPLOYEES2 AS
    SELECT EMPLOYEE_ID as ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID AS DEPT_ID
    FROM EMPLOYEES

SELECT * FROM EMPLOYEES2


/*
Exercício 02
Crie a tabela teste_dept com duas colunas com os nomes ID e NOME, 
a coluna ID vai ser a chave primária da tabela, ela também deve ser do tipo NUMBER 
com o tamanho de 10, já a coluna NOME vai ser um VARCHAR2 com um valor 
default usando a função USER e o seu tamanho vai ser de 50.
*/

create table teste_dept 
(
    id number(10), 
    nome varchar2(50) default user,
    constraint pk_id_teste_dept primary key (id)
);


/*
Exercício 03
Altere a coluna NOME para NOT NULL
*/

alter table teste_dept
modify nome varchar2(50) NOT NULL;

/*
Exercício 04
Renomei a coluna NOME para NOME_USUARIO
*/

alter table teste_dept
rename column nome to nome_usuario;

/*
Exercício 05
Cria a coluna DATA_USUARIO como do tipo TIMESTAMP, esta coluna não pode ser nula.
*/

alter table teste_dept
add data_usuario timestamp not null;

/*
Exercício 06
Elimine a coluna DATA_USUARIO
*/

alter table teste_dept
drop column data_usuario;

/*
Exercício 07
Altere o nome da tabela teste_dept para dep
*/


alter table teste_dept
rename to dep;

/*
Exercício 08
Elimine a tabela dep.
*/

drop table dep;

---------------------------------------------------------M10


/*
Exercício 01
Faça uma VIEW que retorne o nome do funcionário, o id, data de entrada na empresa e salário, 
de todos os funcionários com o cargo de TI, com o nome vw_programadores. 
As colunas dessa view devem ter o mesmo nome dos representados nessa questão.
*/

CREATE OR REPLACE VIEW vw_programadores ("nome do funcionario", "id", "data de entrada", salario) as
    select first_name, employee_id, hire_date, salary
    from employees
    where job_id = 'IT_PROG';
    
select * from vw_programadores;

/*
Exercício 02
Utilize a view vw_programadores para retornar todos os programadores que recebem mais de 2500 dólares.
*/

select * from vw_programadores
where SALARIO > 2500;

/*
Exercício 03
Crie uma view que retorne o nome do cargo, o salário máximo, salário mínimo, 
a soma dos salários e a média de salário dos funcionário. 
Sendo que o nome do cargo deve ser retornado da tabela JOBs.
*/

create or replace view vw_nome_cargo (nome_cargo, max_salario, min_salario, sum_salario, media_salario) as
    select j.job_title, max(e.salary), min(e.salary), sum(e.salary), avg(e.salary)
    from employees e, jobs j
    where e.job_id = j.job_id
    group by j.job_title;
    
select * from vw_nome_cargo;
 
 
/*
Exercício 04
Cria uma SEQUENCE que comece em 500, seja incrementada de 1 em 1, tenha o valor máximo de 9999 o nome dessa SEQUENCE deve ser sq_teste_employes
*/
 
 
create sequence sq_teste_employees
    increment by    1
    start with      500
    maxvalue        9999;
    

/*
Exercício 05
Insira um registro na tabela employees utilizando a sequence sq_teste_employes, após isso selecione o valor atual dessa sequence.
*/

insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (sq_teste_employees.nextval, 'Fernando', 'Lima', 'EMALGMAIL', 47999054093, '01/01/2018', 'IT_PROG', 6000, NULL, 103, 60);

select SQ_TESTE_EMPLOYEES.currval from dual;


/*
Exercício 06
Crie um índice na coluna hire_date da tabela employees
*/

CREATE INDEX i_data
    on employees(hire_date);

/*
Exercício 07
Crie um sinônimo tabela jobs com o nome JB
*/

create synonym jb
    for jobs;
    
select * from jb;

----------------------------------------------------M11

/*
Exercício 01
Crie uma consulta que exiba o nome das colunas, os tipos de dados, o tamanho dos dados e se eles podem ser nulos da tabela JOBS
*/

select column_name, data_type, data_length, nullable
from user_tab_columns
where table_name = 'JOBS';

/*
Exercício 02
Agora faça uma consulta que exiba o nome da coluna, nome da constraint, o tipo 
da constraint(nome descritivo, use o DECODE com o descritivo passado na aula para exibir essa informação) 
a condição de pesquisa e o seu STATUS. Para fazer esse exercício 
faça um JOIN das tabelas USER_CONSTRAINTS e USER_CONS_COLUMNS
*/


select l.column_name, l.constraint_name, 
    decode 
        (c.constraint_type,  'P', 'CHAVE PRIMARIA',
                            'C', 'CONSTRAINT DE VERIFICAÇÃO',
                            'U', 'CHAVE EXCLUSIVA',
                            'R', 'INTEGRIDADE RELACIONA (FORENG KEY)',
                            'V', 'OPÇÃO DE VERIFICAÇÃO',
                            'O', 'SOMENTE PARA LEITURA') "TIPO", 
c.search_condition, c.status
from user_cons_columns l
join user_constraints c
on (l.constraint_name = c.constraint_name);


/*
Exercício 03
Crie uma consulta para exibir as informações sobre suas seqüências: nome, valor máximo, tamanho do incremento e último número.
*/


SELECT sequence_name, max_value, increment_by, last_number
from user_sequences;

select * from user_sequences

/*
Exercício 04

Adicione um comentário a coluna department_id da tabela departments, este comentário deve ser a tradução do comentário atual. Após fazer isso exiba este comentário.
*/


comment on column departments.department_id
    is 'Chave primária da tabela de departamentos';


select * from user_tab_comments
select * from user_COL_comments
where COLUMN_name = 'DEPARTMENT_ID'

select * from USER_TAB_COLUMNS
select * from user_constraints
select * from user_cons_columns

SELECT * FROM DEPARTMENTS

select * from employees

select * from jobs
-----------------------------







