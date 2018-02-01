create or replace package PKG_CONTROLE_FUNCIONARIO is

  -- Author  : FERNA
  -- Created : 23/01/2018 14:27:06
  -- Purpose : Criada para foder com os funcionários
  
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
create or replace package body PKG_CONTROLE_FUNCIONARIO is

    --PROCEDURES 1
    procedure sp_salario_dez (id_employee in number,
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

    end sp_salario_dez;
    
    
     --PROCEDURE 2    
     procedure sp_salario_dez (id_employee in number) is

        v_salario employees.salary%type;
        v_salario2 employees.salary%type;
        v_employee_id employees.employee_id%type;

        cursor cur_ret_salarios (id_employee_c number) is
        select salary, hire_date, employee_id from employees
        where employee_id = id_employee_c;
        
        DATA_ADD DATE;

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
        fetch cur_ret_salarios into v_salario, data_add, v_employee_id;
        close cur_ret_salarios;
        
        --chamando uma procedure externa
        sp_cursor1(data_add);
        
        if(salario_maior_dez_mil(v_salario)) then
            dbms_output.put_line('Salario maior q 10000, valor: '||v_salario);
            v_salario := v_salario * 1.15;
        else
            dbms_output.put_line('Salario menor q 10000, valor: '||v_salario);
            v_salario := v_salario * 1.5;
        end if;
        
        sp_salario_dez(v_employee_id, v_salario2);
        dbms_output.put_line('CHAMADA 2 '||v_salario2);
        
        
    exception when others then
        dbms_output.put_line('Ocorreu um erro desconhecido erro: '||sqlerrm);

    end sp_salario_dez;
    
    -------
    --PROCEDURES 3
    procedure sp_salario_dez (id_employee in number,
                              r_empregado out r_empregados) is

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

        select employee_id, last_name, first_name
        into r_empregado
        from employees
        where employee_id = id_employee;
                
    exception when others then
        dbms_output.put_line('Ocorreu um erro desconhecido erro: '||sqlerrm);

    end sp_salario_dez;
    
end PKG_CONTROLE_FUNCIONARIO;
/
