create database exercicio2_ddl;
Use exercicio2_ddl;

create table conta(
num_conta varchar(7) primary key not null,
saldo float not null,
tipo_conta int not null,
num_agencia int not null
);

ALTER TABLE cliente RENAME TO conta;

create table cliente (
cpf varchar(14) primary key not null,
nome varchar(45) not null,
endereco varchar(100) not null,
sexo char(1)
);


create table banco(
codigo int primary key not null auto_increment,
nome varchar(45) not null
);

create table agencia(
num_agencia int primary key not null,
cod_banco int not null,
foreign key (cod_banco) references banco (codigo),
endereco_agencia varchar(100)
);

create table telefone_cliente(
cpf_cliente varchar(14) not null,
foreign key (cpf_cliente) references cliente (cpf),
telefone varchar(20) primary key not null
);

create table historico (
cpf varchar(14) not null,
foreign key (cpf) references cliente (cpf),
num_conta varchar(7) not null,
foreign key (num_conta) references conta (num_conta),
data_inicio date not null
);

ALTER TABLE historico ADD COLUMN data_inicio DATE NOT NULL;

INSERT INTO banco (codigo, nome)
values 
('1', 'Banco do Brasil'),
('4', 'CEF');

INSERT INTO agencia (num_agencia, cod_banco, endereco_agencia)
VALUES
(0562, 4, 'Rua: Joaquim Teixeira Alves, 1555'),
(3153, 1 , 'Av: Marcelino Pires, 1960');

INSERT INTO  cliente (cpf, nome, endereco, sexo)
VALUES 
('111.222.323-44', 'Jennifer B Souza', ' Rua: Cuiaba, 1050', 'F'),
('666.777.888-99', 'Caetano K Lima', 'Rua: Ivinhema,879', 'M'),
('555.444.777-33', 'Silvia Macedo', 'Rua: Estados Unidos, 735', 'F');

INSERT INTO conta (num_conta, saldo, tipo_conta, num_agencia)
VALUES
('86340-2', '763.05', '2', '3153'),
('23584-7', '3879.12', '1', '0562');

INSERT INTO historico (cpf, num_conta, data_inicio) 
VALUES
('111.222.323-44', '23584-7', '1997-12-17'),
('666.777.888-99', '23584-7', '1997-12-17'),
('555.444.777-33', '86340-2', '2010-11-29');

INSERT INTO telefone_cliente (cpf_cliente, telefone)
VALUES
('111.222.323-44', '(67)3422-7788'),
('666.777.888-99', '(67)3423-9900'),
('555.444.777-33', '(67)8121-8833');

ALTER TABLE cliente ADD COLUMN email VARCHAR(100); 
SELECT cpf,endereco FROM cliente WHERE nome LIKE 'c%';
ALTER TABLE agencia CHANGE num_agenia num_agencia INT;
UPDATE agencia Set num_agencia = 6342 WHERE num_agencia = 0562; 
UPDATE cliente  
SET email = 'caetanolima@gmail.com'  
WHERE nome = 'Caetano K Lima';
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE cliente ADD COLUMN email VARCHAR(100);
SHOW COLUMNS FROM cliente;
UPDATE conta 
SET saldo = saldo * 1.10 
WHERE num_conta = '23584-7';


INSERT INTO agencia (num_agencia, cod_banco, endereco_agencia)
VALUES
( 133, 1 , 'Rua João José da Silva, 486');
SELECT * FROM banco WHERE nome = 'Banco do Brasil';

SELECT num_agencia, endereco_agencia
FROM agencia
WHERE cod_banco = 1;

SELECT * FROM cliente
WHERE sexo = 'M';

DELETE FROM historico
WHERE num_conta = '86340-2';