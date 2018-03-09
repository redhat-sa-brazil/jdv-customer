--CREATE DATABASE cadastro_cliente OWNER redhat;

create table CADASTRO_CLIENTE (cpf varchar(12),
nome varchar(40),
data_nascimento date,
sexo char(1),
PRIMARY KEY(cpf));


insert into CADASTRO_CLIENTE values ('91982736352', 'MAGALI', to_date('1974-12-25', 'YYYY-MM-DD'), 'F');

insert into CADASTRO_CLIENTE values ('83273638291', 'MONICA DE SOUZA', to_date('1972-05-20', 'YYYY-MM-DD'), 'F');

insert into CADASTRO_CLIENTE values ('09876543210', 'SEO COELHO', to_date('1962-07-31', 'YYYY-MM-DD'), 'M');

insert into CADASTRO_CLIENTE values ('12345678910', 'MOACIR', to_date('1984-01-01', 'YYYY-MM-DD'), 'M');

insert into CADASTRO_CLIENTE values ('83736393921', 'ANA LEIA', to_date('1964-11-02', 'YYYY-MM-DD'), 'F');

insert into CADASTRO_CLIENTE values ('19182837412', 'MARIA DB', to_date('2011-04-27', 'YYYY-MM-DD'), 'F');

insert into CADASTRO_CLIENTE values ('10323769261', 'JULIA', to_date('2001-10-19', 'YYYY-MM-DD'), 'F');

insert into CADASTRO_CLIENTE values ('10293874600', 'JEFERSON', to_date('1988-10-19', 'YYYY-MM-DD'), 'M');

insert into CADASTRO_CLIENTE values ('76500091234', 'JURANDIR', to_date('1998-09-09', 'YYYY-MM-DD'), 'M');

insert into CADASTRO_CLIENTE values ('10165487210', 'ZULEIDE', to_date('1976-06-02', 'YYYY-MM-DD'), 'F');

insert into CADASTRO_CLIENTE values ('13562113382', 'IUGOSMAR', to_date('1899-12-25', 'YYYY-MM-DD'), 'M');

insert into CADASTRO_CLIENTE values ('00319249060', 'ZE LELE', to_date('1963-09-01', 'YYYY-MM-DD'), 'M');
