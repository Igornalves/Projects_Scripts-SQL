create database db_contabilidade;
use db_contabilidade;

/Passo I/
create table empresa(
  idemp int primary key,
  empresa varchar(80),
  datcad date 
);

insert into empresa
values(1,'Contabilidade Certa','2024-03-22');

Select * from empresa;

/Passo II/
create table filial(
  idfil int primary key,
  idemp int,
  filial varchar(80),
  constraint fk_empresa foreign key 
  (idemp) references empresa (idemp)
);

insert into filial
values (1,1,'Caxias'),
       (2,1,'Codó'),
       (3,1,'Timon'),
       (4,1,'Teresina');
      
select * from filial;

/Passo III/
create table cargo(
  idcar int primary key,
  cargo varchar(50)
);    

insert into cargo
values(1,'Gerente Administrativo'),
      (2,'Gerente Financeiro'),
      (3, 'Gerente'),(4, 'Vendedor'),
      (5,'Segurança'),(6, 'Professor'),
      (7,'Coordenador'),
      (8, 'Supervisor Almoxarifado'),
      (9, 'Supervisor Marketing'),
      (10,'Caixa');
     
 select * from cargo;  
 
 /Passo IV/
 create table funcionario(
  mat int primary key,
  colaborador varchar(80),
  sexo char(1),
  cpf char(11),
  idcar int,
  idemp int,
  idfil int, 
  admissao date,
  datnas date,
  salario float,
  constraint fk_emp_id foreign key (idemp) references empresa (idemp),
  constraint fk_cargo_id foreign key (idcar) references cargo (idcar),
  constraint fk_fil_id foreign key (idfil) references filial (idfil)
 );

 insert into funcionario
 values(1, 'Jose Maria','M','132165616',1,1,1,'2005-01-02','1990-01-01',800),
      (2, 'Francisco Jose','M','132165610',1,1,2,'2004-01-01','1985-01-01',2000),
      (3, 'Mario Joao','M','132165600',10,1,1,'2005-05-02','1988-01-01',800),
      (4, 'Maria das Graças','F','132165123',1,1,2,'2012-07-02','1986-01-01',2500),
      (5, 'Maria de Loudes','F','132165000',10,1,2,'2014-03-01','1994-01-01',900),
      (6, 'João Lucas','M','132163215',5,1,3,'2014-05-10','1993-01-01',1500),
      (7, 'Thiago Costa','M','132100000',3,1,3,'2014-10-15','1992-01-01',1600),
      (8, 'Maria de Jesus','F','132165555',9,1,3,'2014-08-05','1984-01-01',2100),
      (9, 'Marinalva Brito','F','132166666',3,1,1,'2010-08-05','1984-01-04',1000),
      (10, 'Cristiane Carvalho','F','13213333',4,1,2,'2012-05-05','1992-11-11',1800),
      (11, 'Maria Alice','F','13214444',4,1,4,'2023-01-02','2000-10-01',4800);
      
select * from funcionario;
    
/Passo V/
create table eventos(
   ideve int primary key,
   evento varchar(80),
   tipoeve char(1)
);    

insert into eventos
values (1,'Hora Extra','P'), (2,'Comissão','P'),(3,'Salario-familia','P'),
       (4,'Decimo-terceiro','P'),(5,'Adicional Noturno','P'),(6,'INSS','D'),
       (7,'Falta Não Justificada','D'),(8,'Atraso não Justificado','D'),
       (9,'Contribuição Sindical','D'),(10, 'FGTS','P'), (11,'Gratificação','P'); 

select * from eventos;       

      
/Passo VI/
create table contracheque (
idCch int primary key,
idemp int,
mat int,
ideve int,
competencia date,
quantidade int,
valorEvento float,
operacao char(2),
constraint fk_mat foreign key (mat) references funcionario(mat),
constraint fk_eve_id foreign key (ideve) references eventos(ideve)
);

select * from contracheque; 

insert into contracheque 
values (1,1,1,2,'2023-10-15',5,15,'+'),(2,1,10,2,'2023-10-22',7,22,'+'),(3,1,7,7,'2023-10-27',1,15,'-'),
(4,1,9,10,'2023-10-22',1,168,'-'),(5,1,2,8,'2023-10-15',1,30,'-'),(6,1,3,3,'2023-10-27',3,26.2,'+'),
(7,1,4,1,'2023-10-22',2,30,'+'),(8,1,5,7,'2023-10-27',1,15,'-'),(9,1,8,6,'2023-10-22',1,144,'-'),
(10,1,8,11,'2023-10-22',1,144,'+'),(11,1,6,4,'2023-10-12',2,1126.2,'+'),(12,1,6,6,'2023-10-12',2,16.2,'-'),
(13,1,1,4,'2023-10-15',5,1500.00,'+'),(14,1,1,6,'2023-10-15',5,15,'-'),(15,1,10,4,'2023-10-22',7,1122.00,'+'),
(16,1,10,6,'2023-10-22',7,122,'-'),(17,1,7,4,'2023-10-27',1,1500.00,'+'),(18,1,7,6,'2023-10-27',1,150,'-'),
(19,1,9,11,'2023-10-22',1,680,'+');    

select * from contracheque;
select * from eventos;  
Select * from empresa;
select * from funcionario;
select * from filial;

-- implementando uma consulta SQL que seja capaz de lista o codigo e nome da empresa 

select idemp,empresa from empresa;

-- implementando uma consulta que seja capaz de listar data de nascimento e cpf e fazer um calculo subtraido tais dados e depois dividindo por 365 e vendo se o resultado e menor que de 18 anos 

select datnas,cpf 
from funcionario 
where (admissao - datnas)/365 > 18 ; 

-- implementando uma consulta que seja capaz de lista um ID da empresa, nomeda empresa, id filial enome da filial 

SELECT 
	e.idemp, 
	e.empresa, 
	f.idfil, 
	f.filial
FROM 
	empresa e, 
	filial f
where 
	e.idemp = f.idemp;

-- implemente uma consulta que traga uma consulta com o nome da empresa e da filial onde a filial cuja seja codo 

select 
	e.empresa, 
 	f.filial   
from 
	empresa as e, 
	filial as f
where 
	f.filial = 'codo';

-- consulte usando um codigo SQL que seja capaz de listar a matricula, nome do funcionario, cpf, cargo e salario

select 
	f.mat, 
	f.colaborador, 
	f.cpf, 
	c.idcar, 
	f.salario
From 
	funcionario as f, cargo as c 
where 
	f.idcar = c.idcar;

-- consulte um codigo SQL que liste a data de nascimento, o cargo e o salario onde salario seja no intevalo de 1000 ou 3000 reais 

select 
	f.datnas, 
	c.cargo,  
	f.salario
From 
	funcionario as f, 
	cargo as c 
where 
	c.idcar = f.idcar 
and 
	f.salario between 1000 and 3000
order by 
	f.salario desc;

-- elabore uma consulta SQL para listar 
-- o nome da empresa
-- o nome da afilial 
-- o nome do funcionario 
-- o nome do cargo que estao lotados na filial de teresina 

select e.empresa, f.filial,fun.colaborador ,c.cargo
from funcionario as fun
inner join filial as f on f.idfil  = fun.idfil
inner join empresa as e on e.idemp = fun.idemp 
inner join cargo as c on c.idcar = fun.idcar 
where f.filial = 'Teresina';
  
-- a coordenacao do setor comercial solicitou uma planilia excel que contem as seguintes informacoes 
-- o valor total pago de salario para os cargos de gerencia 
-- ordenado no valor decresente 

select c.cargo ,sum(c2.quantidade*c2.valorEvento)as valorSalario from funcionario f 
inner join cargo c on c.idcar = f.idcar 
inner join contracheque c2 on c2.mat = f.mat 
where c.cargo Like '%Gerente%'
group by c.cargo
order by valorSalario;

select * from contracheque c 

select * from funcionario f 

select * from cargo c 





