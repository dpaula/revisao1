

-------------BLOCOS ANONIMOS
DECLARE --declarando variáveis
    v_employee_id number; --declarando uma variave do tipo number, não é necessario informar tamanho nem valor
    
    cursor cur_ret_employees is -- declarando um cursor, e já carregando com um select
        select * from employees
        where employee_id in(100, 102, 101);

BEGIN
    v_employee_id := 100; --iniciando o bloco inicializando uma variavel
    
    for r_employees in cur_ret_employees loop --fazendo um loop for
        
        if r_employees.employee_id = v_employee_id then --fazendo um if
            DBMS_OUTPUT.PUT_LINE('EMPLOYEE 100'); --imprimindo no console
        else
            DBMS_OUTPUT.PUT_LINE('outro!!');
        end if;
    end loop;
END;

-----------blocos nao anonimos

CREATE OR REPLACE PROCEDURE SP_EMPLOYEE_100 IS 
    v_employee_id number; --declarando uma variave do tipo number, não é necessario informar tamanho nem valor
    
    cursor cur_ret_employees is -- declarando um cursor, e já carregando com um select
        select * from employees
        where employee_id in(100, 102, 101);

BEGIN
    v_employee_id := 100; --iniciando o bloco inicializando uma variavel
    
    for r_employees in cur_ret_employees loop --fazendo um loop for
        
        if r_employees.employee_id = v_employee_id then --fazendo um if
            DBMS_OUTPUT.PUT_LINE('EMPLOYEE 100'); --imprimindo no console
        else
            DBMS_OUTPUT.PUT_LINE('outro!!');
        end if;
    end loop;
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('OCORREU UM ERRO!!');
END;

EXECUTE SP_EMPLOYEE_100;


----------------------------------------liberando privilegios para usuarios

--privilegios de sessão
select * from session_privs;
--privilegios de objeto
select * from user_tab_privs;

--liberando a execução da procedure para o usuario system
grant execute on sp_employee_100 to system;
execute hr.sp_employee_100;

--traz todos os objetos criados do usuario
select * from user_objects;

--util pra saber onde as procedures são chamadas
select * from all_source;

select * from all_source
where text like '%v_employee_id%';


-------------------------------------FUNÇÕES

create or replace function FN_MODULO_02(F_NOME IN VARCHAR2) return number is
    v_number NUMBER;
begin
    
    v_number  := 10;
    
    return v_number;

EXCEPTION WHEN OTHERS THEN
    NULL;
    
end FN_MODULO_02;


SELECT FN_MODULO_02('TESTE') FROM DUAL;

DECLARE
    v_number number;
BEGIN
    v_number := FN_MODULO_02('TESTE');
    DBMS_OUTPUT.PUT_LINE(v_number);
END;
