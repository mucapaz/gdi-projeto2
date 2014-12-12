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