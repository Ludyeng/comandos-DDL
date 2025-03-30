create database exer01_ddl;
use exer01_ddl;
create table editora(
cod_editora int primary key not null  auto_increment,
descricao varchar(45) not null,
endereco varchar(45)
);

create table livro(
cod_livro int primary key not null auto_increment,
isbn varchar(45) not null,
titulo varchar(45) not null,
num_edicao varchar(45),
preco float not null,
editora_cod_editora int not null,
foreign key fk_cod_editora(editora_cod_editora) references editora(cod_editora)
);

create table autor(
cod_autor int primary key not null auto_increment,
nome varchar(45) not null,
sexo char,
data_nascimento date not null
);

create table livro_autor(
cod_livro int not null,
cod_autor int not null,
PRIMARY KEY (cod_livro, cod_autor),
foreign key fk_cod_livro(cod_livro) references livro(cod_livro),
foreign key fk_cod_autor(cod_autor) references autor(cod_autor)
);

ALTER TABLE editora ADD nome varchar(45);
ALTER TABLE autor CHANGE COLUMN sexo sexo varchar(1);
ALTER TABLE livro ADD CONSTRAINT unique_isbn Unique (isbn);
ALTER TABLE livro ALTER COLUMN preco SET DEFAULT 10.00;
ALTER TABLE livro DROP COLUMN num_edicao;
ALTER TABLE livro ADD edição INT;

create table grupo(
cod_grupo int primary key not null auto_increment,
nome varchar(100) not null
);

ALTER TABLE editora ADD column cod_grupo INT;

ALTER TABLE editora ADD CONSTRAINT fk_editora_grupo
FOREIGN KEY (cod_grupo) REFERENCES grupo(cod_grupo) 
ON DELETE SET NULL ON UPDATE CASCADE ;




