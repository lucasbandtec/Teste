create table Funcionario(
	codigo int primary key,
    nome varchar(30),
    salario decimal(30,10),
    sexo char(1),
    dataNasc date,
    codSupervisor int,
    codDepto int
);

alter table Funcionario add foreign key(codDepto) references Departamento(codDepto);
alter table Funcionario add foreign key(codSupervisor) references Funcionario(codigo);

create table Departamento(
	codDepto int primary key,
    nomeDepto varchar(30),
    codGerente int,
    dataInicioGer date
);

alter table Departamento add foreign key(codGerente) references Funcionario(codigo);

create table Projeto(
	codProj int primary key ,
    nomeProj varchar(30),
    localProj varchar(30),
    codDepto int
);

alter table Projeto add foreign key(codDepto) references Departamento(codDepto);

create table TrabalhaEm(
	codFunc int,
    horas decimal(4,2),
    codProj int,
	foreign key (codFunc) references Funcionario(codigo),
    foreign key (codProj) references Projeto(codProj),
    primary key(codFunc,codProj)
);
insert into funcionario values(1,'Joao Silva',3500,'m','1985-01-09',null,null),
								(2,'Fernando Wong',4500,'m','1975-12-08',null,null),
                                (3,'Alice Sousa',2500,'f','1988-01-19',null,null),
                                (4,'Janice Morais',4300,'f','1970-06-20',null,null),
                                (5,'Ronaldo Lima',3800,'m','1982-09-15',null,null),
                                (6,'Joice Leite',2500,'f','1992-07-31',null,null),
                                (7,'Antonio Pereira',2500,'m','1989-03-29',null,null),
                                (8,'Juliano Brito',5500,'m','1957-11-10',Null,null);
                                
insert into Departamento values (105,'Pesquisa',2,'2008-05-22'),
								(104,'Administração',7,'2015-01-01'),
                                (101,'Matriz',8,'2001-06-19');

select * from funcionario;
UPDATE Funcionario SET codSupervisor = 3 where codigo = 7;
update Funcionario set codDepto = 101 where codigo =8;
select * from funcionario;
select * from departamento;
select * from Projeto;
select * from TrabalhaEM;


insert into Projeto values (1,'Produto X','Santo André',105),
							(2,'Produto Y','Itu',105),
                            (3,'Produto Z','São Paulo',105),
                            (10,'Informatização','Mauá',104),
                            (20,'Reorganização','São Paulo',101),
                            (30,'Benefícios','Mauá',104);
                            
insert into TrabalhaEm values (1,32.5,1),
								(1,7.5,2),
                                (5,40.0,3),
                                (6,20.0,1),
                                (6,20.0,2),
                                (2,10.0,2),
                                (2,10.0,3),
                                (2,10.0,10),
                                (2,10.0,20),
                                (3,30.0,30),
                                (3,10.0,10),
                                (7,35.0,10),
                                (7,5.0,30),
                                (4,20.0,30),
                                (4,15.0,20),
                                (8,NULL,20);
                                
insert into Funcionario values(null,'Cecília Ribeiro',2800,'f','1980-04-05',null,104); #--Codigo não pode ser null.

insert into Funcionario values(3,'Alice Sousa',2800,'f','1980-04-05',4,104);   #--Ja existe 

insert into Funcionario values(9,'Cecília Ribeiro',2800,'f','1980-04-05',4,107);  #--Departamento nao existe

insert into Funcionario values(9,'Cecília Ribeiro',2800,'f','1980-04-05',4,104); # Foi

Delete from TrabalhaEM where codFunc = 3 and codProj = 10; #Foi

Delete from Funcionario where codigo =3; #nao foi

delete from funcionario where codigo = 2; #não foi

UPDATE funcionario SET salario = 2800 where codigo = 3; # Foi

UPDATE funcionario SET codDepto = 101 where codigo = 3; #Foi

select * from funcionario;

UPDATE funcionario SET codDepto = 107 where codigo = 3; #codDepto nao existe

select dataNasc,salario from Funcionario where nome = 'João Silva'; #foi

select salario from Funcionario; #Foi

select * from Funcionario where salario != 2500; # Só consigo ver diferente de um valor

select nome from funcionario ; #Foi

select * from funcionario order by salario desc; #Foi


select * from funcionario where salario >= 2000  and salario <= 4000; # foi

select nome,salario from funcionario where nome like 'J%'; #Foi

select nome,salario from funcionario where nome like '%a'; #Foi

select nome,dataNasc from funcionario where nome like '__n%'; #Foi

select nome,dataNasc from funcionario where nome like '%s____'; #Foi

select * from funcionario where codDepto = 105; #Foi

select * from funcionario where codDepto = 105 and salario >=3500; #Foi

select * from funcionario where codDepto = 105 and nome like 'J%';























