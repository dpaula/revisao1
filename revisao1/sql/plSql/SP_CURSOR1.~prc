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
/
