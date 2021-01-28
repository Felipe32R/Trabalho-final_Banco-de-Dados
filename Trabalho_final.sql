create schema pbd; -- pbd: projeto banco de dados
create table pbd.endereco (
id_endereco int not null,
rua varchar(30) not null,
cep varchar(8) not null,
complemento varchar(30),
uf varchar(2) not null,
cidade varchar(30) not null,
pais varchar(30) not null,
bairro varchar(30) not null,
numero int not null,
primary key (id_endereco)
);
create table pbd.agencia (
id_agencia int primary key not null,
nome_agencia varchar(30) not null,
cidade_agencia varchar(30) not null
);
create table pbd.Cliente_Conta (
id_cliente int not null,
num_conta varchar(10) not null,
saldo numeric not null,
num_cartao varchar(16) not null,
nome varchar(30) not null,
id_endereco int not null,
id_agencia int not null,
primary key (id_cliente),
foreign key (id_endereco) references pbd.endereco (id_endereco),
foreign key (id_agencia) references pbd.agencia (id_agencia)
);
create table pbd.funcionario (
id_funcionario int primary key not null,
tempo_servico numeric not null,
data_admissao date not null,
id_cliente int not null,
foreign key (id_cliente) references pbd.Cliente_Conta (id_cliente)
);
create table pbd.gerente (
id_gerente int primary key not null,
id_funcionario int not null,
id_agencia int not null,
foreign key (id_funcionario) references pbd.funcionario (id_funcionario),
foreign key (id_agencia) references pbd.agencia (id_agencia)
);
create table pbd.contato (
id_contato int primary key not null,
tipo varchar(15),
telefone varchar(15),
id_cliente int not null,
email varchar(30),
foreign key (id_cliente) references pbd.Cliente_Conta (id_cliente)
);
create table pbd.dependente (
id_dependente int primary key not null,
data_aniversario date not null,
nome varchar(30) not null,
doc_indentificacao varchar(30) not null,
parentesco varchar(30) not null,
id_funcionario int not null,
foreign key (id_funcionario) references pbd.funcionario (id_funcionario)
);
ALTER TABLE pbd.dependente RENAME COLUMN doc_indentificacao TO doc_identificacao;
create table pbd.transferencia (
id_transferencia int primary key not null,
tipo varchar(30) not null,
taxa numeric not null,
valor numeric not null,
data_transferencia date not null,
id_cliente int not null,
foreign key (id_cliente) references pbd.Cliente_Conta (id_cliente)
);
create table pbd.emprestimo (
id_emprestimo int primary key not null,
num_parcelas int not null,
data_emprestimo date not null,
valor numeric not null,
limite_credito numeric,
id_cliente int not null,
foreign key (id_cliente) references pbd.Cliente_Conta (id_cliente)
);
create table pbd.pagamento (
id_pagamento int primary key not null,
tipo varchar(30) not null,
quantia numeric not null,
id_cliente int not null,
data_pagamento date not null,
foreign key (id_cliente) references pbd.Cliente_Conta (id_cliente)
);
create table pbd.pjuridica (
cnpj varchar(14) primary key not null,
id_cliente int not null,
representantes varchar(50),
foreign key (id_cliente) references pbd.Cliente_Conta (id_cliente)
);
create table pbd.pfisica (
cpf varchar(11) primary key not null,
id_cliente int not null,
data_nasc date not null,
foreign key (id_cliente) references pbd.Cliente_Conta (id_cliente)
);
create table pbd.ccorrente (
id_ccorrente varchar(10) primary key not null,
id_cliente int not null,
foreign key (id_cliente) references pbd.Cliente_Conta (id_cliente)
);
create table pbd.cpoupanca (
id_cpoupanca varchar(10) primary key not null,
taxa_juros numeric not null,
id_cliente int not null,
variacao numeric not null,
foreign key (id_cliente) references pbd.Cliente_Conta (id_cliente)
);
insert into pbd.agencia (id_agencia, nome_agencia, cidade_agencia) values (0127, 'CEF','Cons.Lafaiete');
insert into pbd.endereco (id_endereco, rua, cep, uf, pais, bairro, numero, complemento,
cidade) values (1000, 'Rua Josefina Martins', '36400000','MG', 'Brasil', 'Centro', 555,
'Casa', 'Lafaiete');
insert into pbd.endereco (id_endereco, rua, cep, uf, pais, bairro, numero, complemento,
cidade) values (1100, 'Rua não sei o nome', '36500000', 'MG', 'Brasil', 'Progresso',
35, 'AP', 'Lafaiete');
insert into pbd.endereco (id_endereco, rua, cep, uf, pais, bairro, numero, complemento,
cidade) values (1200, 'Rua José Maria', '36550000', 'MG', 'Brasil', 'Vila da couves',
69, 'Casa', 'Sardinha');
insert into pbd.endereco (id_endereco, rua, cep, uf, pais, bairro, numero, complemento,
cidade) values (1300, 'Rua Engenheiro Fritz', '38990000', 'MG', 'Brasil', 'Vila das
pinga', 77, 'Casa', 'Lafaiete');
insert into pbd.Cliente_Conta (id_cliente, num_conta, saldo, num_cartao, nome,
id_endereco, id_agencia) values (1, '15000-1', 1045.00, '1478523698745632',
'Maxwell Volta Hopper', 1000, 0127);
insert into pbd.Cliente_Conta (id_cliente, num_conta, saldo, num_cartao, nome,
id_endereco, id_agencia) values (2, '22450-2', 3650.00, '2589314789654122',
'Pascal dos Kepler', 1100, 0127);
insert into pbd.Cliente_Conta (id_cliente, num_conta, saldo, num_cartao, nome,
id_endereco, id_agencia) values (3, '14600-3', 2.00, '9638521236478985',
'Einstein Fermi', 1200, 0127);
insert into pbd.Cliente_Conta (id_cliente, num_conta, saldo, num_cartao, nome,
id_endereco, id_agencia) values (4, '11698-4', 150000, '7412365897412458', 'Isaac
Newton', 1300, 0127);
insert into pbd.pfisica (cpf, data_nasc, id_cliente) values ('11583654687', '25-12-
1985', 1);
insert into pbd.pfisica (cpf, data_nasc, id_cliente) values ('36925814799', '04-04-
1990', 2);
insert into pbd.pfisica (cpf, data_nasc, id_cliente) values ('78965412365', '14-03-
1991', 3);
insert into pbd.pfisica (cpf, data_nasc, id_cliente) values ('96532178954', '04-01-
1943', 4);
insert into pbd.funcionario (id_funcionario, tempo_servico, data_admissao, id_cliente)
values (1001, 3, '22-11-2017', 2);
insert into pbd.funcionario (id_funcionario, tempo_servico, data_admissao, id_cliente)
values (1002, 20, '17-11-2020', 4);
insert into pbd.gerente (id_gerente, id_funcionario, id_agencia) values (999, 1002,
0127);
insert into pbd.ccorrente (id_cliente, id_ccorrente) values (1, '001-1');
insert into pbd.ccorrente (id_cliente, id_ccorrente) values (2, '001-2');
insert into pbd.ccorrente (id_cliente, id_ccorrente) values (4, '001-3');
insert into pbd.cpoupanca (id_cliente, id_cpoupanca, variacao, taxa_juros) values (1,
'001-1', 60, 0.04);
insert into pbd.cpoupanca (id_cliente, id_cpoupanca, variacao, taxa_juros) values (2,
'001-2', 60, 0.04);
insert into pbd.cpoupanca (id_cliente, id_cpoupanca, variacao, taxa_juros) values (3,
'013-1', 60, 0.04);
insert into pbd.cpoupanca (id_cliente, id_cpoupanca, variacao, taxa_juros) values (4,
'001-3', 60, 0.04);
insert into pbd.contato (id_contato, tipo, id_cliente, email, telefone) values (300,
'Celular', 1, 'maxwellVH@cliente.com.br', '31-987412596');
insert into pbd.contato (id_contato, tipo, id_cliente, email, telefone) values (301,
'Celular', 2, 'Kepler_Pascall@cliente.com.br', '32-971256987');
insert into pbd.contato (id_contato, tipo, id_cliente, email, telefone) values (302,
'Celular', 3, 'einsteinDaMaca@cliente.com.br', '31-985632547');
insert into pbd.contato (id_contato, tipo, id_cliente, email, telefone) values (303,
'Celular', 4, 'RoubouMaca@cliente.com.br', '31-993214555');
insert into pbd.dependente (id_dependente, nome, data_aniversario, doc_identificacao,
parentesco, id_funcionario) values (100, 'Enzo Gabriel Kepler', '01-01-2010', 'RG-
25689614', 'filho', 1001);
insert into pbd.dependente (id_dependente, nome, data_aniversario, doc_identificacao,
parentesco, id_funcionario) values (101, 'Newtinho Maça', '12-05-2015', 'CPF-
16893218565', 'filho', 1002);
insert into pbd.emprestimo (id_emprestimo, valor, limite_credito, data_emprestimo,
num_parcelas, id_cliente) values (500, 5000, 10000, '28-02-2019', 36, 3); --einstein
pegou empréstimo.
insert into pbd.pagamento (id_pagamento, quantia, tipo, data_pagamento, id_cliente)
values ();
insert into pbd.transferencia (id_transferencia, tipo, valor, data_transferencia,
id_cliente) values ();
delete from pbd.NOME_DA_TABELA where CONDIÇÃO; -- deleta todos os dados da tabela (*).
campo especifica usar o where.
drop table pbd.gerente ; -- deleta a tabela.
drop table pbd.ccorrente ;
drop table pbd.cpoupanca, pbd.pfisica;
drop table pbd.pjuridica, pbd.pagamento, pbd.transferencia, pbd.emprestimo ;
DROP SCHEMA pbd cascade;
-- buscando gerente
select
* -- dados gerais do gerente.
from
pbd.cliente_conta A inner join pbd.funcionario B on A.id_cliente = B.id_cliente
inner join pbd.gerente C on B.id_funcionario = C.id_funcionario;

-- Quem é o gerente da agência?
select A.nome as "Gerente da Agencia", B.data_admissao as "Gerente desde"
from pbd.cliente_conta A inner join pbd.funcionario B on A.id_cliente = B.id_cliente
inner join pbd.gerente C on B.id_funcionario = C.id_funcionario;
-- buscando alguns dados gerais dos cadastrados (refazer com INNER Join)

select
A.id_cliente as "Cod. Cliente", A.nome as "Nome Cliente", A.num_conta as "Número
da Conta", A.num_cartao as "Cartão", A.saldo as "Saldo disponível", B.cpf as "Doc.
Identificação", C.cep as "CEP", D.telefone as "Contato",
E.id_agencia as "Agencia", G.id_funcionario as "Funcionário/Gerente da agencia"
from
pbd.cliente_conta A inner join pbd.pfisica B on A.id_cliente = B.id_cliente inner join pbd.endereco C on A.id_endereco = C.id_endereco
inner join pbd.contato D on D.id_cliente = A.id_cliente inner join pbd.agencia E
on E.id_agencia = A.id_agencia inner join pbd.gerente G on A.id_agencia = G.id_agencia order by A.id_cliente asc;

-- Clientes com empréstimo:
select
C.id_agencia as "Agencia", C.num_conta as "Numero da Conta", C.nome as "Cliente",
C.saldo as "Saldo em conta", E.valor as "Valor do Emprestimo",
E.num_parcelas as "Numero de parcelas", E.data_emprestimo as "Data da
contratação"

from
pbd.cliente_conta C, pbd.emprestimo E where C.id_cliente = E.id_cliente ;