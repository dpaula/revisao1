

create table marca
(
    id_marca number(7),
    nome_marca varchar2(120) not null unique,
    ativo char(1) not null,
    constraint pk_id_marca primary key (id_marca),
    constraint marca_ativo check(ativo in(upper('s'), upper('n')))
);

alter table marca
drop constraint marca_ativo;

alter table marca
add constraint marca_ativo check(ativo in ('s','S','n','N'));

create sequence seq_id_marca
    start with      100
    increment by    10
    maxvalue        9999999
    nocycle
    nocache;


create table modelo
(
    id_marca number(7) not null,
    id_modelo number(7) not null,
    nome_modelo varchar2(120) not null unique,
    ativo char(1),
    constraint modelo_ativo check(ativo in('s','S','n','N')),
    constraint fk_modelo_marca foreign key (id_marca)
    references marca(id_marca),
    constraint pk_id_modelo primary key (id_modelo)
);

alter table modelo
drop constraint pk_id_modelo;

alter table modelo
add constraint pk_modelo primary key (id_marca, id_modelo); 


create table versao
(
    id_marca number(7) not null,
    id_modelo number(7) not null,
    id_versao number(7) not null,
    nome_versao varchar2(120) not null,
    ativo char(1),
    constraint versao_ativo check(ativo in('S','N','s','n')),
    constraint fk_versao_marca foreign key (id_marca)
        references marca(id_marca),
    constraint fk_versao_modelo foreign key (id_marca, id_modelo)
        references modelo(id_marca, id_modelo),
    constraint pk_id_versao primary key (id_marca, id_modelo, id_versao)
);




insert into marca (id_marca, nome_marca, ativo)
values (SEQ_ID_MARCA.NEXTVAL, 'Fiat', 'N');

INSERT INTO MODELO (id_marca, id_modelo, nome_modelo, ativo)
values (100, 1, 'Uno', 'N');



SELECT * FROM MARCA;

DELETE FROM MARCA 
WHERE ID_MARCA = 1;

---------------------------------



CREATE OR REPLACE PROCEDURE SP_INSERIR_MARCA_VEICULO(n_marca marca.nome_marca%type) is

    v_id_marca marca.id_marca%type;
    
    function existe_marca(v_nome_marca marca.nome_marca%type) return boolean is
        v_count number;
    begin
        v_count :=0;
    
        select count(*) 
        into v_count
        from marca
        where upper(nome_marca) = upper(v_nome_marca);
        
        if(v_count = 0) then
            return false;
        else
            return true;
        end if;
        
    end existe_marca;
    
    function retorna_id_objeto(nome_objeto varchar2, tipo_objeto varchar2) return number is
    
        v_sql_query1 varchar(200);
        v_sql_query2 varchar(200);
        v_sql_query3 varchar(200);
        v_id_objeto number(7);
        
    begin
        v_sql_query1 := 'select id_';
        v_sql_query2 := ' from ';
        v_sql_query3 := ' where upper(:nome_objeto) = upper(:nome_objeto)';
        --v_sql_query4 := 'select id_:
        
        --if(tipo_objeto = 'marca') then
            execute immediate v_sql_query4||tipo_objeto||v_sql_query2||tipo_objeto||v_sql_query3
            into v_id_objeto
            using nome_objeto;
        
        return v_id_objeto;
    
    end retorna_id_objeto;

BEGIN

    if (existe_marca(n_marca)) then

        SELECT id_marca
        into v_id_marca
        FROM MARCA 
        WHERE UPPER(NOME_MARCA) = UPPER(n_marca);
        dbms_output.put_line('Marca '||n_marca||' Já existe na base de dados!');
        dbms_output.put_line(retorna_id_objeto(n_marca,'marca'));
    else
        
        execute immediate 'insert into marca (id_marca, nome_marca, ativo)
                                    values  (seq_id_marca.nextval, :n_marca, ''N'')'
        using n_marca;
        dbms_output.put_line('Marca '||n_marca||' inserido com sucesso!');
        
    end if; 

END SP_INSERIR_MARCA_VEICULO;


BEGIN
    SP_INSERIR_MARCA_VEICULO('GM', 'Prisma');
    SP_INSERIR_MARCA_VEICULO('Gm', 'Cruze');
    SP_INSERIR_MARCA_VEICULO('Gm', 'Onix');
end;

select id_marca from marca where upper(:nome_objeto) = upper(:nome_objeto)

SELECT * FROM MARCA;



select count(*) from versao

select * from modelo
select * from marca



declare
      v_id_modelo modelo.id_modelo%type;
      v_id_marca marca.id_marca%type;
      vv number;
begin
        v_id_marca := 3;
        
        execute immediate 'select max(id_modelo) from modelo 
                            where id_marca = :v_id_marca'
        into v_id_modelo
        using v_id_marca;
        
        vv := nvl(v_id_modelo, 0) + 1;
        
        dbms_output.put_line(vv);
end;

select max(id_modelo) from modelo 
where id_marca = 3;


create or replace procedure sp_inserir_modelo(p_id_marca marca.id_marca%type,
                                              p_id_modelo modelo.id_modelo%type,
                                              p_nome_modelo modelo.nome_modelo%type) is

begin

    execute immediate 'insert into modelo (id_marca, id_modelo, nome_modelo, ativo)
                                    values (:p_id_marca, :p_id_modelo, :p_nome_modelo, ''N'')'
    using p_id_marca, p_id_modelo, p_nome_modelo;

end sp_inserir_modelo;

create or replace procedure sp_inserir_marca(p_id_marca marca.id_marca%type,
                                              p_nome_marca marca.nome_marca%type) is

begin

    execute immediate 'insert into marca (id_marca, nome_marca, ativo)
                                    values (:p_id_marca, :p_nome_marca, ''N'')'
    using p_id_marca, p_nome_marca;

end sp_inserir_marca;
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              

