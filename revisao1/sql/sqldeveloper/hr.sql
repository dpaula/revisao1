
DECLARE
    V_NM_FUNCIONARIO EMPLOYEES.FIRST_NAME%Type;
BEGIN
    
    SELECT first_name
    INTO V_NM_FUNCIONARIO
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 102;
    
    IF V_NM_FUNCIONARIO = 'Lex' THEN
        DBMS_OUTPUT.put_line(V_NM_FUNCIONARIO);
    ELSE
        DBMS_OUTPUT.put_line('NÃO É IGUAL..');
    END IF;
    
END;

select * from employees where employee_id = 102




select distinct(department_id) from employees
select distinct department_id  from employees

select count(*) from employees

-------------------

select * from employees where hire_date like '%09/05';
--retorna apenas quando o nome tem o 'e' como segundo caracter
select * from employees where first_name like '_e%';
select * from employees where job_id like 'AD_%';
select * from employees where job_id like 'AD\_%' ESCAPE '\';

SELECT * FROM employees where employee_id = :funcionario;

----------FUNÇÕES STRING

--INITCAP deixa só a primeira letra maiuscula
select INITCAP('FERNANDO') FROM dual;

--SUBSTR pega uma parte da string, indicando o indice(iniciando por 1) e a quantidade de letras
select substr('aabbccdd', 3 , 2) from dual;

--LENGTH retorna o tamanho da string
select length('123456') from dual;

--INSTR retorna o indice(inciando em 1) da letra informada para a palavra
select instr('Fernando', 'n') from dual;

--LPAD cria uma mascara para o primeiro parametro, com um espaço informado no segundo parametro, e preenchendo a esquerda que sobrar com o terceiro parametro
select lpad('FernandoPaula', 20, '-') from dual;
select lpad('50', 4, '0') from dual; --0050

--RPAD cria uma mascara para o primeiro parametro, com um espaço informado no segundo parametro, e preenchendo a direita que sobrar com o terceiro parametro
select rpad('FernandoPaula', 20, '-') from dual;

--REPLACE troca a letra passada pela a que vc qr
select replace('Fernando de Paula de Lima', 'a', 'X') from dual;

--TRIM -- remove o caracter expecificado
select trim('F' from 'Fernando de Paula de Lima ') from dual;

------------FUNÇÕES NUMERICAS

--ROUND -- arredonda o valor para cima cado a quantidade de casas especificadas forem maior que a informada
select round(10.555, 2) from dual; -- 10,56

--TRUNC -- não arredonda, apenas trunca a quantidade de casas informadas
select trunc(10.59, 1) from dual; 10,5

--MOD traz o resto da operação
select mod(3, 2) from dual;


------------FUNÇÕES DE DATAS

--SYSDATE traz a data atual
select sysdate from dual;

--SOMANDO dias a data
select sysdate +15 from dual;

--SUBTRAÇÃO retorna data menos a quantidade de dias 
select sysdate - 10 from dual;

--DIFERENÇA - quando é feita uma operação entre datas, é retornada a diferença em dias
select (sysdate + 10) - sysdate from dual;
select sysdate - to_date('17/01/2018') from dual;

--SOMANDO HORA (N/24)
select sysdate + 1/24 from dual;
--SOMANDO HORA E CONVERTENDO PARA APARECER A HORA
select to_char(sysdate + 1/24 , 'dd/mm/rrrr hh24:mi') from dual; --
--SOMANDO HORA E CONVERTENDO PARA APARECER A HORA
select to_char(to_date('17/01/2018 10:00', 'dd/mm/rrrr hh24:mi')  + 1/24 , 'dd/mm/rrrr hh24:mi')  from dual -- 17/01/2018 11:00
--SOMANDO MINUTO (N/1440)
select to_char(to_date('17/01/2018 10:00', 'dd/mm/rrrr hh24:mi')  + 10/1440 , 'dd/mm/rrrr hh24:mi')  from dual -- 17/01/2018 10:10
--SOMANDO SEGUNDO (N/86400)
select to_char(to_date('17/01/2018 10:00', 'dd/mm/rrrr hh24:mi')  + 10/86400 , 'dd/mm/rrrr hh24:mi:ss')  from dual -- 17/01/2018 10:00:10

--MONTHS_BETWEEN traz a difenrença em meses, da primeira data(maior) para a segunda
SELECT months_between(TO_DATE('10/05/2018', 'DD/MM/RRRR'), sysdate) from dual;

--ADD_MONTHS adiciona uma quantidade de meses a data
select add_months(sysdate, 1) from dual;

--NEXT_DAY retorna o dia do mes do proximo dia da semana passado (começando com domingo = 1, segunda = 2,...)
select next_day(sysdate, 1) from dual;

--LAST_DAY retorna ultimo dia do mes da data passada
select last_day(sysdate) from dual;

--ROUND arredonda a data conforme se passado mes ou ano, para a data acima
select round(to_date('17/10/2018'), 'month') from dual; -- 01/11/18

--TRUNC apenas trunca a data conforme o parametro não arredondando a data
select trunc(to_date('17/10/2018'), 'month') from dual; -- 01/10/18


-------------CONVERSÕES TO_CHAR

--FORMATANDO NUMERO
--moeda local -> L*n 
--nnDnn d entre os numeros mosta uma virgula na mascara (caracter decimal)
select first_name, to_char(salary, 'l99999d99') from  employees -- 24000 -> R$24000,00

--ZERO A ESQUERDA - cria uma mascara incluindo 0 a esquerda para preencher as casas
select to_char(1234, '09999999') from dual;  -- 00001234

--MI caso o valor seja negativo, ele muda o sina da esquerda para a direita
select to_char(-1234, '9999mi') from dual; -- 1234-

--S inclui o sinal positivo ou negativo a esquerda do numero, dependendo de seu sinal
select to_char(+1234, 's99999') from dual; -- +1234


---------------------

--NVL verifica se o campo passado esta nulo, se estiver retorna o valor especificado, o valor tem que ser conforme o tipo do campo
select last_name, nvl(commission_pct, 0) from employees
select last_name, nvl(first_name, 'AAAAAAAAAAA') from employees

--NVL2 verifica se o campo é nullo, caso não for retorna o 1 parametro, se for nullo retorna o segundo..
select last_name, nvl2(first_name, 'NÃO É NULLLLLLLLLLLLLLLLLLOOOOOOO', 'NUUUUULLLLOOOOOOOOOO') from employees 

--NULLIF -- se as duas expressões sao iguais ele retorna null, senão ele retorna a expressão 1
select first_name, nullif(first_name, last_name) from employees

--COALESCE -- verifica os parametros e retorna o primeiro que não for nullo
select last_name, coalesce(first_name, email, '000000000000000') from employees

--CASE é uma condição q valida uma operação e rotorna conforme sua condição
select last_name, job_id, salary, -- faz uma seleção normal dos campos
    case job_id when 'IT_PROG' then 1.8*salary --caso no campo "job_id" tenha o valor "IT_PROG" então retorna a expressão..
                when 'SA_REP' then 1.5*salary
    else salary
    end "REVISÃO SALARIAL"
FROM employees;

--DECODE mesma coisa do case, apenas muda sua sintaxe, e é expecifica do oracle
select last_name, job_id, salary,
    decode(
        job_id, 'IT_PROG', 1.8*salary,
                'SA_REP', 1.5*salary,
        salary
        ) "REVISÃO SALARIAL"
FROM employees;


--AVG com NVL
select avg(salary) as "Média Salarial" from employees
select to_char(avg(salary), 'l99999d9999') as "Média Salarial" from employees
select round(avg(salary), 4) as "Média Salarial" from employees
select to_char(avg(nvl(commission_pct, 0)), 'l99999d99') as "Média Salarial" from employees
select to_char(avg(commission_pct), 'l99999d99') as "Média Salarial" from employees


-------------GROUP BY

--A CLAUSULA GROUP BY, SÓ DEVER SER UDADA QUANDO EXISTE UMA FUNÇÃO DE GRUPO NO SELECT
--EX.:
-- select campo1, FUNÇÃÇÃO DE GRUPO(campo2) from tabela where GROUP BY campo1

--selecionando a média salarial, agrupando por departamentos
select department_id, to_char(avg(salary), 'l99999d99') from employees group by department_id

--agrupando pela média decrescente
select department_id, to_char(avg(salary), 'l99999d99') from employees group by department_id order by 2 desc

--TRAZENDO MAIS DE UM CAMPO AGRUPADO
select department_id as DEPARTAMENTO, job_id JOB, to_char(SUM(SALARY), 'l999999d99') "TOTAL" from employees group by department_id, job_id order by 1

------HAVING
--funciona como um where para funcoões normais, mas aqui só para funções de agrupamentos (usando group by)

--selecionando salaário maiores de cada departamento, mostrando somente os que possuem salários maiores que 10k
select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000

--mesclando funçoes de agrupamento e clausula having 
--traz a média salarial de cada departamento, mas só em departamentos onde tem salário maior que 10k
select department_id, avg(salary)
from employees
group by department_id
having max(salary) > 10000

--usando todas as clausulas
select job_id, sum(salary) PAGAMENTO --traz a soma de salarios agrupados por job
from employees
where job_id not like '%REP%' --mas somente para job não representantes
group by job_id --agrupando pelo job
having sum(salary) > 13000 -- e restringindo jobs onde a soma de seus salários não sejam maior q 13k
order by sum(salary) -- ordenando a coluna de salarios

--Usando uma funçao de grupo dentro de outra
--aqui traz a media salarial, agrupando por departamento, mas como está dentro da função max, traz somente a maior media
select max(avg(salary)) 
from employees
group by department_id;

----------------------------------

----------------------------------JOINS

--NATURAL JOIN
--basta ter um campo quem cada tabela que tenha o mesmo nome e o mesmo tipo de dados entre elas, mas somente dados com mesmo valor

SELECT * FROM locations


--como as duas tabelas tem o mesmo campo location_id, basta colocar o natural join e traz dados de ambas as tabelas
select department_id, department_name, city
from departments
natural join locations;

--EQUI JOIN
--está fazendo um join entre as tabelas employees e departments, especificando o campo department_id como ligação entre as mesmas
select  employees.employee_id, employees.last_name,
        departments.location_id, department_id
from employees 
join departments
using(department_id);

--O mesmo de cima, só com apelidos
select e.employee_id, e.last_name,
       d.location_id, department_id
from employees e
join departments d
using(department_id);


--usando apelidos, o apelido não pode ser usado na clausula where quando for o campo de ligação (using)
select l.city, d.department_name -- os campos selecionados
from locations l -- tabela1 definindo apelido
join departments d -- join para a tabela2 definindo apelido
using(location_id) -- campo de ligação
where location_id = 1400;



---USANDO ON ao invéz de USING
select e.employee_id, e.last_name,
       d.department_id, d.location_id
from employees e
join departments d
on e.department_id = d.department_id;

--SELF JOIN faz um join interno dentro da propria tabela entre dois campos ids
select e.last_name EMPREGADO, m.last_name GERENTE -- traz o empregado e seu gerente
from employees e --diz qual a tabela do empregado
join employees m --diz qual a tabela do gerente
on (e.manager_id = m.employee_id); --faz o campo de ligação, pro empregado trazer o id do gerente e do gerente trazer o id do empregado (os campos que precisam ser iguais)

--AND - como se fosse um where, mas para restringir os campos do join
select e.manager_id, e.employee_id, e.last_name, e.department_id,
       d.department_id, d.location_id
from employees e
join departments d
on (e.department_id = d.department_id)
and e.manager_id = 100;

--JOINs com 3 tabelas
--trazendo empregado, seu departamento e sua cidade, cada informação de uma tabela diferente ligadas entre joins
select e.employee_id, e.last_name, d.department_name, l.city
from employees e
join departments d
on (e.department_id = d.department_id)
join locations l
on (d.location_id = l.location_id);

---------JOINS EXTERNOS

--LEFT OUTER JOIN
--traz todos os que possuem a ligação dos ids informados no on(?), mais o resto dos registros da tabela da esquerda(tabela especificad no from)
select e.employee_id, e.last_name,
       d.department_id, d.department_name 
from employees e --esta tabela que virá registros com departamentos nulos
left outer join departments d
on (e.department_id = d.department_id);

--RIGHT OUTER JOIN
--traz todos os que possuem a ligação dos ids informados no on(?), mais o resto dos registros da tabela da direita(tabela especificad no right outer join)
select e.employee_id, e.last_name,
       d.department_id, d.department_name 
from employees e
right outer join departments d --esta tabera é da direita, que virá registro com empregados nulos
on (e.department_id = d.department_id);

--FUL JOIN - traz tudo, os q tem ligação entre os ids, e o resto das tabelas ligadas
select e.employee_id, e.last_name,
       d.department_id, d.department_name
from employees e
full join departments d
on (e.department_id = d.department_id);

--CROSS JOIN
--traz todos de todos
select last_name, department_name
from employees
cross join departments;


------------------SUB SELECTS

--com retorno de apenas uma linha
--fazendo uma busca da média salarial do job, mas trazendo somente o que a média for igual ao valor retornado na subquery
select job_id, avg(salary)
from employees
group by job_id
having avg(salary) = (select max(avg(salary))
                      from employees
                      group by job_id);  

--com retorno de varias linhas usando operador in
select last_name, salary, department_id
from employees 
where salary in (select min(salary)
                from employees
                group by department_id);

--ANY retorna tudo que for verdadeira na condição de cada linha da lista do any
select last_name, salary, department_id
from employees
where salary < any (3000, 8000) --neste exemplo, retorna se o salario for menor de 2k ou melhor 5k
order by salary

--O MESMO QUE O DE CIMA, MAS COM SUBQUERY
select last_name, salary, department_id
from employees
where salary < any (select salary 
                    from employees
                    where salary in (3000,  8000));


--ALL busca todos os valores e neste caso valida o menor valor da lista retornado 
select last_name, salary, department_id
from employees
where salary < all (select salary 
                    from employees
                    where salary in (3000,  8000));


------------UNION
--une duas consultas
--precisam tem a mesma quantidade de colunas e do mesmo tipo

select employee_id, job_id, department_id
from employees
union
select employee_id, job_id, department_id
from job_history

select employee_id, job_id, department_id
from employees
union all
select employee_id, job_id, department_id
from job_history
order by employee_id

--INTERSECT -- suas regras de execução são iguas a UNION
--vai trazer somente registros que tem os mesmos dados em ambas as tabelasa
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history

--MINUS -- suas regras de execução são iguas a UNION
--contraio do INTERSECT - traz somente registros que não se repetem nas duas tabelas
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history

-------------------INSERT SELEC

create table representantes_venda
(
    id number(10) not null,
    nome varchar2(50) not null,
    salario number(10,2) not null,
    comissao number(10,2)
);

--INSERT SELECT
--insert normal, mas não vai o VALUES, e sim o select logo depois das tabelas 
insert into representantes_venda
(id, nome, salario, comissao)
select employee_id, last_name, salary, commission_pct
from employees
where job_id like '%REP%'

select * from representantes_venda

--------UPDATE COM SUBQUERY

select * from employees
where employee_id = 114

update employees
set
job_id = (select job_id
            from employees
            where employee_id = 205),
salary = (select salary
            from employees
            where employee_id = 205)
where employee_id = 114;

---------------------------------TIMESTAMP

CREATE TABLE TESTE_TIMESTAMP
(
    HORA_ATUAL TIMESTAMP(7)
);

INSERT INTO TESTE_TIMESTAMP VALUES (SYSDATE);

SELECT * FROM TESTE_TIMESTAMP 

------------INTERVAL

CREATE TABLE TABELA_INTERVALOS
(
    INTERVALO_ANO INTERVAL YEAR (3) TO MONTH,
    INTERVALO_DIA INTERVAL DAY (3) TO SECOND
);

INSERT INTO TABELA_INTERVALOS (INTERVALO_ANO, INTERVALO_DIA)
VALUES (INTERVAL '120' MONTH(3), INTERVAL '180' DAY(3));

SELECT * FROM TABELA_INTERVALOS

--add 120 meses a data atual
SELECT sysdate+intervalo_ano from tabela_intervalos --19/01/2028 
SELECT to_char(sysdate+intervalo_ano, 'dd-mon-yyyy') from tabela_intervalos --19-jan-2018

select sysdate+intervalo_dia from tabela_intervalos

-----------------DEFININDO CONSTRAINTS

CREATE TABLE TESTE_PK 
(
    PK_COL NUMBER(10) CONSTRAINT PK_COL_TESTE PRIMARY KEY,
    EMPLOYEE_ID NUMBER(10),
    NOT_NULL NUMBER(10) NOT NULL,
    COL_UNIQUE DATE,
    COL_CHECK NUMBER(10,2),
    CONSTRAINT UNIQUE_COL_UNIQUE UNIQUE (COL_UNIQUE),
    CONSTRAINT FK_EMPLOYEE_ID FOREIGN KEY (EMPLOYEE_ID) -- NÃO VAI VIRGULA
    REFERENCES EMPLOYEES (EMPLOYEE_ID) ON DELETE CASCADE,
    CONSTRAINT CHECK_COL_CHECK CHECK (COL_CHECK > 10) -- CRIANDO UMA CONSTRAINT CHECK.. COM UMA CONDIÇÃO Q SO PODERA SER INCLUIDA SE ESTIVER NA CONDIÇÃO
);

--------VALORES DEFAULT PARA TABELAS

create table teste_default
(
    id_number number(10),
    dt_inserido date default sysdate --definindo o campo para receber como default a data atual
);

insert into teste_default (id_number)
values (10);

select * from teste_default

----------------CREATE TABLE COM SELECT

create table dep90 as -- define as para dizer q apartir dali recebe os valores retornados pelo select, não herda a primary key, apenas os tipos
    select employee_id, first_name, hire_date, salary * 12 as "Salario"
    from employees
    where department_id = 90;

desc dep90;

select * from dep90;

---------------ALTER TABLE

--add um campo qualquer
alter table teste_default
add nome_usuario varchar2(20);

update teste_default
set nome_usuario = user; --setando o usuario corrente da base

--modificando uma tabela
alter table teste_default
modify nome_usuario varchar2(20) not null; --não pode ter resgistro nulos ao modificar um campo para NOT NULL

--RENOMEANDO UMA COLUNA
alter table teste_default
rename column nome_usuario to nome_user;

--renomeando o nome da tabela
alter table teste_default
rename to tabela_default;

--DROP COLUMN para excluir coluna e DROP TABLE para ecluir tabela


