
CREATE TABLE DRIVER
(
    id_driver number(7) not null,
    nome varchar2(200) not null unique,
    constraint pk_id_driver primary key (id_driver)
);

alter table driver
add nome varchar2(200) not null unique;

insert into driver (id_driver, nome)
values (110, 'Fernando de Paula');

CREATE TABLE VEICULO
(
    id_veiculo number(7) not null,
    marca varchar2(30) not null,
    modelo varchar2(30) not null,
    valor_depre number,
    ano date,
    constraint pk_id_veiculo primary key (id_veiculo)
);

alter table veiculo
modify ano varchar2(4);

insert into veiculo (id_veiculo, marca, modelo, valor_depre, ano)
values (10, 'Ford', 'Focus', 0.22, '2015');

CREATE TABLE CORRIDA
(
    id_corrida number(7) not null,
    id_driver number(7) not null,
    id_veiculo number(7) not null,
    distancia_perc number(10),
    autonomia number(2,2),
    dia_corrida date,
    ganho_bruto_dia number(4,2),
    horas_trab number(2,1),
    constraint pk_id_corrida primary key (id_corrida),
    constraint fk_corrida_driver foreign key (id_driver)
        references driver(id_driver),
    constraint fk_corrida_veiculo foreign key (id_veiculo)
        references veiculo(id_veiculo)
);

alter table corrida
modify autonomia number(4,2);

create sequence sq_corrida
    start with      1
    increment by    1
    maxvalue        9999999
    nocycle
    nocache;

insert into corrida (id_corrida, id_driver, id_veiculo, 
distancia_perc, autonomia, dia_corrida, ganho_bruto_dia, horas_trab)
values (sq_corrida.nextval, 110, 10, 
67, 9.3, '17/01/2018', 67.15, 1.5);

update corrida
set horas_trab = 4.5
where DIA_CORRIDA = '16/01/2018';

insert into corrida (id_corrida, id_driver, id_veiculo, 
distancia_perc, autonomia, dia_corrida, ganho_bruto_dia, horas_trab)
values (sq_corrida.nextval, 110, 10, 
203, 12, '18/01/2018', 141.26, 6); 

insert into corrida (id_corrida, id_driver, id_veiculo, 
distancia_perc, autonomia, dia_corrida, ganho_bruto_dia, horas_trab)
values (sq_corrida.nextval, 110, 10, 
80, 10.8, '19/01/2018', 59.3, 2.5); 

insert into corrida (id_corrida, id_driver, id_veiculo, 
distancia_perc, autonomia, dia_corrida, ganho_bruto_dia, horas_trab)
values (sq_corrida.nextval, 110, 10, 
53, 6.8, '22/01/2018', 80.18, 3.5); 

insert into corrida (id_corrida, id_driver, id_veiculo, 
distancia_perc, autonomia, dia_corrida, ganho_bruto_dia, horas_trab)
values (sq_corrida.nextval, 110, 10, 
45, 9.4, '23/01/2018', 58.88, 2); 

insert into corrida (id_corrida, id_driver, id_veiculo, 
distancia_perc, autonomia, dia_corrida, ganho_bruto_dia, horas_trab)
values (sq_corrida.nextval, 110, 10, 
111, 8.8, '24/01/2018', 126.17, 5.5); 

select * from CORRIDA