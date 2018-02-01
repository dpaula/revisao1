
SELECT FN_MODULO_03('TESTE') FROM DUAL; --chamando uma funcão atravez de um select

--declarando um bloco anonimo para usar a função
DECLARE
       v_numero number; --declaração de variaveis
BEGIN
       v_numero := fn_modulo_03('teste'); --atribuindo retorno da função a variavel
       dbms_output.put_line(v_numero); --imprimindo..
END;


--EXCLUINDO FUNCTIONS

drop function fn_modulo_03;


------------------------------------criando uma função dendro de uma procedure


create or replace procedure sp_salario_dez (id_employee in number,
                                            r_salario out number) is

    v_salario employees.salary%type;

    cursor cur_ret_salarios (id_employee_c number) is
    select salary from employees
    where employee_id = id_employee_c;

    function salario_maior_dez_mil(salario number) return boolean is
    begin

        if(salario > 10000) then
            return TRUE;
        ELSE
            return false;
        end if;

    end salario_maior_dez_mil;

begin

    open cur_ret_salarios (id_employee);
    fetch cur_ret_salarios into v_salario;
    close cur_ret_salarios;

    if(salario_maior_dez_mil(v_salario)) then
        dbms_output.put_line('Salario maior q 10000, valor: '||v_salario);
        v_salario := v_salario * 1.15;
    else
        dbms_output.put_line('Salario menor q 10000, valor: '||v_salario);
        v_salario := v_salario * 1.5;
    end if;

    r_salario := v_salario;
    
exception when others then
    dbms_output.put_line('Ocorreu um erro desconhecido erro: '||sqlerrm);

end;     

--chamando a procedure

declare
   r_salario employees.salary%type;
begin
   sp_salario_dez(101, r_salario);
   dbms_output.put_line(r_salario);
end;                                      

----------------------excluindo uma procedure

drop procedure sp_employee_100;   

select * from all_objects
where object_name = 'SP_SALARIO_DEZ';    

--------------------------------------CURSORES

--CURSRO IMPLICITO

DECLARE
         ID_EMPLOYEE EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
         --com um comando select normal, basta incluir o into e variavel, para carregar a variavel com o resultado do select
         SELECT EMPLOYEE_ID  
         INTO ID_EMPLOYEE
         FROM EMPLOYEES
         WHERE EMPLOYEE_ID = 100;
         
         DBMS_OUTPUT.PUT_LINE(ID_EMPLOYEE);
END;          


---------cursor explicito

DECLARE
        CURSOR CUR_RET_EMPLOYEE_ID IS
            SELECT EMPLOYEE_ID 
            FROM EMPLOYEES
            WHERE EMPLOYEE_ID = 100;     
        
        ID_EMPLOYEE EMPLOYEES.EMPLOYEE_ID%TYPE;
                
BEGIN
        OPEN CUR_RET_EMPLOYEE_ID;
        FETCH CUR_RET_EMPLOYEE_ID INTO ID_EMPLOYEE;
        CLOSE CUR_RET_EMPLOYEE_ID;
        
        DBMS_OUTPUT.PUT_LINE(ID_EMPLOYEE);       
END;


--------------RETORNANDO MAIS DE UM VALOR NO CURSOR


--usando recurso for <lista> in <cursor)
--recurso mais novo
CREATE OR REPLACE PROCEDURE SP_CURSOR1(DATA_ENTRADA DATE) IS

       CURSOR CUR_RET_EMPLOYEES(DATA_ENT DATE) IS
           SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
           FROM EMPLOYEES
           WHERE HIRE_DATE > DATA_ENT;

BEGIN
      FOR R_EMPLOYEES IN CUR_RET_EMPLOYEES(DATA_ENTRADA) LOOP
          DBMS_OUTPUT.PUT_LINE('O Empregado '||r_employees.first_name||
                                'comecou a trabalhar na empresa em '||
                                to_char(r_employees.hire_date, 'dd/mm/RRRR'));                 
      END LOOP;
                     
END;


BEGIN
SP_CURSOR1(TO_DATE('01/02/2008', 'DD/mm/RRRR'));

END;

-- abrindo o cursor, iniciando um loop, dando um fetch e fechando o cursor
CREATE OR REPLACE PROCEDURE SP_CURSOR2(DATA_ENTRADA DATE) IS

       CURSOR CUR_RET_EMPLOYEES(DATA_ENT DATE) IS
           SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
           FROM EMPLOYEES
           WHERE HIRE_DATE > DATA_ENT;
  
       r_employees cur_ret_employees%rowtype;
BEGIN
       OPEN CUR_RET_EMPLOYEES(DATA_ENTRADA);
       
       LOOP
           
           FETCH CUR_RET_EMPLOYEES INTO R_EMPLOYEES;
           EXIT WHEN CUR_RET_EMPLOYEES%NOTFOUND;
           
           DBMS_OUTPUT.PUT_LINE('O Empregado '||r_employees.first_name||
                                'comecou a trabalhar na empresa em '||
                                to_char(r_employees.hire_date, 'dd/mm/RRRR'));
         
       END LOOP;
       CLOSE CUR_RET_EMPLOYEES;
                     
END SP_CURSOR2;


begin
SP_CURSOR2(TO_DATE('01/02/2007','dd/mm/RRRR'));
end;

--------------------------------------------------------------CLAUSULA RETURNING


SELECT * FROM ERROS;

CREATE SEQUENCE SQ_ERROS
       INCREMENT BY  1
       MAXVALUE      999999
       START WITH    2;

DECLARE
       ERROr_ID ERROS.ERROR_ID%TYPE;
       ERROR_MSG ERROS.ERROR_MSG%TYPE;

BEGIN
      
      INSERT INTO ERROS (ERROR_ID, ERROR_MSG, ERROR_OBJECT, ERROR_DATE)
      VALUES (SQ_ERROS.NEXTVAL, 'TESTE DE RETURNING', 'SCRIPT', SYSDATE)
      RETURNING ERROR_ID, ERROR_MSG INTO ERROR_ID, ERROR_MSG;-- apos um comando de insert ou update, pode se usar esta clausula para retornar valores
      
      DBMS_OUTPUT.PUT_LINE('Erro id: '||error_id||', mensagem: '||error_msg);

END;



--------------------------------------------------------------PACKAGES


--chamando uma package

declare 
     salario number;
begin
     pkg_controle_funcionario.sp_salario_dez(100, salario);
     dbms_output.put_line(salario);
end;

--chamando uma package de overloading

begin
     pkg_controle_funcionario.sp_salario_dez(100);
end;

---------------------chamando uma procedure com retorno do tipo record

declare

    r_empregado pkg_controle_funcionario.r_empregados;
begin
    
    pkg_controle_funcionario.sp_salario_dez(100, r_empregado);
    
    dbms_output.put_line('ID: '||r_empregado.emp_id);
    dbms_output.put_line('nome: '||r_empregado.nome);
    dbms_output.put_line('sobrenome: '||r_empregado.sobrenome);

end;

--------------------------------------excluindo uma package

DROP PACKAGE PKG_TESTE;


---------------------------------------------------EXECUTE IMMEDIATE
--EXECUTA um comando diretamente em um bloco de string

DECLARE 
     V_CODIGO_BLOCO VARCHAR2(200);
     V_CODIGO_SQL   VARCHAR2(200);
BEGIN
  
     EXECUTE IMMEDIATE 'CREATE TABLE TEMP_TABLE (coluna varchar2(10))';
     
     FOR v_counter in 1..10 loop
       
--          V_CODIGO_SQL := 'INSERT INTO TEMP_TABLE VALUES (''ROW ' || v_counter||''')';
          
            V_CODIGO_SQL := 'INSERT INTO TEMP_TABLE VALUES (''ROW ' || v_counter ||''')';
          
          execute immediate V_CODIGO_SQL;
     
     END LOOP;

     V_CODIGO_BLOCO := 
     'BEGIN
           FOR v_rec in (select * from temp_table) LOOP
               DBMS_OUTPUT.PUT_LINE(v_rec.coluna);  
           END LOOP;
     END;';

     EXECUTE IMMEDIATE V_CODIGO_BLOCO;
     EXECUTE IMMEDIATE 'DROP TABLE TEMP_TABLE';
END;                                                           

select * from temp_table;
drop table temp_table;

---------------------EXECUTE IMMEDIATE junto com INTO e USING


DECLARE

     v_sqlquery varchar2(200);
     v_nome employees.first_name%type;
     v_id   employees.employee_id%type;

BEGIN
    
    v_id := 100;
    
    v_sqlquery := 'SELECT first_name from employees 
                   WHERE employee_id = :v_id';
                   
    execute immediate v_sqlquery --executa a query da string
    INTO v_nome --joga o resultado da query para a variavel v_nome
    USING v_id; --usando o parametro definido da query
    
    DBMS_OUTPUT.PUT_LINE('Nome do funcionario: '||v_nome);

END;

-----------------------------------------criando uma query dinamica com EXECUTE IMMEDIATE


DECLARE

    v_sql_query varchar(200);
    v_id      employees.employee_id%type;
    v_nome    employees.first_name%type;
    v_salario employees.salary%type;

BEGIN
  
    v_id := 101;
    v_salario := 1000;
    
    v_sql_query := 'SELECT first_name FROM employees
                    WHERE employee_id = :v_id';
                    
    if(v_id > 100) then
    
        v_sql_query := v_sql_query||' and salary < :v_salario ';
    
    end if;
    
    if(v_id > 100) then
    
       EXECUTE IMMEDIATE v_sql_query
       INTO v_nome
       USING v_id, v_salario;
       
    ELSE
       
       EXECUTE IMMEDIATE v_sql_query
       INTO v_nome
       USING v_id
    
    end if;

    dbms_output.put_line('Nome: '||v_nome);
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Nao foi encontrado nenhum funcionario!!');
    WHEN OTHERS THEN
        dbms_output.put_line('ERRO DESCONHECIDO!!');
END;



--------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------TRIGGERS


CREATE OR REPLACE TRIGGER TR_VERIFICA_SALARIO --DECLARAÇÃO DA TRIGGER
    after update of salary on employees --INFORMANDO QUE SERÁ EXECUTADA DEPOIS DO UPDATE DO CAMPO SALARIO DA TABELA EMPLOYEES
    for each row --VAI EXECUTAR LINHA A LINHA
      
DECLARE

    v_salario_antigo employees.salary%type;
    v_salario_excecao exception;

BEGIN
  
   v_salario_antigo := :OLD.SALARY * 1.1; -- OLD.<campo> busca o valor antigo(antes do update)
   
   if(:NEW.salary > v_salario_antigo) then
   
       RAISE v_salario_excecao;
   
   end if;

EXCEPTION 
   WHEN V_SALARIO_EXCECAO THEN
       RAISE_APPLICATION_ERROR(-20002, 'ERRO: Salario maior que 10%'); 
   WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20002, 'Ocorreu um erro durante a execucao! ERRO: '||sqlerrm);   
   
END TR_VERIFICA_SALARIO;


update employees
set salary = 7500
where employee_id = 500;

select * from employees
where employee_id = 500;

----------------------------DESABILITAND/HABILITANDO uma trigger

ALTER TRIGGER TR_VERIFICA_SALARIO DISABLE;
ALTER TRIGGER TR_VERIFICA_SALARIO ENABLE;

SELECT * FROM USER_TRIGGERS;


---EXCLUINDO TRIGGER

DROP TRIGGER TR_TESTE;

-----------------------------CRIANDO TRIGGERS DE SISTEMA

CREATE TABLE AUDITORIA
(
       nome_user varchar(100),
       data_user date default sysdate
);


--triggers de sistema so podem ser criadas pelo usuario system
--criando uma procedure que simplesmente insere um registro na tabela auditoria
create or replace procedure sp_auditoria(n_usuario varchar2) as
begin
    insert into auditoria (nome_user)
    values (n_ususario);
end sp_auditoria;

--criando a trigger de sistema, que irá ser chamada depois do login de um user
create or replace trigger trg_log_usu 
after logon --será chamada depois do login
on database --no banco
     call sp_auditoria(ora_login_user) --chamando procedure para inserir o usuário que fez o login


select * from auditoria;

------------------------CRIANDO UM TRIGGER QUE SERÁ EXECUTADA APÓS INSERIR, ALTERAR E REMOVER

CREATE OR REPLACE TRIGGER TRG_EXCECAO
after update or insert or delete
on employees
for each row
DECLARE  

     EXCECAO_INSERT EXCEPTION;
     EXCECAO_UPDATE EXCEPTION;
     EXCECAO_DELETE EXCEPTION;

begin
  
    IF INSERTING THEN --VERIFICA SE ESTÁ INSERINDO
         RAISE EXCECAO_INSERT;
    ELSIF UPDATING THEN--VERIFICA SE ESTÁ ALTERANDO
         RAISE EXCECAO_UPDATING;
    ELSIF DELETING THEN--VERIFICA SE ESTÁ DELETANDO
         RAISE EXCECAO_DELETE;
    END IF;
    
EXCEPTION 
    WHEN EXCECAO_INSET THEN
        RAISE_APPLICATION_ERROR(-20002, 'ERRO: Nao e possivel INSERIR!'); 
    WHEN EXCECAO_UPDATE THEN
        RAISE_APPLICATION_ERROR(-20002, 'ERRO: Nao e possivel ALTERAR!'); 
    WHEN EXCECAO_DELETE THEN
        RAISE_APPLICATION_ERROR(-20002, 'ERRO: Nao e possivel REMOVER!'); 
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(' ERRO DESCONHECIDO!');     

end TRG_EXCECAO;



insert into employees
select 1235, substr(first_name, 1, 1)||substr(last_name, -3, 3), last_name, 'EMAIL123', 1, sysdate, job_id, 10000, null, employee_id, 271
from employees 
where employee_id = 100;

update employees
set salary = 5000
where employee_id = 100;

delete from employees
where employee_id = 100;

-----------------------------SIMULANOD ERRO AO TENTAR ACESSAR REGISTRO DE UMA TABELA ONDE A MESMA ESTÁ SENDO REFERENCIADA NA TRIGGR


CREATE OR REPLACE TRIGGER TRG_TESTA_SELECT2
before update or insert
of salary on employees
for each row
DECLARE
   v_salary employees.salary%type;
   CURSOR CUR_RET_SALARY(ID_EMPLOYEE EMPLOYEES.EMPLOYEE_ID%TYPE) IS
        SELECT SALARY FROM EMPLOYEES
        WHERE EMPLOYEE_ID = ID_EMPLOYEE;
    
BEGIN
  --select salary 
  --into v_salary
  --from employees
  --where employee_id = 100;
  
  OPEN CUR_RET_SALARY(100);
  FETCH CUR_RET_SALARY INTO v_salary;
  CLOSE CUR_RET_SALARY;
  

  dbms_output.put_line('ERROO....');

END TRG_TESTA_SELECT2;

UPDATE EMPLOYEES

--------------------------------------CONSULTANDO DEPENDENCIAS DE OBJETOS

SELECT * FROM USER_DEPENDENCIES
WHERE NAME = 'PKG_CONTROLE_FUNCIONARIO';

  



-----------------------------------

begin
  deptree_fill('table', 'hr', 'employees');
end;

select * from deptree order by seq#;

select * from ideptree;
























                        
