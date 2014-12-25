DROP TYPE tp_aluguel FORCE;
DROP TYPE tp_pagamento FORCE;
DROP TYPE tp_nome FORCE;
DROP TYPE tp_endereco FORCE;
DROP TYPE tp_telefone FORCE;
DROP TYPE tp_funcionario FORCE;
DROP TYPE tp_tamanho FORCE;
DROP TYPE tp_area FORCE;
DROP TYPE tp_categoria FORCE;
DROP TYPE tp_nt_ref_fones FORCE;
DROP TYPE tp_loja FORCE;
DROP TYPE tp_promocao FORCE;
DROP TYPE tp_atracao FORCE;
DROP TYPE tp_nt_ref_atracao FORCE;
DROP TYPE tp_evento FORCE;

DROP TYPE tp_interno FORCE;
DROP TYPE tp_externo FORCE;
DROP TYPE tp_aloca FORCE;
DROP TYPE tp_aluguel_loja FORCE;

CREATE OR REPLACE TYPE tp_aluguel AS OBJECT (
	Codigo integer,
	Data_de_vencimento date,
	Valor number(7,2),
	Descricao varchar2(200)
);
/

CREATE OR REPLACE TYPE tp_pagamento AS OBJECT (
	Codigo integer,
	Tipo_de_pagamento varchar2(50),
	Data_de_pagamento date,
	Valor number(7,2)
);
/

CREATE OR REPLACE TYPE tp_nome AS OBJECT (
	Primeiro_nome varchar2(50),
	Sobrenome varchar2(50)
);
/

CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
	CEP varchar2(10),
	Estado varchar2(50),
	Numero varchar2(14),
	Logradouro varchar2(50),
	Bairro varchar2(50),
	Cidade varchar2(50)
);
/

CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
	Numero varchar2(14)
);
/

CREATE OR REPLACE TYPE tp_nt_ref_fones AS TABLE OF REF tp_telefone;
/

CREATE OR REPLACE TYPE tp_funcionario AS OBJECT (
	CPF varchar2(14),
	Nivel_de_escolaridade varchar2(50),
	RG varchar2(9),
	Estado_civil varchar2(50),
	Sexo varchar2(50),
	Data_de_nascimento date,
	Nome REF tp_nome,
	Endereco REF tp_endereco,
	Lista_telefone tp_nt_ref_fones
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE tp_tamanho AS OBJECT (
	Altura number(7,2),
	Comprimento number(7,2),
	Largura number(7,2)
);
/

CREATE OR REPLACE TYPE tp_area AS OBJECT (
	Codigo integer,
	Tipo varchar2(50),
	Descricao varchar2(200),
	Tamanho REF tp_tamanho	
);
/

CREATE OR REPLACE TYPE tp_categoria AS OBJECT (
	Categoria varchar2(50),
	Categoria_Descricao varchar2(200)
);
/

CREATE OR REPLACE TYPE tp_loja AS OBJECT (
	CNPJ varchar2(18),
	Tipo varchar2(50),
	Email varchar2(50),
	Publico_alvo varchar2(50),
	Forma_de_pagamento varchar2(50),
	Data_de_abertura date,
	Nome_da_loja varchar2(50),
	Lista_telefone tp_nt_ref_fones
);
/

CREATE OR REPLACE TYPE tp_promocao AS OBJECT (
	Loja REF tp_loja,
	Promocao_Codigo integer,
	Categoria REF tp_categoria,
	Data_inicio date,
	Data_fim date,
	Descricao varchar2(200)
);
/

CREATE OR REPLACE TYPE tp_atracao AS OBJECT (
	Nome varchar2(50),
	Tema varchar2(50),
	Tipo varchar2(50),
	Descricao varchar2(200)
);
/

CREATE OR REPLACE TYPE tp_nt_ref_atracao AS TABLE OF REF tp_atracao;
/

CREATE OR REPLACE TYPE tp_evento AS OBJECT (
	Codigo integer,
	Nome varchar2(50),
	Descricao varchar2(200),
	Data_inicio date,
	Data_fim date,
	Privacidade varchar2(50),
	Lista_atracao tp_nt_ref_atracao
);
/

CREATE OR REPLACE TYPE tp_externo UNDER tp_funcionario (
    Grau_de_responsabilidade varchar2(50),
    Tipo_de_acesso varchar2(50),
    Loja REF tp_Loja
);
/

CREATE OR REPLACE TYPE tp_interno UNDER tp_funcionario (
    Data_de_contratacao date,
    Funcao varchar2(50),
    Salario integer,
    Supervisor REF tp_interno
);
/

CREATE OR REPLACE TYPE tp_aloca AS OBJECT(
    Interno REF tp_interno,
    Area REF tp_area,
    Evento REF tp_evento
);
/

CREATE OR REPLACE TYPE tp_aluguel_loja AS OBJECT(
    Aluguel REF tp_aluguel,
    Pagamento REF tp_pagamento,
    Loja REF tp_loja
)NOT FINAL;
/



DROP TABLE tb_aluguel CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_pagamento CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_nome_Funcionario CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_endereco CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_tamanho CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_area CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_categoria CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_loja CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_promocao CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_atracao CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_telefone CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_aluguel_loja CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_externo CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_interno CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_evento CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_aloca CASCADE CONSTRAINTS PURGE;

CREATE TABLE tb_telefone OF tp_telefone (
	Numero NOT NULL
);

CREATE TABLE tb_aluguel OF tp_aluguel (
	Codigo PRIMARY KEY,
	Data_de_vencimento NOT NULL,
	Valor NOT NULL
);

CREATE TABLE tb_pagamento OF tp_pagamento (
	Codigo PRIMARY KEY,
	Tipo_de_pagamento NOT NULL,
	Data_de_pagamento NOT NULL,
	Valor NOT NULL
);

CREATE TABLE tb_nome_funcionario OF tp_nome (
	Primeiro_nome NOT NULL,
	Sobrenome NOT NULL
);

CREATE TABLE tb_endereco OF tp_endereco (
	CEP NOT NULL,
	Estado NOT NULL,
	Numero NOT NULL,
	Logradouro NOT NULL,
	Bairro NOT NULL,
	Cidade NOT NULL
);

CREATE TABLE tb_tamanho OF tp_tamanho (
	Altura NOT NULL,
	Comprimento NOT NULL,
	Largura NOT NULL
);

CREATE TABLE tb_area OF tp_area (
	Codigo PRIMARY KEY,
	Tipo NOT NULL
);

CREATE TABLE tb_categoria OF tp_categoria (
	Categoria PRIMARY KEY
);

CREATE TABLE tb_loja OF tp_loja (
    CNPJ PRIMARY KEY,
    Tipo NOT NULL,
    Email NOT NULL,
    Publico_alvo NOT NULL,
    Forma_de_pagamento NOT NULL,
    Data_de_abertura NOT NULL,
    Nome_da_loja NOT NULL
)NESTED TABLE Lista_telefone STORE AS Lista_telefone_loja;

CREATE TABLE tb_promocao OF tp_promocao (
	Loja WITH ROWID REFERENCES tb_loja,
	Promocao_Codigo PRIMARY KEY,
	Categoria WITH ROWID REFERENCES tb_categoria,
	Data_inicio NOT NULL,
	Data_fim NOT NULL
);

CREATE TABLE tb_atracao OF tp_atracao (
	Nome PRIMARY KEY,
	Tema NOT NULL,
	Tipo NOT NULL
);


CREATE TABLE tb_aluguel_loja OF tp_aluguel_loja(
    Aluguel WITH ROWID REFERENCES tb_aluguel,
    Pagamento WITH ROWID REFERENCES tb_pagamento,
    Loja WITH ROWID REFERENCES tb_loja
);

CREATE TABLE tb_externo OF tp_externo(
    CPF PRIMARY KEY,
    Nivel_de_escolaridade NOT NULL,
    RG NOT NULL,
    Estado_civil NOT NULL,
    Sexo NOT NULL,
    Data_de_nascimento NOT NULL,
    Nome NOT NULL,
    Endereco NOT NULL,
    Grau_de_responsabilidade NOT NULL,
    Tipo_de_acesso NOT NULL,
    Loja WITH ROWID REFERENCES tb_Loja
)NESTED TABLE Lista_telefone STORE AS Lista_telefone_externo;

CREATE TABLE tb_interno OF tp_interno(
    CPF PRIMARY KEY,
    Nivel_de_escolaridade NOT NULL,
    RG NOT NULL,
    Estado_civil NOT NULL,
    Sexo NOT NULL,
    Data_de_nascimento NOT NULL,
    Nome NOT NULL,
    Endereco NOT NULL,
    Data_de_contratacao NOT NULL,
    Funcao NOT NULL,
    Salario NOT NULL,
    Supervisor WITH ROWID REFERENCES tb_interno
)NESTED TABLE Lista_telefone STORE AS Lista_telefone_interno;

CREATE TABLE tb_evento OF tp_evento(
    Codigo PRIMARY KEY,
    Nome NOT NULL,
    Descricao NOT NULL,
    Data_inicio NOT NULL,
    Data_fim NOT NULL,
    Privacidade NOT NULL    
)NESTED TABLE Lista_atracao STORE AS tb_lista_atracao;

CREATE TABLE tb_aloca OF tp_aloca(
    Interno WITH ROWID REFERENCES tb_interno,
    Area WITH ROWID REFERENCES tb_area,
    Evento WITH ROWID REFERENCES tb_evento
);

-- Aluguel

INSERT INTO tb_aluguel VALUES(tp_aluguel(1, TO_DATE('05/11/2014', 'dd/mm/yyyy'), 1194.65, 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi'));
INSERT INTO tb_aluguel VALUES(tp_aluguel(2, TO_DATE('06/12/2014', 'dd/mm/yyyy') , 608.6800000001, 'fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel'));
INSERT INTO tb_aluguel VALUES(tp_aluguel(3, TO_DATE('15/11/2014', 'dd/mm/yyyy'), 1812.11, 'nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat'));
INSERT INTO tb_aluguel VALUES(tp_aluguel(4, TO_DATE('13/12/2014', 'dd/mm/yyyy'), 2444.23, 'mi nulla ac enim in tempor turpis nec euismod scelerisque'));
INSERT INTO tb_aluguel VALUES(tp_aluguel(5, TO_DATE('01/01/2015', 'dd/mm/yyyy'), 900.91, 'pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est'));
INSERT INTO tb_aluguel VALUES(tp_aluguel(6, TO_DATE('05/01/2015', 'dd/mm/yyyy'), 538.33, 'amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices'));
INSERT INTO tb_aluguel VALUES(tp_aluguel(7, TO_DATE('17/12/2014', 'dd/mm/yyyy'), 962.74, 'quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet'));
INSERT INTO tb_aluguel VALUES(tp_aluguel(8, TO_DATE('20/11/2014', 'dd/mm/yyyy'), 9355.11, 'pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate'));
INSERT INTO tb_aluguel VALUES(tp_aluguel(9, TO_DATE('23/11/2014', 'dd/mm/yyyy'), 1512.81, 'posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in'));
INSERT INTO tb_aluguel VALUES(tp_aluguel(10, TO_DATE('24/10/2014', 'dd/mm/yyyy'), 1277.01, 'magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque'));

--Pagamento

INSERT INTO tb_pagamento VALUES(tp_pagamento(1004, 'Credito', TO_DATE('12/12/2014', 'dd/mm/yyyy'), 765.80));
INSERT INTO tb_pagamento VALUES(tp_pagamento(10, 'Credito', TO_DATE('15/11/2014', 'dd/mm/yyyy'), 674.00));
INSERT INTO tb_pagamento VALUES(tp_pagamento(1002, 'A vista', TO_DATE('18/10/2014', 'dd/mm/yyyy'), 235.50));
INSERT INTO tb_pagamento VALUES(tp_pagamento(4, 'Boleto', TO_DATE('19/11/2014', 'dd/mm/yyyy'), 321.80));
INSERT INTO tb_pagamento VALUES(tp_pagamento(14, 'Deposito', TO_DATE('03/12/2014', 'dd/mm/yyyy'), 500.90));
INSERT INTO tb_pagamento VALUES(tp_pagamento(124, 'Credito', TO_DATE('27/12/2014', 'dd/mm/yyyy'), 150.10));
INSERT INTO tb_pagamento VALUES(tp_pagamento(10334, 'A vista', TO_DATE('09/10/2014', 'dd/mm/yyyy'), 750.20));
INSERT INTO tb_pagamento VALUES(tp_pagamento(9422334, 'Deposito', TO_DATE('01/11/2014', 'dd/mm/yyyy'), 343.20));

--Nome_Funcionario

INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Marlon', 'Almeida')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Marlon', 'Lima') );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Tomer', 'Lima') );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Tomer', 'Paz') );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Samuel', 'Paz')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Leite', 'Ferraz')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Rene', 'Varsktov')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Jose', 'Guardado')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Elloco', 'Pinheiro')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Schvechenko', 'Silva')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Hannibal', 'Lector')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Tourist', 'Magalhaes')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Abelardo', 'Leal')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Matheus', 'Feliciano')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Leon', 'Vale')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Cristiano', 'Ronaldo')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Victor', 'Godoy')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Johnny', 'Bravo')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Fernando', 'Fonseca')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Mateus', 'Freitas')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('George', 'Farias')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('Lucas', 'Albuquerque')  );
INSERT INTO tb_nome_funcionario VALUES ( tp_nome('James', 'Rodriguez')  );

--Endereço

INSERT INTO tb_endereco VALUES (tp_endereco ('1', 'Paraiba', '1', 'Menino', 'Boa', 'Hellcity'));

INSERT INTO tb_endereco VALUES (tp_endereco('2', 'Pernambuco', '2', 'Coisa', 'Viagem', 'Relcity'));

INSERT INTO tb_endereco  
VALUES (tp_endereco('3', 'Paraiba', '3', 'Menino', 'Viagem', 'Relcity'));

INSERT INTO tb_endereco  
VALUES (tp_endereco('4', 'Paraiba', '4', 'Menino', 'Boa', 'Hellcity'));

INSERT INTO tb_endereco  
VALUES (tp_endereco('5', 'Paraiba', '5', 'Menino', 'Boa', 'Hellcife'));

INSERT INTO tb_endereco  
VALUES (tp_endereco('6', 'Pernambuco', '6', 'Danado', 'Boa', 'Relcity'));

INSERT INTO tb_endereco  
VALUES (tp_endereco('7', 'Pernambuco', '7', 'Menino', 'Boa', 'Hellcife'));

INSERT INTO tb_endereco  
VALUES (tp_endereco('8', 'Bahia', '8', 'Menino', 'Viagem', 'Hellcife'));

INSERT INTO tb_endereco  
VALUES (tp_endereco('9', 'Bahia', '9', 'Coisa', 'Viagem', 'Relcity'));

INSERT INTO tb_endereco  
VALUES (tp_endereco('10', 'Paraiba', '10', 'Danado', 'Rosa', 'Hellcife'));

--Tamanho

INSERT INTO tb_tamanho VALUES(tp_tamanho(74.18, 20.9, 40.61));
INSERT INTO tb_tamanho VALUES(tp_tamanho(25.83, 26.86, 19.64));
INSERT INTO tb_tamanho VALUES(tp_tamanho(70.47, 4.43, 45.65));
INSERT INTO tb_tamanho VALUES(tp_tamanho(81.34, 86.67, 97.09));
INSERT INTO tb_tamanho VALUES(tp_tamanho(60.69, 32.25, 87.99));
INSERT INTO tb_tamanho VALUES(tp_tamanho(77.11, 64.44, 60.45));
INSERT INTO tb_tamanho VALUES(tp_tamanho(68.75, 51.31, 38.62));
INSERT INTO tb_tamanho VALUES(tp_tamanho(93.67, 2.44, 6.19));
INSERT INTO tb_tamanho VALUES(tp_tamanho(67.42, 37.3, 85.53));
INSERT INTO tb_tamanho VALUES(tp_tamanho(93.18, 91.7, 8.43));

--Área

INSERT INTO tb_area VALUES(tp_area(1, 'Externa', ' Etiam justo. Etiam pretium iaculis justo..', (SELECT REF(T) FROM tb_tamanho T WHERE T.altura = 74.18 AND T.comprimento = 20.9 AND T.largura = 40.61)));
INSERT INTO tb_area VALUES(tp_area(2, 'Mista', ' ut volutpat sapien arcu sed augue..',(SELECT REF(T) FROM tb_tamanho T WHERE T.altura = 25.83 AND T.comprimento = 26.86 AND T.largura = 19.64)));
INSERT INTO tb_area VALUES(tp_area(3, 'Mista', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.',(SELECT REF(T) FROM tb_tamanho T WHERE T.altura = 70.47 AND T.comprimento = 4.43 AND T.largura = 45.65)));
INSERT INTO tb_area VALUES(tp_area(4, 'Externa', ' Etiam faucibus cursus urna. Ut tellus.  Nullam varius.',(SELECT REF(T) FROM tb_tamanho T WHERE T.altura = 81.34 AND T.comprimento = 86.67 AND T.largura = 97.09)));
INSERT INTO tb_area VALUES(tp_area(5, 'Interna', '  turpis enim blandit mi, in porttitor pede justo eu massa.',(SELECT REF(T) FROM tb_tamanho T WHERE T.altura = 60.69 AND T.comprimento = 32.25 AND T.largura = 87.99)));
INSERT INTO tb_area VALUES(tp_area(6, 'Mista', '  Integer ac leo. Pellentesque ultrices mattis odio.',(SELECT REF(T) FROM tb_tamanho T WHERE T.altura = 77.11 AND T.comprimento = 64.44 AND T.largura = 60.45)));
INSERT INTO tb_area VALUES(tp_area(7, 'Externa', ' nibh ligula nec sem.',(SELECT REF(T) FROM tb_tamanho T WHERE T.altura = 68.75 AND T.comprimento = 51.31 AND T.largura = 38.62)));
INSERT INTO tb_area VALUES(tp_area(8, 'Interna', 'erra dapibus. Nulla suscipit ligula in lacus.',(SELECT REF(T) FROM tb_tamanho T WHERE T.altura = 93.67 AND T.comprimento = 2.44 AND T.largura = 6.19)));
INSERT INTO tb_area VALUES(tp_area(9, 'Interna', 'llis molestie lorem.',(SELECT REF(T) FROM tb_tamanho T WHERE T.altura = 67.42 AND T.comprimento = 37.3 AND T.largura = 85.53)));
INSERT INTO tb_area VALUES(tp_area(10, 'Mista', 'Praesent blandit. Nam nulla.',(SELECT REF(T) FROM tb_tamanho T WHERE T.altura = 93.18 AND T.comprimento = 91.7 AND T.largura = 8.43)));

--Categoria

INSERT INTO tb_categoria VALUES ( tp_categoria('Calçados', 'Muito usado')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Eletronicos', 'Artigos uteis')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Esportes', 'Jovem adora')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Cinema', 'Pra familia assistir')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Livros', 'Para todos lerem')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Música', 'Para se escutar')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Economia', 'Todos economizam')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Viagens', 'Organizacao de viagem')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Roupas', 'Pessoas usam')  );
INSERT INTO tb_categoria VALUES ( tp_categoria( 'Acessorios', 'Usam no braco, etc.')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Calças', 'Usam nas pernas')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Relojoalheria', 'Vendem relogios')  );
INSERT INTO tb_categoria VALUES ( tp_categoria('Bordadagem', 'Bordam tecidos')  );

--Telefone

--Telefones de Lojas

INSERT INTO tb_telefone VALUES(tp_telefone('3943-4022'));
INSERT INTO tb_telefone VALUES(tp_telefone('3243-2022'));
INSERT INTO tb_telefone VALUES(tp_telefone('3193-1022'));
INSERT INTO tb_telefone VALUES(tp_telefone('3503-5022'));
INSERT INTO tb_telefone VALUES(tp_telefone('3483-6029'));
INSERT INTO tb_telefone VALUES(tp_telefone('3373-1022'));
INSERT INTO tb_telefone VALUES(tp_telefone('3353-0027'));
INSERT INTO tb_telefone VALUES(tp_telefone('3243-4032'));
INSERT INTO tb_telefone VALUES(tp_telefone('3143-5025'));
INSERT INTO tb_telefone VALUES(tp_telefone('3343-5021'));
INSERT INTO tb_telefone VALUES(tp_telefone('3797-5785'));
INSERT INTO tb_telefone VALUES(tp_telefone('3123-5462'));

-- Telefones de Funcionários

INSERT INTO tb_telefone VALUES(tp_telefone('00000001'));
INSERT INTO tb_telefone VALUES(tp_telefone('33419110'));
INSERT INTO tb_telefone VALUES(tp_telefone('00000003'));
INSERT INTO tb_telefone VALUES(tp_telefone('00000004'));
INSERT INTO tb_telefone VALUES(tp_telefone('00000005'));
INSERT INTO tb_telefone VALUES(tp_telefone('00000006'));
INSERT INTO tb_telefone VALUES(tp_telefone('00000007'));
INSERT INTO tb_telefone VALUES(tp_telefone('00000008'));
INSERT INTO tb_telefone VALUES(tp_telefone('00000009'));
INSERT INTO tb_telefone VALUES(tp_telefone('00000000'));

--Loja

INSERT INTO tb_loja VALUES(
	tp_loja('86.814.375/0001-00', 'Roupas', 'contato@cea.com.br', 'Jovem', 'Á vista/Á prazo', 
		TO_DATE('01/07/2014', 'dd/mm/yyyy'), 'CeA', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3943-4022') 
) ) );

INSERT INTO tb_loja VALUES(
	tp_loja('83.824.371/0001-00', 'Restaurante', 'contato@boteco.com.br', 'Adulto', 'Á vista/Á prazo', 
		TO_DATE('12/03/2014', 'dd/mm/yyyy'), 'Boteco - Bar e Restaurante', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3243-2022') 
) ) );


INSERT INTO tb_loja VALUES(
	tp_loja('33.824.141/0002-00', 'Farmácia', 'contato@santamaria.com.br', 'Idoso', 'Á vista/Á prazo', 
		TO_DATE('12/07/2011', 'dd/mm/yyyy'), 'Farmácia Santa Maria', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3193-1022') 
) ) );


INSERT INTO tb_loja VALUES(
	tp_loja('13.14.141/132-00', 'Restaurante', 'hablaconosco@donandaluz.com.br', 'Maratonista', 'Dinero', 
		TO_DATE('12/09/2000', 'dd/mm/yyyy'), 'Don Andaluz', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3503-5022') 
) ) );


INSERT INTO tb_loja VALUES(
	tp_loja('13.11.111/112-00', 'Livraria', 'contato@saraiva.com.br', 'Todos', 'Á vista/Á prazo', 
		TO_DATE('12/07/2001', 'dd/mm/yyyy'), 'Livraria Saraiva', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3483-6029') 
) ) );

INSERT INTO tb_loja VALUES(
	tp_loja('23.13.131/112-12', 'Ótica', 'contato@oticasdiniz.com.br', 'Todos', 'Á vista/Á prazo', 
		TO_DATE('12/01/2011', 'dd/mm/yyyy'), 'Óticas Diniz', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3373-1022') 
) ) );

INSERT INTO tb_loja VALUES(
	tp_loja('23.11.121/132-11', 'Cinema', 'contato@uci.com.br', 'Jovem', 'Á vista/Á prazo', TO_DATE('01/02/2013', 'dd/mm/yyyy'), 'Cinema UCI', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3353-0027') 
) ) );

INSERT INTO tb_loja VALUES(
	tp_loja('93.15.128/112-11', 'Loja', 'contato@eletroshopping.com.br', 'Adulto', 'Á vista/Á prazo', TO_DATE('12/03/2012', 'dd/mm/yyyy'), 'Eletroshopping', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3143-5025') 
) ) );

INSERT INTO tb_loja VALUES(
	tp_loja('82.43.132/193-63', 'Mercado', 'contato@hiper.com.br', 'Todos', 'Á vista/Á prazo', TO_DATE('03/02/2010', 'dd/mm/yyyy'), 'Hiper-Bombreço', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3243-4032') 
) ) );

INSERT INTO tb_loja VALUES(
	tp_loja('58.34.321/132-43', 'Loja', 'contato@rommanel.com.br', 'Adulto', 'Á vista', TO_DATE('12/02/2014', 'dd/mm/yyyy'), 'Rommanel Jóias', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3343-5021') 
) ) );
INSERT INTO tb_loja VALUES(
	tp_loja('58.34.231/345-43', 'Livraria', 'contato@livrosa.com.br', 'Maratonista', 'Á vista', TO_DATE('11/11/2011', 'dd/mm/yyyy'), 'Livros SA', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3456-1231') 
) ) );

INSERT INTO tb_loja VALUES(
	tp_loja('49.14.321/132-43', 'Livraria', 'contato@cultura.com.br', 'Maratonista', 'Á vista', TO_DATE('03/07/2003', 'dd/mm/yyyy'), 'Cultura', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3797-5785') 
) ) );

INSERT INTO tb_loja VALUES(
	tp_loja('29.34.856/938-941', 'Eletronicos', 'contato@infobox.com.br', 'Maratonista', 'Á vista', TO_DATE('12/01/2012', 'dd/mm/yyyy'), 'Infobox', 
		tp_nt_ref_fones( (SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '3123-5462') 
) ) );

--Promoção

INSERT INTO tb_promocao VALUES ( 
	tp_promocao(
		(SELECT REF(l) from tb_loja l 
		WHERE l.CNPJ = '86.814.375/0001-00'),
		223123,
		(SELECT REF(c) FROM tb_categoria c 
		WHERE c.CATEGORIA = 'Calçados' ),
		TO_DATE('03/07/2014', 'dd/mm/yyyy'),
		TO_DATE('06/07/2014', 'dd/mm/yyyy'),
		'Pra galera gastar'
	)
);


INSERT INTO tb_promocao VALUES ( 
	tp_promocao(
		(SELECT REF(l) from tb_loja l 
		WHERE l.CNPJ = '83.824.371/0001-00'),
		323123,
		(SELECT REF(c) FROM tb_categoria c 
		WHERE c.CATEGORIA = 'Eletronicos' ),
		TO_DATE('04/07/2014', 'dd/mm/yyyy'),
		TO_DATE('06/07/2014', 'dd/mm/yyyy'),
		'Foi sencacional'
	)
);


INSERT INTO tb_promocao VALUES ( 
	tp_promocao(
		(SELECT REF(l) from tb_loja l 
		WHERE l.CNPJ = '33.824.141/0002-00'),
		423123,
		(SELECT REF(c) FROM tb_categoria c 
		WHERE c.CATEGORIA = 'Eletronicos' ),
		TO_DATE('02/07/2014', 'dd/mm/yyyy'),
		TO_DATE('09/07/2014', 'dd/mm/yyyy'),
		'Tudo barato'
	)
);


INSERT INTO tb_promocao VALUES ( 
	tp_promocao(
		(SELECT REF(l) from tb_loja l 
		WHERE l.CNPJ = '13.14.141/132-00'),
		523123,
		(SELECT REF(c) FROM tb_categoria c 
		WHERE c.CATEGORIA = 'Esportes' ),
		TO_DATE('01/07/2014', 'dd/mm/yyyy'),
		TO_DATE('03/07/2014', 'dd/mm/yyyy'),
		'Esportes baratos'
	)
);


INSERT INTO tb_promocao VALUES ( 
	tp_promocao(
		(SELECT REF(l) from tb_loja l 
		WHERE l.CNPJ = '13.11.111/112-00'),
		623123,
		(SELECT REF(c) FROM tb_categoria c 
		WHERE c.CATEGORIA = 'Esportes' ),
		TO_DATE('01/07/2014', 'dd/mm/yyyy'),
		TO_DATE('04/07/2014', 'dd/mm/yyyy'),
		'De fazer a festa'
	)
);


INSERT INTO tb_promocao VALUES ( 
	tp_promocao(
		(SELECT REF(l) from tb_loja l 
		WHERE l.CNPJ = '23.13.131/112-12'),
		723123,
		(SELECT REF(c) FROM tb_categoria c 
		WHERE c.CATEGORIA = 'Esportes' ),
		TO_DATE('10/07/2014', 'dd/mm/yyyy'),
		TO_DATE('12/07/2014', 'dd/mm/yyyy'),
		'Boa descricao'
	)
);


INSERT INTO tb_promocao VALUES ( 
	tp_promocao(
		(SELECT REF(l) from tb_loja l 
		WHERE l.CNPJ = '23.11.121/132-11'),
		823123,
		(SELECT REF(c) FROM tb_categoria c 
		WHERE c.CATEGORIA = 'Cinema' ),
		TO_DATE('13/07/2014', 'dd/mm/yyyy'),
		TO_DATE('15/07/2014', 'dd/mm/yyyy'),
		'Cinema top'
	)
);


INSERT INTO tb_promocao VALUES ( 
	tp_promocao(
		(SELECT REF(l) from tb_loja l 
		WHERE l.CNPJ = '93.15.128/112-11'),
		923123,
		(SELECT REF(c) FROM tb_categoria c 
		WHERE c.CATEGORIA = 'Música' ),
		TO_DATE('01/07/2014', 'dd/mm/yyyy'),
		TO_DATE('08/07/2014', 'dd/mm/yyyy'),
		'Deu muita gente'
	)
);

--Atração

INSERT INTO tb_atracao 
VALUES (tp_atracao( 'Banda Polentinha do Arrocha', 'Axé', 'Música', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur blandit arcu eget laoreet. Etiam auctor massa ac urna condimentum semper. '));

INSERT INTO tb_atracao 
VALUES (tp_atracao( 'Palhaço Chocolate', 'Brincadeiras', 'Humor', 'Vestibulum ut leo nec ex efficitur posuere. Vivamus sapien felis, ornare eu enim et, commodo maximus orci.'));

INSERT INTO tb_atracao 
VALUES (tp_atracao( 'Victor e Leo', 'É festa de rodeio', 'Música', 'Vestibulum ut leo nec ex efficitur posuere. Vivamus sapien felis, ornare eu enim et, commodo maximus orci.'));

INSERT INTO tb_atracao 
VALUES (tp_atracao( 'Marlon Marley', 'Como tocar cuíca', 'Workshop', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non lacus nibh. Morbi euismod sodales ligula auctor pretium.'));

INSERT INTO tb_atracao 
VALUES (tp_atracao( 'DJ Samuel', 'Party EletroPetro', 'Música', 'Phasellus lacinia nibh et elit sollicitudin vehicula. Proin et nunc lobortis mauris tempus tincidunt. Sed dictum congue nunc, ac lobortis lacus sodales id.'));

INSERT INTO tb_atracao 
VALUES (tp_atracao( 'Danilo Gentily', 'Eleições', 'Stand-Up', 'Fusce urna nibh, ultricies semper tellus eu, dignissim volutpat odio. Aenean aliquet, felis interdum semper consectetur, turpis tellus feugiat erat.'));

INSERT INTO tb_atracao 
VALUES (tp_atracao( 'Shevchenko e Elloco', 'Brega de cada dia', 'Música', 'Ultricies semper tellus eu, dignissim volutpat odio.'));

--Aluguel_Loja

INSERT INTO tb_aluguel_loja VALUES(
	tp_aluguel_loja(
		(SELECT REF(A) FROM tb_aluguel A WHERE A.Codigo = 1),
		(SELECT REF(P) FROM tb_pagamento P WHERE P.Codigo = 10022334),
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '86.814.375/0001-00')		
	)
);
INSERT INTO tb_aluguel_loja VALUES(
	tp_aluguel_loja(
		(SELECT REF(A) FROM tb_aluguel A WHERE A.Codigo = 2),
		(SELECT REF(P) FROM tb_pagamento P WHERE P.Codigo = 10034),
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '83.824.371/0001-00')		
	)
);
INSERT INTO tb_aluguel_loja VALUES(
	tp_aluguel_loja(
		(SELECT REF(A) FROM tb_aluguel A WHERE A.Codigo = 3), 
		(SELECT REF(P) FROM tb_pagamento P WHERE P.Codigo = 1004),
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '33.824.141/0002-00')
	)
);
INSERT INTO tb_aluguel_loja VALUES(
	tp_aluguel_loja(
		(SELECT REF(A) FROM tb_aluguel A WHERE A.Codigo = 4), 
		(SELECT REF(P) FROM tb_pagamento P WHERE P.Codigo = 10),
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '13.14.141/132-00')
	)
);
INSERT INTO tb_aluguel_loja VALUES(
	tp_aluguel_loja(
		(SELECT REF(A) FROM tb_aluguel A WHERE A.Codigo = 5), 
		(SELECT REF(P) FROM tb_pagamento P WHERE P.Codigo = 1002),
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '13.11.111/112-00')
	)
);
INSERT INTO tb_aluguel_loja VALUES(
	tp_aluguel_loja(
		(SELECT REF(A) FROM tb_aluguel A WHERE A.Codigo = 6), 
		(SELECT REF(P) FROM tb_pagamento P WHERE P.Codigo = 4),
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '23.13.131/112-12')
	)
);
INSERT INTO tb_aluguel_loja VALUES(
	tp_aluguel_loja(
		(SELECT REF(A) FROM tb_aluguel A WHERE A.Codigo = 7), 
		(SELECT REF(P) FROM tb_pagamento P WHERE P.Codigo = 14),
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '23.11.121/132-11')
	)
);
INSERT INTO tb_aluguel_loja VALUES(
	tp_aluguel_loja(
		(SELECT REF(A) FROM tb_aluguel A WHERE A.Codigo = 8), 
		(SELECT REF(P) FROM tb_pagamento P WHERE P.Codigo = 124),
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '93.15.128/112-11')
	)
);
INSERT INTO tb_aluguel_loja VALUES(
	tp_aluguel_loja(
		(SELECT REF(A) FROM tb_aluguel A WHERE A.Codigo = 9), 
		(SELECT REF(P) FROM tb_pagamento P WHERE P.Codigo = 10334),
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '82.43.132/193-63')
	)
);
INSERT INTO tb_aluguel_loja VALUES(
	tp_aluguel_loja(
		(SELECT REF(A) FROM tb_aluguel A WHERE A.Codigo = 10), 
		(SELECT REF(P) FROM tb_pagamento P WHERE P.Codigo = 9422334),
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '58.34.321/132-43')
	)
);

--Externo

INSERT INTO tb_externo VALUES(
	tp_externo (
		'000.000.000-6',
		'Media',
		'6',
		'Solteiro',
		'Masculino',
		TO_DATE('01/05/1979', 'dd/mm/yyyy'),
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Samuel' AND N.Sobrenome = 'Paz'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '6' AND E.Estado = 'Pernambuco' AND E.Numero = '6' AND E.Logradouro = 'Danado' AND E.Bairro = 'Boa' AND E.Cidade = 'Relcity'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000006')
		),
		'Baixo',
		'Total',
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '86.814.375/0001-00')
	)
);
INSERT INTO tb_externo VALUES(
	tp_externo (
		'000.000.000-7',
		'Media',
		'7',
		'Solteiro',
		'Masculino',
		TO_DATE('08/06/1967', 'dd/mm/yyyy'),
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Johnny' AND N.Sobrenome = 'Bravo'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '7' AND E.Estado = 'Pernambuco' AND E.Numero = '7' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcife'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000007')
		),
		'Alto',
		'Total',
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '86.814.375/0001-00')		
	)
);
INSERT INTO tb_externo VALUES(
	tp_externo(
		'000.000.000-8',
		'Media',
		'8',
		'Solteiro',
		'Masculino',
		TO_DATE('06/07/1959', 'dd/mm/yyyy'),
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Marlon' AND N.Sobrenome = 'Lima'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '8' AND E.Estado = 'Bahia' AND E.Numero = '8' AND E.Logradouro = 'Menino' AND E.Bairro = 'Viagem' AND E.Cidade = 'Hellcife'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000008')
		),
		'Alto',
		'ParcialB1',
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '23.13.131/112-12')		
	)
);
INSERT INTO tb_externo VALUES(
	tp_externo(
		'000.000.000-9',
		'Media',
		'9',
		'Solteiro',
		'Masculino',
		TO_DATE('19/09/1985', 'dd/mm/yyyy'),
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Tomer' AND N.Sobrenome = 'Lima'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '9' AND E.Estado = 'Bahia' AND E.Numero = '9' AND E.Logradouro = 'Coisa' AND E.Bairro = 'Viagem' AND E.Cidade = 'Relcity'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000009')
		),
		'Baixo',
		'ParcialB2',
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '23.13.131/112-12')		
	)
);
INSERT INTO tb_externo VALUES(
	tp_externo(
		'000.000.000-0',
		'Media',
		'10',
		'Casado',
		'Masculino',
		TO_DATE('27/10/1984', 'dd/mm/yyyy'),
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'George' AND N.Sobrenome = 'Farias'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '10' AND E.Estado = 'Paraiba' AND E.Numero = '10' AND E.Logradouro = 'Danado' AND E.Bairro = 'Rosa' AND E.Cidade = 'Hellcife'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000000')
		),
		'Baixo',
		'ParcialB3',
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '86.814.375/0001-00')		
	)
);

--Interno

INSERT INTO tb_interno VALUES (
	tp_interno (
		'000.000.000-1',
		'Media',
		'1',
		'Solteiro',
		'Feminino',
		TO_DATE('09/07/1988', 'dd/mm/yyyy'),
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Tomer' AND N.Sobrenome = 'Paz'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '1' AND E.Estado = 'Paraiba' AND E.Numero = '1' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcity'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000001')
		),
		TO_DATE('12/07/2014', 'dd/mm/yyyy'),
		'Gerente',
		3000,
		NULL
	)
);
INSERT INTO tb_interno VALUES (
	tp_interno (
		'000.000.000-2',
		'Media',
		'2',
		'Solteiro',
		'Feminino', 
		TO_DATE('20/10/1976', 'dd/mm/yyyy'),
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Elloco' AND N.Sobrenome = 'Pinheiro'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '2' AND E.Estado = 'Pernambuco' AND E.Numero = '2' AND E.Logradouro = 'Coisa' AND E.Bairro = 'Viagem' AND E.Cidade = 'Relcity'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '33419110')
		),
		TO_DATE('11/07/2014', 'dd/mm/yyyy'), 
		'Atendente',
		2000,
		(SELECT REF(I) FROM tb_interno I WHERE I.CPF = '000.000.000-1')
	)
);
INSERT INTO tb_interno VALUES (
	tp_interno (
		'000.000.000-3',
		'Media',
		'3', 
		'Solteiro',
		'Feminino',
		TO_DATE('06/12/1963', 'dd/mm/yyyy'),
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'James' AND N.Sobrenome = 'Rodriguez'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '3' AND E.Estado = 'Paraiba' AND E.Numero = '3' AND E.Logradouro = 'Menino' AND E.Bairro = 'Viagem' AND E.Cidade = 'Relcity'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000003')
		),
		TO_DATE('12/01/2011', 'dd/mm/yyyy'),
		'Seguranca', 
		1000,		
		(SELECT REF(I) FROM tb_interno I WHERE I.CPF = '000.000.000-1')
	)
);
INSERT INTO tb_interno VALUES (
	tp_interno (
		'000.000.000-4', 
		'Media',
		'4', 
		'Casado',
		'Masculino', 
		TO_DATE('13/03/1987', 'dd/mm/yyyy'),
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Victor' AND N.Sobrenome = 'Godoy'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '4' AND E.Estado = 'Paraiba' AND E.Numero = '4' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcity'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000004')
		),
		TO_DATE('03/07/2010', 'dd/mm/yyyy'),
		'Seguranca',
		2500,
		(SELECT REF(I) FROM tb_interno I WHERE I.CPF = '000.000.000-1')		
	)
);
INSERT INTO tb_interno VALUES (
	tp_interno (
		'000.000.000-5', 
		'Media', 
		'5', 
		'Casado', 
		'Masculino',
		TO_DATE('17/06/1992', 'dd/mm/yyyy'),
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Mateus' AND N.Sobrenome = 'Freitas'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '5' AND E.Estado = 'Paraiba' AND E.Numero = '5' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcife'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000005')
		),
		TO_DATE('17/07/2004', 'dd/mm/yyyy'), 
		'Gerente',
		500,
		(SELECT REF(I) FROM tb_interno I WHERE I.CPF = '000.000.000-1')
	)
);

--Evento

INSERT INTO tb_evento VALUES (
	tp_evento(
		223456,
		'Chegada do inverno',
		'as folhas nao caem',
		TO_DATE('12/03/2014', 'dd/mm/yyyy'),
		TO_DATE('13/03/2014', 'dd/mm/yyyy'),		
		'Privado',
		tp_nt_ref_atracao(
			(SELECT REF(A) FROM tb_atracao A
			WHERE A.Nome = 'Banda Polentinha do Arrocha' )
		) 
	)
);


INSERT INTO tb_evento VALUES (
	tp_evento(
		333456,
		'Competicao Mundial',
		'Loucura demais',
		TO_DATE('12/03/2014', 'dd/mm/yyyy'),
		TO_DATE('14/03/2014', 'dd/mm/yyyy'),		
		'Público',
		tp_nt_ref_atracao(
			(SELECT REF(A) FROM tb_atracao A
			WHERE A.NOME = 'Palhaço Chocolate')
		) 
	)
);

INSERT INTO tb_evento VALUES (
	tp_evento(
		423456,
		'Chegada do verão',
		'Agora as folhas caem',
		TO_DATE('13/03/2014', 'dd/mm/yyyy'),
		TO_DATE('15/03/2014', 'dd/mm/yyyy'),		
		'Privado',
		tp_nt_ref_atracao(
			(SELECT REF(A) FROM tb_atracao A
			WHERE A.NOME = 'Victor e Leo')
		) 
	)
);


INSERT INTO tb_evento VALUES (
	tp_evento(
		623456,
		'Festa de Mateus',
		'Vai ser loucura',
		TO_DATE('16/03/2014', 'dd/mm/yyyy'),
		TO_DATE('19/03/2014', 'dd/mm/yyyy'),		
		'Privado',
		tp_nt_ref_atracao(
			(SELECT REF(A) FROM tb_atracao A
			WHERE A.NOME = 'DJ Samuel')
		) 
	)
);


INSERT INTO tb_evento VALUES (
	tp_evento(
		723456,
		'Festa para Teti',
		'Vai ser top',
		TO_DATE('12/03/2014', 'dd/mm/yyyy'),
		TO_DATE('12/03/2014', 'dd/mm/yyyy'),		
		'Público',
		tp_nt_ref_atracao(
			(SELECT REF(A) FROM tb_atracao A
			WHERE A.NOME = 'Shevchenko e Elloco')
		) 
	)
);

--Aloca

INSERT INTO tb_aloca VALUES (
	tp_aloca (
		(SELECT REF(I) FROM tb_interno I WHERE I.CPF = '000.000.000-1'),
		(SELECT REF(A) FROM tb_area A WHERE A.Codigo = 1),
		(SELECT REF(E) FROM tb_evento E WHERE E.Codigo = 223456)
	)
);
INSERT INTO tb_aloca VALUES (
	tp_aloca (
		(SELECT REF(I) FROM tb_interno I WHERE I.CPF = '000.000.000-2'),
		(SELECT REF(A) FROM tb_area A WHERE A.Codigo = 2),
		(SELECT REF(E) FROM tb_evento E WHERE E.Codigo = 423456)
	)
);
INSERT INTO tb_aloca VALUES (
	tp_aloca (
		(SELECT REF(I) FROM tb_interno I WHERE I.CPF = '000.000.000-3'),
		(SELECT REF(A) FROM tb_area A WHERE A.Codigo = 3),
		(SELECT REF(E) FROM tb_evento E WHERE E.Codigo = 333456)
	)
);
INSERT INTO tb_aloca VALUES (
	tp_aloca (
		(SELECT REF(I) FROM tb_interno I WHERE I.CPF = '000.000.000-4'),
		(SELECT REF(A) FROM tb_area A WHERE A.Codigo = 4),
		(SELECT REF(E) FROM tb_evento E WHERE E.Codigo = 723456)
	)
);
INSERT INTO tb_aloca VALUES (
	tp_aloca (
		(SELECT REF(I) FROM tb_interno I WHERE I.CPF = '000.000.000-5'),
		(SELECT REF(A) FROM tb_area A WHERE A.Codigo = 5),
		(SELECT REF(E) FROM tb_evento E WHERE E.Codigo = 623456)
	)
);