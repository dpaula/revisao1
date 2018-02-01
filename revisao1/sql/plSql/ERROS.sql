

create or replace function fn_modulo_02(F_NOME IN VARCHAR2) return number is
       v_number number;
begin
       v_number := 10;
       return v_number;
Exception when others then
  NULL;
end fn_modulo_02;


DECLARE
    V_NOVO_SALARIO EMPLOYEES.SALARY%TYPE;

BEGIN
    sp_employee_100(P_ID_EMPLOYEE => 101, P_VL_SALARY => V_NOVO_SALARIO);
    DBMS_OUTPUT.PUT_LINE('Novo salsrio e '||V_NOVO_SALARIO);
END;

---------------

create table tb_produto
(
       id_produto number(10),
       n_produto varchar(30),
       constraint pk_id_produto primary key (id_produto)
);

insert into tb_produto (id_produto, n_produto)
values (1, 'coca cola');

insert into tb_produto (id_produto, n_produto)
values (1, 'coca cola');

-------------------contornando erro de chave duplicada

BEGIN
     insert into tb_produto (id_produto, n_produto)
     values (1, 'coca cola');
  EXCEPTION WHEN DUP_VAL_ON_INDEX THEN
    UPDATE TB_PRODUTO SET N_PRODUTO = 'COCA-COLA'
    WHERE ID_PRODUTO = 1;
    DBMS_OUTPUT.PUT_LINE('ENTROU');
END;


--------------------------CONTORNANDO ERRO DE NO DATA FOUND(NULL POINTER)
DECLARE
    V_NOME_PRODUTO TB_PRODUTO.N_PRODUTO%TYPE;

BEGIN
    SELECT N_PRODUTO INTO V_NOME_PRODUTO 
    FROM TB_PRODUTO
    WHERE ID_PRODUTO = 2;
    
    DBMS_OUTPUT.PUT_LINE('o NOME DO PRODUTO E '||V_NOME_PRODUTO);
    
EXCEPTION WHEN NO_DATA_FOUND THEN
  INSERT INTO TB_PRODUTO (ID_PRODUTO, N_PRODUTO)
  VALUES (2, 'BHRAMA');

END;

SELECT * FROM TB_PRODUTO;

--------------------CONTORNANDO ERRO DE RETONRO DE MAIS DE UM REGISTRO

INSERT INTO TB_PRODUTO (ID_PRODUTO, N_PRODUTO)
VALUES (3, 'COCA-COLA');

DECLARE
    V_NOME_PRODUTO TB_PRODUTO.N_PRODUTO%TYPE;
    
BEGIN
  SELECT N_PRODUTO INTO V_NOME_PRODUTO
  FROM TB_PRODUTO
  WHERE N_PRODUTO = 'COCA-COLA';
  
EXCEPTION WHEN TOO_MANY_ROWS THEN
  DBMS_OUTPUT.PUT_LINE('RETORNOU MAIS DE UMA COCA-COLA');

END;

---------------------------TRANTANDO EXCEÇÃO DE DIVIZÃO POR ZEROOOO


DECLARE
  V_ZERO_DIVIDE NUMBER(10);
BEGIN 
  V_ZERO_DIVIDE := 10/0;
  DBMS_OUTPUT.PUT_LINE(V_ZERO_DIVIDE);

EXCEPTION WHEN ZERO_DIVIDE THEN
  DBMS_OUTPUT.PUT_LINE('DIVIZAO POR ZERO..');

END;

---------------------------------------TRATANDO QUALQUER ERRO..


DECLARE
  V_ZERO_DIVIDE NUMBER(10);
BEGIN 
  V_ZERO_DIVIDE := 10/0;
  DBMS_OUTPUT.PUT_LINE(V_ZERO_DIVIDE);

EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('DIVIZAO POR ZERO.. ERRO: ' ||SQLERRM);

END;


-------------------------------------------CRIANDO UM EXCECAO TRATADA

DECLARE 
  E_ERRO EXCEPTION;
BEGIN
  
  IF(1=1)THEN
         RAISE E_ERRO  ;
  END IF;
  --não entra mais aqui
  dbms_output.put_line('Nao entrou na exception!');
exception when E_ERRO then
  dbms_output.put_line('Entrou na exeption criada!!!');

END;


------------------------PROCEDURE COM TRATAMENTO DE ERROS, GRAVANDO EM UMA TABELA DE ERROS PARA LOG


select * from erros;

alter table errors
rename to erros;

CREATE OR REPLACE PROCEDURE sp_employee_100_ERROS(P_ID_EMPLOYEE IN NUMBER,
                                                  P_VL_SALARY OUT NUMBER) IS

    CURSOR CUR_RET_SALARY (P_EMPLOYEE_ID NUMER)IS
        SELECT SALARY FROM EMPLOYEES
        WHERE EMPLOYEE_ID = P_EMPLOYEE_ID;
        
    V_SALARY EMPLOYEES.SALARY%TYPE;

    err_num erros.error_id%type;
    err_msg erros.error_msg%type;

BEGIN
    
    UPDATE EMPLOYEES
    SET SALARY = SALARY + 100
    WHERE EMPLOYEE_ID = P_ID_EMPLOYEE;
    
    OPEN CUR_RET_SALARY (P_ID_EMPLOYEE);
    FETCH CUR_RET_SALRY INTO V_SALARY;
    CLOSE CUR_RET_SALARY;
    
    P_VL_SALARY := V_SALARY;


EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado.');
        --recebe o codigo do erro do oracle
        err_num := SQLCODE;
        --salva a mensagem de erro
        err_msg := substr(sqlerrm, 1, 300);
        insert into erros values (err_num, err_msg, 'SP_EMPLOYEE_100_ERROS');
        
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Esse employee_id ja existe.');
        --recebe o codigo do erro do oracle
        err_num := SQLCODE;
        --salva a mensagem de erro
        err_msg := substr(sqlerrm, 1, 300);
        insert into erros values (err_num, err_msg, 'SP_EMPLOYEE_100_ERROS');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocorreu um erro desconhecido.');
        --recebe o codigo do erro do oracle
        err_num := SQLCODE;
        --salva a mensagem de erro
        err_msg := substr(sqlerrm, 1, 300);
        insert into erros values (err_num, err_msg, 'SP_EMPLOYEE_100_ERROS'); 
END;













