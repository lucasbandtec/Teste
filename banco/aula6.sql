create table Aluno (
codigo int primary key auto_increment,
nome varchar(30),
ra varchar(30),
telefone varchar(11),
email varchar(30),
hobby varchar(50),
inst_origem varchar(50),
empresa_inte varchar(50)
);
create table inst_origem (
codigo int primary key auto_increment,
nome varchar(30),
bairro varchar (30)
);
create table empresa_inte (
codigo int primary key auto_increment,
nome varchar(30),
representante varchar(30)
);
insert into Aluno(nome,ra,telefone,email,hobby,inst_origem,empresa_inte)
	   values ('lucas',1,11982400193,'lucas321','correr','nenhuma','c6bank'),
			  ('juliana',2,20290220,'juliana321','nadar','etec','totvs'),
              ('joao',3,92299212,'joao123','voar','ios','acesstage'),
              ('maria',4,298298292,'maria123','voar','etec','c6bank'),
              ('jose',5,93762232,'jose432','jogar','nenhuma','cateno'),
              ('marta',6,4397694,'marta246','correr','ios','cateno');
select * from Aluno;

insert into inst_origem(nome,bairro)
	   values ('nenhuma','lugar_nenhum'),
			  ('etec','rua_da_etec'),
              ('ios','rua_da_ios');
insert into empresa_inte (nome,representante)
	   values ('c6bank','julia'),
			  ('totvs','rafael'),
              ('acesstage','daniel'),
              ('cateno','josefa');
              
select * from inst_origem;

select * from empresa_inte;
