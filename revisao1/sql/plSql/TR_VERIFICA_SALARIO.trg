﻿create or replace trigger TR_VERIFICA_SALARIO --DECLARA��O DA TRIGGER
    after update of salary on employees --INFORMANDO QUE SER� EXECUTADA DEPOIS DO UPDATE DO CAMPO SALARIO DA TABELA EMPLOYEES
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
       RAISE_APPLICATION_ERROR(-20002, 'ERRO: Salario maior que 10%'); --JOGA UM ERRO NA TELA, COM O NUMERO E A MENSAGEM EXPECIFICADA
   WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20002, 'Ocorreu um erro durante a execucao! ERRO: '||sqlerrm);

END TR_VERIFICA_SALARIO;
/
