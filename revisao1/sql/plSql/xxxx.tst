PL/SQL Developer Test script 3.0
6
DECLARE
       v_numero number; --declara��o de variaveis
BEGIN
       v_numero := fn_modulo_03('teste'); --atribuindo retorno da fun��o a variavel
       dbms_output.put_line(v_numero); --imprimindo..
END;
0
2
v_numero
