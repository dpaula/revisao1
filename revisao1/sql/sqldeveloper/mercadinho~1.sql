
--criando uma SEQUENCE, que inicia em 1 e vai até 999, e incrementa 1 em 1
create sequence sequence_cidade MINVALUE 1 MAXVALUE 999 increment by 1;



create trigger trigger_cidade before insert on "CIDADE"
for each row
begin
    select "SEQUENCE_CIDADE".nextval into:new.ci_codigo
    from dual;
end;

delete from cidade;

insert into cidade (ci_nome) values ('Blumenau');
insert into cidade (ci_nome) values ('Rio de Janeiro');
insert into cidade (ci_nome) values ('São Paulo');
insert into cidade (ci_nome) values ('Balneário Camboriú');
insert into cidade (ci_nome) values ('Rio das Ostras');
insert into cidade (ci_nome) values ('Curitiba');



select * from cidade