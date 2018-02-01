create or replace package PKG_CONTROLE_FUNCIONARIO is

  -- Author  : FERNA
  -- Created : 23/01/2018 14:27:06
  -- Purpose : Criada para foder com os funcion�rios
  
  --definindo uma variavel do tipo record(tipo um array de varios tipos)
  type r_empregados is record(emp_id       employees.employee_id%type,
                              sobrenome    employees.last_name%type,             
                              nome         employees.first_name%type);
  
  procedure sp_salario_dez (id_employee in number, r_salario out number);
  procedure sp_salario_dez (id_employee in number);
  procedure sp_salario_dez (id_employee in number, r_empregado out r_empregados);

end PKG_CONTROLE_FUNCIONARIO;

-------------chamando uma procedure com retorno do tipo record
/
