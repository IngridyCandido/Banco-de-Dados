create table clima (
	cidade varchar (80),
	temp_lo int,
	temp_hi int,
	prcp real,
	data date
);

insert into clima (cidade, temp_lo, temp_hi, prcp, data) values ('Mossoró', -10,15,94.5, current_timestamp);

select * from clima;

create table Produto (
	produto_num integer primary key,
	nome text not null unique,
	preco numeric not null constraint preco_positivo check (preco >0),
	preco_desconto numeric constraint preco_desconto_positivo check (preco_desconto >0),
	constraint desconto_valido check (preco >preco_desconto)
);


insert into produto(produto_num,nome,preco)
values(1,'oreo',4);

select * from produto;

create table Produto (
	produto_num integer primary key,
	nome text,
	preco numeric
);

create table Pedido (
	pedido_num integer primary key,
	produto_num integer references Produto (produto_num),
	qtd integer
);

insert into produto (produto_num, nome, preco, descricao)
values(2,'água',1, 'sem gás');
select*from produto

insert into pedido (pedido_num, produto_num, qtd) 
values (10,2,2);
select*from pedido

alter table Produto add column descricao text check (descricao <>'');

alter table Produto drop column descricao;

alter table Produto add check (nome<>'');

alter table Produto add constraint nome_restricao unique (produto_num);

alter table Produto add foreign key (produto_grupo_id) references produto_grupo (grupoid);

alter table Produto alter column produto_num set not null;

alter table Produto drop constraint nome_restricao;

alter table Produto alter column produto_num drop not null;

alter table Produto alter column preco set default 7.77;

alter table Produto alter column preco drop default 7.77;

alter table Produto alter column preco type numeric;

alter table Produto rename to itens;