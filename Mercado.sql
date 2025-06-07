create database mercado_jose;
 use mercado_jose; 
 
 show databases;
 
create table tbl_cliente (
id int not null primary key auto_increment,
nome varchar (45) not null,
cpf varchar(11) not null,
sexo enum ('M','F') not null,
historico_compras text,
unique index (id)
);

create table tbl_colaborador(

id int not null primary key auto_increment,
nome varchar(45) not null,
funcao varchar(45) not null,
salario varchar (45) not null,
data_admissao date,
unique index (id)
);

create table tbl_email(

id int not null primary key auto_increment,
email varchar (245)not null,
id_cliente int not null,

constraint Fk_cliente_email
foreign key (id_cliente)
references tbl_cliente (id),

unique index (id) 
);

create table tbl_telefone(

id int not null primary key auto_increment,

telefone varchar (15) not null,
id_cliente int not null,

constraint Fk_cliente_telefone
foreign key (id_cliente)
references tbl_cliente (id),

unique index (id) 
);

create table tbl_endereco( 

id int not null primary key auto_increment,

cep varchar(8) not null,
rua varchar(45) not null,
pais varchar (45) not null,
logradouro varchar (45) not null,
estado varchar (45) not null,
id_cliente int not null,

constraint Fk_cliente_endereco
foreign key (id_cliente)
references tbl_cliente (id),

unique index (id) 
);

create table tbl_vendas(

id int not null primary key auto_increment,
numero_vendas varchar(45)not null,
valor_total decimal(10,2)not null,
itens_vendas varchar(45)not null,
cliente varchar(45) not null,
data_hora datetime not null,
id_cliente int not null,

constraint Fk_cliente_vendas
foreign key (id_cliente)
references tbl_cliente (id),

unique index (id) 
);

create table tbl_forma_pagamento(

id int not null primary key auto_increment,
forma_pagamento enum('pix', 'cartão de credito', 'cartão de débito', 'dinheiro', 'ticket alimentação') NOT NULL,
id_vendas int not null,


CONSTRAINT fk_forma_pagamento_vendas
FOREIGN KEY (id_vendas)
REFERENCES tbl_vendas(id),

unique index (id)
);

create table tbl_itens(

id int not null primary key auto_increment,
produtos varchar (45) not null,
valor_unitario decimal(10,2) not null,
quantidade varchar(45),
id_vendas int not null,

CONSTRAINT fk_itens_vendas
FOREIGN KEY (id_vendas)
REFERENCES tbl_vendas(id),

unique index (id)
);

create table tbl_produtos (
id int not null primary key auto_increment,

marca varchar (45) not null,
quantidade_estoque int not null,
preco decimal (10,2) not null,
categoria varchar(45) not null,
codigo varchar(45) not null,
nome varchar (45) not null,
id_itens int not null,
id_colaborador int not null,

constraint fk_produtos_itens
foreign key (id_itens)
references tbl_itens (id),

constraint fk_produtos_colaborador
foreign key (id_colaborador)
references tbl_colaborador (id),

unique index (id)


);

show tables;
