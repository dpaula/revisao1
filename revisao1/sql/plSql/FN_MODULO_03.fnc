create or replace function FN_MODULO_03(F_NAME IN VARCHAR2) return number is
  v_numero number;
begin
  v_numero := 10;  

  return v_numero;

EXCEPTION WHEN OTHERS   THEN
  NULL;

end FN_MODULO_03;
/
