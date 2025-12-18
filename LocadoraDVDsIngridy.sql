create table cliente(
	cliente_id serial primary key ,
	loja_id integer references loja (loja_id),
	nome text,
	sobrenome text,
	email text,
	endereco_id serial,
	ativo boolean,
	data_criacao date,
	ultima_atualizacao date	
);

create table loja (
	loja_id serial primary key,
	endereco_id integer references endereco (endereco_id),
	ultima_atualizacao date 
);

create table funcionario (
	funcionario_id serial primary key,
	nome text,
	sobrenome text,
	endereco_id serial,
	email text,
	ativo boolean,
	loja_id integer references loja (loja_id),
	gerente boolean,
	login text,
	senha text,
	ultima_atualizacao date,
	foto bytea
);

create table pagamento (
	pagamento_id serial primary key,
	funcionario_id integer references funcionario (funcionario_id),
	cliente_id integer references cliente (cliente_id),
	aluguel_id integer references aluguel (aluguel_id),
	valor serial,
	data_pagamento date
);

create table aluguel (
	aluguel_id serial primary key,
	funcionario_id integer references funcionario (funcionario_id),
	cliente_id integer references cliente (cliente_id),
	data_aluguel date,
	data_retorno date,
	inventario_id serial,
	ultima_atualizacao date
);

create table pais (
	pais_id serial primary key,
	pais text,
	ultima_atualizacao date 
);

create table cidade (
	cidade_id serial primary key,
	cidade text,
	pais_id integer references pais (pais_id),
	ultima_atualizacao date 
);

create table endereco (
	endereco_id serial primary key,
	endereco text,
	endereco2 text,
	bairro text,
	cidade_id integer references cidade (cidade_id),
	cep text,
	telefone text,
	ultima_atualizacao date 
);

create table inventario (
	inventario_id serial primary key,
	filme_id integer references filme (filme_id),
	loja_id integer references loja (loja_id),
	ultima_atualizacao date 
);

create table filme (
	filme_id serial primary key,
	titulo text,
	descricao text,
	ano_lancamento date,
	idioma serial,
	duracao_aluguel serial,
	taxa_aluguel serial,
	tamanho serial, 
	custo_reposicao serial,
	taxa serial,
	ultima_atualizacao date,
	caracteristicas_especiais text
);

create table idioma (
	idioma_id serial primary key,
	nome text,
	ultima_atualizacao date 
);


create table ator_filme (
	filme_id integer references filme (filme_id),
	ator_id integer references ator (ator_id),
	ultima_atualizacao date 
);

create table ator (
	ator_id serial primary key,
	nome text,
	sobrenome text,
	ultima_atualizacao date 
);

create table categoria_filme (
	filme_id integer references filme (filme_id),
	categoria_id integer references categoria (categoria_id),
	ultima_atualizacao date 
);

create table categoria (
	categoria_id serial primary key,
	nome text,
	ultima_atualizacao date 
);

alter table filme add check (taxa_aluguel<=0);

alter table filme add check (custo_reposicao<=0);

alter table filme add check (taxa<=0);

alter table filme alter column titulo set not null;

alter table filme alter column ano_lancamento set not null;

alter table filme alter column taxa_aluguel set not null;

alter table filme alter column tamanho set not null;

alter table filme alter column custo_reposicao set not null;

alter table filme alter column idioma_id set not null;

alter table filme alter column taxa set not null;

alter table idioma alter column nome set not null;

alter table ator alter column nome set not null;

alter table ator alter column sobrenome set not null;

alter table categoria alter column nome set not null;

alter table aluguel alter column data_aluguel set not null;

alter table aluguel alter column data_retorno set not null;

alter table aluguel alter foreign key set not null;
