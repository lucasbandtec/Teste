create table Funcionario(
	codFuncionario int primary key auto_increment,
    NmFuncionario varchar(30),
    vlrSalario numeric,
    sxFuncionario char(1),
    dtNascimento date,
    fkSupervisor int ,
    fkDepto int,
    fkFunc int
);

create table Departamento(
	codDepto int primary key auto_increment,
    nmDepto varchar(30),
    dtGerente date,
    fkGerente int
);

create table Projeto(
	codProjeto int primary key auto_increment,
	nmProjeto varchar(30),
    locProjeto varchar(30),
    fkDepto int
);

create table TrabalhaEm(
	codFunc int primary key auto_increment,
    hrFunc decimal(10,5),
    fkProjeto int
);