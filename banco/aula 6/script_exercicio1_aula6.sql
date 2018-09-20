create table aluno(
	ra int primary key,
    nome varchar(30),
    telefone varchar(30),
    email varchar(30),
    hobby varchar(30),
    codemp int,
    codinst int,
    foreign key (codemp) references empresa (codigo),
    foreign key (codinst) references instituicao (codigo)
);

create table empresa(
	codigo int primary key,
    nome varchar(30),
    representante varchar(30)
);

create table instituicao(
	codigo int primary key,
    nome varchar(30),
    bairro varchar(30)
);
