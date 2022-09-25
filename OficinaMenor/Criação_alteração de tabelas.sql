CREATE SCHEMA oficinamenor;
use oficinamenor;

create table cliente (
	idcliente int auto_increment not null,
    cpf varchar(11),
    rg varchar(11),
    pgto varchar(16),
    constraint pk_cliente primary key (idcliente)
);

create table veiculo_os (
	idveiculo int auto_increment not null primary key,
    idcliente int,
    placa varchar(7) unique,
    modelo varchar(45),
    ano year(4),
    pneus varchar(10),
    freios varchar(10),
	foreign key (idcliente) references cliente(idcliente)
);

create table servico (
	idservico int auto_increment not null primary key,
    idcliente int,
    tipo_serv varchar(15),
    descricao varchar(255),
    foreign key (idcliente) references cliente(idcliente)
);

create table equipe (
	idequipe int auto_increment not null primary key,
    idservico int,
    qtd_func int,
    especialidade varchar(30),
    foreign key (idservico) references servico(idservico)
);

create table pgto (
	idpgto int auto_increment not null primary key,
    idservico int,
    idorcamento int,
    idcliente int,
    valor float,
    foreign key (idservico) references servico(idservico),
    foreign key (idcliente) references cliente(idcliente)
    
);

alter table pgto
add foreign key (idorcamento) references orcamento(idorcamento);

create table orcamento (
	idorcamento int auto_increment not null primary key,
    descricao varchar(80)
);