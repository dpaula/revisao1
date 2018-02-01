

/*
Exerc�cio 01

O departamento de recursos humanos precisa de um relat�rio para exibir o n�mero do funcion�rio, o sobrenome, 
o sal�rio e o sal�rio com 15,5% de aumento (especificado como um n�mero inteiro) de cada funcion�rio. 
Atribua o nome Novo Sal�rio � coluna.
*/

select employee_id, last_name, round(salary * 1.15) as "Novo Sal�rio"
from employees;

/*
Exerc�cio 02
Crie uma consulta que exiba o sobrenome (com a primeira letra mai�scula e todas as outras min�sculas)
e o tamanho do sobrenome de todos os funcion�rios cujos nomes comecem com a letra J, A ou M. Atribua 
um nome apropriado a cada coluna. Ordene os resultados pelos sobrenomes dos funcion�rios.
*/

select initcap(last_name) "Sobrenome", length(last_name) "Tamanho"
from employees
where first_name like 'J%'
or first_name like 'A%'
or first_name like 'M%'
order by 1;


/*
Exerc�cio 03
Crie um relat�rio com o tempo de emprego de cada funcion�rio. Para cada funcion�rio, exiba o sobrenome 
e calcule o n�mero de meses entre hoje e a data de admiss�o do funcion�rio. 
Atribua o nome MESES_TRABALHADOS � coluna. Ordene os resultados pelo n�mero de meses 
em que o funcion�rio est� empregado. Arredonde o n�mero de meses para o n�mero inteiro mais pr�ximo.*/
select last_name, round(months_between(sysdate, hire_date)) MESES_TRABALHADOS
from employees
order by 2;

/*
Exerc�cio 04
Crie um relat�rio que produza estas informa��es para cada funcion�rio:
recebe <sal�rio>mensalmente, mas deseja receber <3 vezes o sal�rio>. Atribua o nome Sal�rios dos Sonhos � coluna.
*/

select 'Recebe '||salary||' mensalmente, mas deseja receber '||salary * 3||'.' "sal�rios dos Sonhos"
from employees;

/*
Exerc�cio 05
Crie uma consulta que exiba o sobrenome e o sal�rio de todos os funcion�rios. 
Formate o sal�rio para defini-lo com um tamanho de 15 caracteres e preench�-lo 
� esquerda com o s�mbolo $. Atribua o nome SALARIO � coluna.
*/

select last_name, lpad(salary, 15, '$') SALARIO
from employees;

/*
***Exerc�cio 06
Exiba o sobrenome, a data de admiss�o e a data de revis�o de sal�rio de cada funcion�rio, 
que � a primeira segunda-feira ap�s seis meses de servi�o. Atribua o nome REVIS�O � coluna. 
Formate as datas para que sejam exibidas no formato semelhante a "Monday, the Thirty-First of July, 2000".
*/

select last_name, hire_date, to_char(next_day(add_months(hire_date, 6), 2), 'fmDay, "the" Ddspth "of" Month, YYYY') REVIS�O
from employees;

/*
***Exerc�cio 07 
Crie uma consulta que exiba os sobrenomes e as comiss�es dos funcion�rios. 
Se um funcion�rio n�o ganhar comiss�o, a informa��o "Sem Comiss�o" dever� ser exibida. 
Atribua o nome Comiss�o � coluna.
*/

select last_name, nvl(to_char(commission_pct), 'Sem Comiss�o') Comiss�o
from employees;

/*
***Exerc�cio 08
Crie uma consulta que exiba os oito primeiros caracteres dos sobrenomes dos funcion�rios 
e indique os valores dos sal�rios com asteriscos. Cada asterisco representa mil d�lares. 
Classifique os dados em ordem decrescente de sal�rio. Atribua o nome SALARIOS_EMPREGADOS � coluna.
*/

select rpad(substr(last_name, 1, 8), (salary/1000)+1, '*') SALARIOS_EMPREGADOS
from employees
order by salary desc;
/*
Exerc�cio 09
Com a function DECODE, crie uma consulta que exiba o n�vel de todos os funcion�rios com base no valor da coluna JOB_ID. Use estes dados:
Cargo N�vel
AD_PRES A
ST_MAN B
IT_PROG C
SA_REP D
ST_CLERK E
Nenhuma das op��es anteriores 0.
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
Exerc�cio 10
Recriar o relat�rio acima com a fun��o CASE.
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
Exerc�cio 01 4
Fa�a uma query que retorne sal�rio m�ximo, o sal�rio m�nimo, a soma dos sal�rios e o sal�rio m�dio de todos os funcion�rios. 
Atribua os nomes �s colunas M�ximo, M�nimo, Soma e M�dia, respectivamente, �s colunas. 
Arredonde os resultados para o n�mero inteiro mais pr�ximo.
*/

select round(max(salary)) M�ximo, round(min(salary)) M�nimo, round(sum(salary)) Soma, round(avg(salary)) M�dia
from employees;

/*
Exerc�cio 02
Agora fa�a a mesma query, por�m ela deve ser agrupado pelo job_id dos funcion�rios.
*/

select job_id, round(max(salary)) M�ximo, round(min(salary)) M�nimo, round(sum(salary)) Soma, round(avg(salary)) M�dia
from employees
group by job_id;

/*
Exerc�cio 03
Crie uma query para retornar o n�mero de funcion�rios, agrupados pelo job_id. 
Onde quem for executar a consulta poder� escolher o cargo que ser� utilizado nela.
*/

select job_id, count(*)
from employees
where job_id = :cargo
group by job_id;


/*
Exerc�cio 04
Determine o n�mero de gerentes que atuam nesta empresa, para fazer isso use a coluna MANAGER_ID da tabela employees.
*/

SELECT COUNT(DISTINCT(MANAGER_ID))
FROM EMPLOYEES;

/*
Exerc�cio 05
Fa�a uma query que retorne a diferen�a entre o sal�rio mais alto e o mais baixo dos empregados desta empresa.
*/

select max(salary) - min(salary)
from employees;

/*
Exerc�cio 06
Crie uma consulta que exiba o n�mero total de funcion�rios e, desse total, mostre o n�mero de funcion�rios
admitidos em 2005, 2006, 2007 e 2008. para cada coluna voc� deve usar como alias 
o ano em que esses funcion�rios foram admitidos.
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
Exerc�cio 01
Crie uma consulta para o departamento de recursos humanos a fim de gerar os endere�os de todos os departamentos. 
Use as tabelas LOCATIONS e COUNTRIES. Mostre o ID do local, o endere�o, a cidade, 
o estado e o pa�s na sa�da. Use NATURAL JOIN para gerar os resultados.
*/

select l.location_id, l.street_address, l.city, l.state_province, c.country_name
from locations l
natural join countries c

/*
Exerc�cio 02
O departamento de recursos humanos precisa de um relat�rio de todos os funcion�rios. 
Crie uma consulta para exibir o sobrenome, o n�mero do departamento e o 
nome do departamento de todos os funcion�rios.
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
Exerc�cio 03
O departamento de recursos humanos precisa de um relat�rio dos funcion�rios em Toronto. 
Exiba o sobrenome, o cargo, o n�mero do departamento e o nome do 
departamento de todos os funcion�rios que trabalham em Toronto.
*/

select e.last_name, e.job_id, e.department_id, d.department_name
from employees e
join departments d
on (e.department_id = d.department_id)
join locations l
on (d.location_id = l.location_id)
where upper(l.city) = 'TORONTO';



/*
Exerc�cio 04
Crie um relat�rio para exibir o sobrenome e o n�mero dos funcion�rios, 
bem como o sobrenome e o n�mero dos respectivos gerentes. Atribua �s colunas os
labels Employee, Emp#, Manager e Mgr#, respectivamente.
*/

select e.last_name Employee, e.employee_id Emp#, m.last_name "Manager", m.employee_id Mgr#
from employees e
join employees m
on (e.manager_id = m.employee_id);

/*
Exerc�cio 05
Crie um relat�rio para o departamento de recursos humanos que exiba os sobrenomes e os
n�meros de departamento dos funcion�rios, bem como todos os funcion�rios que trabalham no 
mesmo departamento como um funcion�rio espec�fico.
*/

select e.last_name DEPARTAMENTO, e.department_id EMPREGADO, c.last_name COLEGA
from employees e
join employees c
on (e.department_id =c.department_id)
where e.employee_id <> c.employee_id
order by e.department_id, e.last_name, c.last_name;


/*
Exerc�cio 06
O departamento de recursos humanos precisa de um relat�rio sobre n�veis de cargos e sal�rios. 
Para se familiarizar com a tabela JOBS, primeiro mostre a estrutura dessa tabela. 
Em seguida, crie uma consulta que exiba o nome, o cargo, o nome do departamento,
o sal�rio e o n�vel de todos os funcion�rios.
*/

select e.last_name, j.job_title, d.department_name, e.salary, j.min_salary, j.max_salary
from employees e
join departments d
on (e.department_id = d.department_id)
join jobs j
on (e.job_id = j.job_id);

/*
Exerc�cio 07 - Desafio
Crie uma query para obter os nomes e as datas de admiss�o de todos os funcion�rios 
admitidos antes dos respectivos gerentes, al�m dos nomes e das datas de admiss�o desses gerentes.
*/
select e.last_name, e.hire_date, m.last_name, m.hire_date
from employees e
join employees m
on (e.manager_id = m.employee_id)
where e.hire_date < m.hire_date;


-----------------------------------------M6

/*
Crie um relat�rio que exiba o n�mero e o sobrenome de todos os
funcion�rios cujo sal�rio � maior que o sal�rio m�dio. Classifique
os resultados em ordem crescente de sal�rio.
*/

select employee_id, last_name
from employees
where salary > (select avg(salary)
                from employees)
order by salary;

/*
Crie uma consulta que exiba o n�mero e o sobrenome de todos os
funcion�rios que trabalham em um departamento com funcion�rios
cujos sobrenomes cont�m a letra z.
*/

select employee_id, last_name
from employees
where department_id in (select department_id 
                        from employees
                        where last_name like '%z%');

/*
Cire uma query que exiba o sobrenome, o n�mero do
departamento e o ID do cargo de todos os funcion�rios cujo ID de
local do departamento � 1700.
*/

select last_name, department_id, job_id
from employees
where department_id in(select department_id 
                        from departments
                        where location_id = 1700);


/*
Crie um relat�rio que exiba o n�mero do departamento, o
sobrenome e o ID do cargo de todos os funcion�rios no
departamento executivo.
*/

select department_id, last_name, job_id
from employees
where department_id = (select department_id
                        from departments
                        where upper(department_name) = 'EXECUTIVE');


---------------------------------M7

/*
Exerc�cio 01
Crie um relat�rio com uma lista de pa�ses nos quais n�o h� departamentos. 
Exiba o ID e o nome dos pa�ses. Use os operadores de conjunto para criar esse relat�rio.
*/

select country_id, country_name from countries
minus
select l.country_id, c.country_name from locations l, countries c
where l.country_id = c.country_id;

/*
Exerc�cio 02
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
Exerc�cio 03
Crie uma query com as seguintes especifica��es:
Sobrenome e ID do departamento de todos os funcion�rios da tabela EMPLOYEES, mesmo que n�o perten�am a um departamento
ID e nome de todos os departamentos da tabela DEPARTMENTS, mesmo que n�o tenham funcion�rios
*/

select last_name, employee_id, null
from employees
union
select null, department_id, department_name
from departments;


------------------------------------M8

/*
Exerc�cio 01
Crie um novo departamento com o pr�ximo department_id da tabela departments, este departamento deve ter o nome de Exercicio, 
n�o deve conter um gerente e deve estar situado na cidade 1700. Para este exerc�cio voc� deve declarar todas as colunas da tabela
*/


insert into departments (department_id, department_name, manager_id, location_id)
values (271, 'Exercicio', NULL, 1700);

/*
Exerc�cio 02
A Informa��o inserida no exerc�cio 01 deve ser atualizada e agora ela o novo departamento inserido deve-se chamar "Exerc�cios 08"
*/

update departments
set department_name = 'Exerc�cios 08'
where department_name = 'Exercicio';

/*
Exerc�cio 03
Insira um registro novo na tabela employees com o id de 1234 e com o primeiro nome que deve ser composto 
com a primeira letra do primeiro nome e as 3 �ltimas letras do sobrenome do funcion�rio 100, 
o seu sobrenome deve ser o mesmo do funcion�rio 100, seu e-mail deve ser "EMAIL123", seu telefone deve ser 1,
sua data de admiss�o deve ser a data atual, o JOB ID, deve ser o mesmo do funcion�rio 100, 
seu sal�rio deve ser 10000, ele n�o deve possuir comiss�o e o seu gerente deve ser o employee_id do funcion�rio 100,
e o seu departamento deve ser o c�digo do novo departamento. As colunas n�o devem ser declaradas nessa instru��o.
*/

insert into employees
select 1234, substr(first_name, 1, 1)||substr(last_name, -3, 3), last_name, 'EMAIL123', 1, sysdate, job_id, 10000, null, employee_id, 271
from employees 
where employee_id = 100


/*
Exerc�cio 04
Deletar todos os funcion�rios do novo departamento criado no Exerc�cio 01, Obs: Deve-se usar subquery para fazer este exerc�cio
*/

delete from employees
where employee_id in (select employee_id
                        from employees
                        where department_id = 271);

/*
Exerc�cio 05
Todas as informa��es feitas at� aqui n�o devem ser confirmadas, escreva o comando que faz isso.
*/

commit;

----------------------------------M9

/*
Exerc�cio 01

Crie a tabela EMPLOYEES2 com base na estrutura da tabela EMPLOYEES. Inclua somente as colunas EMPLOYEE_ID, 
FIRST_NAME, LAST_NAME, SALARY e DEPARTMENT_ID. Nomeie as colunas da nova tabela como ID, 
FIRST_NAME, LAST_NAME, SALARY e DEPT_ID, respectivamente.
*/

CREATE TABLE EMPLOYEES2 AS
    SELECT EMPLOYEE_ID as ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID AS DEPT_ID
    FROM EMPLOYEES

SELECT * FROM EMPLOYEES2


/*
Exerc�cio 02
Crie a tabela teste_dept com duas colunas com os nomes ID e NOME, 
a coluna ID vai ser a chave prim�ria da tabela, ela tamb�m deve ser do tipo NUMBER 
com o tamanho de 10, j� a coluna NOME vai ser um VARCHAR2 com um valor 
default usando a fun��o USER e o seu tamanho vai ser de 50.
*/

create table teste_dept 
(
    id number(10), 
    nome varchar2(50) default user,
    constraint pk_id_teste_dept primary key (id)
);


/*
Exerc�cio 03
Altere a coluna NOME para NOT NULL
*/

alter table teste_dept
modify nome varchar2(50) NOT NULL;

/*
Exerc�cio 04
Renomei a coluna NOME para NOME_USUARIO
*/

alter table teste_dept
rename column nome to nome_usuario;

/*
Exerc�cio 05
Cria a coluna DATA_USUARIO como do tipo TIMESTAMP, esta coluna n�o pode ser nula.
*/

alter table teste_dept
add data_usuario timestamp not null;

/*
Exerc�cio 06
Elimine a coluna DATA_USUARIO
*/

alter table teste_dept
drop column data_usuario;

/*
Exerc�cio 07
Altere o nome da tabela teste_dept para dep
*/


alter table teste_dept
rename to dep;

/*
Exerc�cio 08
Elimine a tabela dep.
*/

drop table dep;

---------------------------------------------------------M10


/*
Exerc�cio 01
Fa�a uma VIEW que retorne o nome do funcion�rio, o id, data de entrada na empresa e sal�rio, 
de todos os funcion�rios com o cargo de TI, com o nome vw_programadores. 
As colunas dessa view devem ter o mesmo nome dos representados nessa quest�o.
*/

CREATE OR REPLACE VIEW vw_programadores ("nome do funcionario", "id", "data de entrada", salario) as
    select first_name, employee_id, hire_date, salary
    from employees
    where job_id = 'IT_PROG';
    
select * from vw_programadores;

/*
Exerc�cio 02
Utilize a view vw_programadores para retornar todos os programadores que recebem mais de 2500 d�lares.
*/

select * from vw_programadores
where SALARIO > 2500;

/*
Exerc�cio 03
Crie uma view que retorne o nome do cargo, o sal�rio m�ximo, sal�rio m�nimo, 
a soma dos sal�rios e a m�dia de sal�rio dos funcion�rio. 
Sendo que o nome do cargo deve ser retornado da tabela JOBs.
*/

create or replace view vw_nome_cargo (nome_cargo, max_salario, min_salario, sum_salario, media_salario) as
    select j.job_title, max(e.salary), min(e.salary), sum(e.salary), avg(e.salary)
    from employees e, jobs j
    where e.job_id = j.job_id
    group by j.job_title;
    
select * from vw_nome_cargo;
 
 
/*
Exerc�cio 04
Cria uma SEQUENCE que comece em 500, seja incrementada de 1 em 1, tenha o valor m�ximo de 9999 o nome dessa SEQUENCE deve ser sq_teste_employes
*/
 
 
create sequence sq_teste_employees
    increment by    1
    start with      500
    maxvalue        9999;
    

/*
Exerc�cio 05
Insira um registro na tabela employees utilizando a sequence sq_teste_employes, ap�s isso selecione o valor atual dessa sequence.
*/

insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (sq_teste_employees.nextval, 'Fernando', 'Lima', 'EMALGMAIL', 47999054093, '01/01/2018', 'IT_PROG', 6000, NULL, 103, 60);

select SQ_TESTE_EMPLOYEES.currval from dual;


/*
Exerc�cio 06
Crie um �ndice na coluna hire_date da tabela employees
*/

CREATE INDEX i_data
    on employees(hire_date);

/*
Exerc�cio 07
Crie um sin�nimo tabela jobs com o nome JB
*/

create synonym jb
    for jobs;
    
select * from jb;

----------------------------------------------------M11

/*
Exerc�cio 01
Crie uma consulta que exiba o nome das colunas, os tipos de dados, o tamanho dos dados e se eles podem ser nulos da tabela JOBS
*/

select column_name, data_type, data_length, nullable
from user_tab_columns
where table_name = 'JOBS';

/*
Exerc�cio 02
Agora fa�a uma consulta que exiba o nome da coluna, nome da constraint, o tipo 
da constraint(nome descritivo, use o DECODE com o descritivo passado na aula para exibir essa informa��o) 
a condi��o de pesquisa e o seu STATUS. Para fazer esse exerc�cio 
fa�a um JOIN das tabelas USER_CONSTRAINTS e USER_CONS_COLUMNS
*/


select l.column_name, l.constraint_name, 
    decode 
        (c.constraint_type,  'P', 'CHAVE PRIMARIA',
                            'C', 'CONSTRAINT DE VERIFICA��O',
                            'U', 'CHAVE EXCLUSIVA',
                            'R', 'INTEGRIDADE RELACIONA (FORENG KEY)',
                            'V', 'OP��O DE VERIFICA��O',
                            'O', 'SOMENTE PARA LEITURA') "TIPO", 
c.search_condition, c.status
from user_cons_columns l
join user_constraints c
on (l.constraint_name = c.constraint_name);


/*
Exerc�cio 03
Crie uma consulta para exibir as informa��es sobre suas seq��ncias: nome, valor m�ximo, tamanho do incremento e �ltimo n�mero.
*/


SELECT sequence_name, max_value, increment_by, last_number
from user_sequences;

select * from user_sequences

/*
Exerc�cio 04

Adicione um coment�rio a coluna department_id da tabela departments, este coment�rio deve ser a tradu��o do coment�rio atual. Ap�s fazer isso exiba este coment�rio.
*/


comment on column departments.department_id
    is 'Chave prim�ria da tabela de departamentos';


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







