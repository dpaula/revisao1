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
/
