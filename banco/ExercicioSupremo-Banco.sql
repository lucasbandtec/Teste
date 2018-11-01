create table Funcionario(
	codigo int primary key,
    nome varchar(30),
    salario decimal(10,2),
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
UPDATE Funcionario SET codSupervisor = 2 where codigo = 1;
UPDATE Funcionario SET codSupervisor = 8 where codigo = 2;
UPDATE Funcionario SET codSupervisor = 7 where codigo = 3;
UPDATE Funcionario SET codSupervisor = 8 where codigo = 4;
UPDATE Funcionario SET codSupervisor = 1 where codigo = 5;
UPDATE Funcionario SET codSupervisor = 1 where codigo = 6;
                                
update Funcionario set codDepto = 101 where codigo =8;
update Funcionario set codDepto = 104 where codigo =7;
update Funcionario set codDepto = 105 where codigo =6;
update Funcionario set codDepto = 105 where codigo =5;
update Funcionario set codDepto = 104 where codigo =4;
update Funcionario set codDepto = 104 where codigo =3;
update Funcionario set codDepto = 105 where codigo =2;
update Funcionario set codDepto = 105 where codigo =1;

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
                                
insert into Funcionario values(null,'Cecília Ribeiro',2800,'f','1980-04-05',null,104); #--Chave primaria nao pode ser null

insert into Funcionario values(3,'Alice Sousa',2800,'f','1980-04-05',4,104);   #--Ja existe 

insert into Funcionario values(9,'Cecília Ribeiro',2800,'f','1980-04-05',4,107);  #--Departamento nao existe

insert into Funcionario values(9,'Cecília Ribeiro',2800,'f','1980-04-05',4,104); # Foi

Delete from TrabalhaEM where codFunc = 3 and codProj = 10; #Foi

Delete from Funcionario where codigo =3; #A tabela trabalhaem depende desse funcionario com codigo = 3

delete from funcionario where codigo = 2; #existe registros que dependem deste funcionario com codigo = 2

UPDATE funcionario SET salario = 2800 where codigo = 3; # Foi

UPDATE funcionario SET codDepto = 101 where codigo = 3; #Foi

select * from funcionario;

UPDATE funcionario SET codDepto = 107 where codigo = 3; #codDepto nao existe

select dataNasc,salario from Funcionario where nome = 'João Silva'; #foi

select salario from Funcionario; #Foi

#Os dois a baixo sao equivalentes: 
select distinct salario from Funcionario; # com distinct consigo ver todos diferentes
select * from Funcionario where salario != 2500; # Só consigo ver diferente de um valor

select nome from funcionario ; #Foi

select * from funcionario order by salario desc; #Foi

#Os dois a baixo sao equivalentes: 
select * from funcionario where salario >= 2000  and salario <= 4000; # foi
select * from Funcionario where salario between 2000 and 4000; #between é o mesmo que ENTRE

select nome,salario from funcionario where nome like 'J%'; #Foi

select nome,salario from funcionario where nome like '%a'; #Foi

select nome,dataNasc from funcionario where nome like '__n%'; #Foi

select nome,dataNasc from funcionario where nome like '%s____'; #Foi

select * from funcionario where codDepto = 105; #Foi

select * from funcionario where codDepto = 105 and salario >=3500; #Foi

select * from funcionario where codDepto = 105 and nome like 'J%';

#Os tres a baixo são equivalentes
select * from Funcionario,Departamento 
					where Funcionario.codDepto= Departamento.codDepto and nomeDepto = 'Pesquisa';
select Funcionario.* from Funcionario,Departamento 
			where Funcionario.codDepto= Departamento.codDepto and nomeDepto = 'Pesquisa'; #para mostrar apenas a tabela funcionario
select f.* from Funcionario as f,Departamento as d
			where f.codDepto= d.codDepto and nomeDepto = 'Pesquisa'; #Para nomear cada tabela, APENAS nesse comando

select * from Funcionario where codDepto = (select codDepto from Departamento 
												where nomeDepto = 'Pesquisa'); #subconsulta (Quando nao sei qual é o codDepto)
                           
select * from Funcionario where codDepto = (select codDepto from Departamento 
												where nomeDepto = 'Pesquisa')
									and salario > '3500';
                                    
select * from Funcionario where codDepto = (select codDepto from Departamento 
												where nomeDepto = 'Pesquisa')
									and nome like 'J%';
                                    
select f.codigo,s.nome,s.codigo as codSupervisor,s.nome as NomeSupervisor 
						from Funcionario as f, Funcionario as s where f.codSupervisor = s.codigo
                        order by nomeSupervisor;             


select codProj, p.codDepto, f.nome, f.dataNasc from Projeto as p, Departamento as d,Funcionario as f 
										where p.codDepto = d.codDepto and
                                        d.codGerente = f.codigo and
                                        localProj = 'São Paulo';

select codigo,nome,p.codProj,nomeProj,horas from Funcionario as f,Projeto as p,TrabalhaEm as t
											where f.codigo = t.codFunc and p.codProj = t.codProj;

update Funcionario set salario = salario * 1.10
		where codDepto = (select codDepto from Departamento where nomeDepto = 'Pesquisa');
        
select * from Funcionario;

select count(distinct salario) as QuantidadeSalarioDistintos from Funcionario;

select count(distinct localProj) as QuantidadeLocaisDistintos from Projeto;

select avg(salario) as MediaSalario, sum(salario) as TotalSalario from Funcionario; #soma e media do salario 

select min(salario) as MenorSalario, max(salario) MaiorSalario from Funcionario; # minimo e maximo do salario

select count(sexo) as QuantidadeMulheres from Funcionario where sexo = 'f'; #Quantidade de mulheres funcionarias

select sum(salario) as TotalSalario from Funcionario group by codDepto; #fazer a soma de todos, agrupado por departamento

select min(salario) as MenorSalario,max(salario) as MaiorSalario,codDepto 
										from Funcionario group by codDepto;  #Menor e maior salario agrupado pelo codDepto

select * from Funcionario as f,Departamento as d where f.codDepto = d.codDepto; 

select * from Funcionario as f join Departamento as d on f.codDepto = d.codDepto;  #comando join para ver as duas tabelas 

select * from Funcionario as f join Departamento as d on f.codDepto = d.codDepto where sexo = 'm'; #Para ver todos funcionarios com sexo masculino

select * from Funcionario as f join Departamento as d on f.codDepto = d.codDepto where sexo = 'm' and salario > 3000; #Todos masculino com salario 3000+

select codigo,nome,p.codProj,nomeProj,horas from Funcionario as f join TrabalhaEm as t on f.codigo = t.codFunc 
																join Projeto as p on p.codProj = t.codProj; 

insert into Funcionario values (10,'José da Silva',1800,'m','2000-10-12',3,null),
								(11,'Benedito de Almeida',1200,'m','2001-09-01',5,null);
                                
insert into Departamento values (110,'RH',3,'2018-11-10');

select * from Funcionario;

#inner join só traz oque tem em comum nas duas tabelas 
#Left Joins  ou right join traz tudo oque é comum nas duas tabelas e mais oq esta no lado especificado 

select * from Funcionario as f right join Departamento as d on f.codDepto = d.codDepto;   

