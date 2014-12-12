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
DROP TABLE tb_telefone CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_loja CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_promocao CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_atracao CASCADE CONSTRAINTS PURGE;

DROP TABLE tb_aluguel_loja CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_externo CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_interno CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_evento CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_aloca CASCADE CONSTRAINTS PURGE;

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

CREATE TABLE tb_telefone OF tp_telefone (
	Numero NOT NULL
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
