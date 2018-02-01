create or replace procedure sp_auditoria(n_usuario varchar2) as
begin
    insert into auditoria (nome_user)
    values (n_usuario);
end sp_auditoria;
/
