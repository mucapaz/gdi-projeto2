INSERT INTO tb_interno VALUES (
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
	TO_DATE('01/07/2014', 'dd/mm/yyyy'),
	'Faxineiro', 
	1000,
	(SELECT REF(I) FROM INTERNO I WHERE I.CPF = '101.105.334-62' )
);

INSERT INTO tp_interno VALUES (
	'101.105.334-62',
	'Media',
	'7',
	'Solteiro',
	'Masculino',
	TO_DATE('08/06/1967', 'dd/mm/yyyy'),
	(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Samuel' AND N.Sobrenome = 'Paz'),
	(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '7' AND E.Estado = 'Pernambuco' AND E.Numero = '7' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcife'),
	tp_nt_ref_fones (
		(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000007')
	),
	TO_DATE('02/07/2014', 'dd/mm/yyyy'),
	'Faxineiro', 
	1330,
	(SELECT REF(I) FROM INTERNO I WHERE I.CPF = '303.105.334-63' )
);

INSERT INTO tp_interno VALUES (
	'303.105.334-63',
	'Media',
	'7',
	'Solteiro',
	'Masculino',
	TO_DATE('08/06/1967', 'dd/mm/yyyy'),
	(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Samuel' AND N.Sobrenome = 'Paz'),
	(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '7' AND E.Estado = 'Pernambuco' AND E.Numero = '7' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcife'),
	tp_nt_ref_fones (
		(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000007')
	),
	TO_DATE('03/07/2012', 'dd/mm/yyyy'),
	'Lixeiro', 
	2000,
	(SELECT REF(I) FROM INTERNO I WHERE I.CPF = '209.105.334-64' )
);


INSERT INTO tp_interno VALUES (
	'209.105.334-64',
	'Media',
	'7',
	'Solteiro',
	'Masculino',
	TO_DATE('08/06/1967', 'dd/mm/yyyy'),
	(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Samuel' AND N.Sobrenome = 'Paz'),
	(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '7' AND E.Estado = 'Pernambuco' AND E.Numero = '7' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcife'),
	tp_nt_ref_fones (
		(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000007')
	),
	TO_DATE('03/03/2002', 'dd/mm/yyyy'),
	'Gerente', 
	8000,
	(SELECT REF(I) FROM INTERNO I WHERE I.CPF = '701.103.334-64' )
);



INSERT INTO tp_interno VALUES (
	'701.103.334-64',
	'Media',
	'7',
	'Solteiro',
	'Masculino',
	TO_DATE('08/06/1967', 'dd/mm/yyyy'),
	(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Samuel' AND N.Sobrenome = 'Paz'),
	(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '7' AND E.Estado = 'Pernambuco' AND E.Numero = '7' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcife'),
	tp_nt_ref_fones (
		(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000007')
	),
	TO_DATE('03/07/2004', 'dd/mm/yyyy'),
	'Analista', 
	3500,
	(SELECT REF(I) FROM INTERNO I WHERE I.CPF = '222.102.334-62' )
);




INSERT INTO tp_interno VALUES (
	'222.102.334-62',
	'Media',
	'7',
	'Solteiro',
	'Masculino',
	TO_DATE('08/06/1967', 'dd/mm/yyyy'),
	(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Samuel' AND N.Sobrenome = 'Paz'),
	(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '7' AND E.Estado = 'Pernambuco' AND E.Numero = '7' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcife'),
	tp_nt_ref_fones (
		(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000007')
	),
	TO_DATE('01/07/2014', 'dd/mm/yyyy'),
	'Faxineiro', 
	1000,
	(SELECT REF(I) FROM INTERNO I WHERE I.CPF = '444.144.334-62' )
);




INSERT INTO tp_interno VALUES (
	'444.144.334-62',
	'Media',
	'7',
	'Solteiro',
	'Masculino',
	TO_DATE('08/06/1967', 'dd/mm/yyyy'),
	(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Samuel' AND N.Sobrenome = 'Paz'),
	(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '7' AND E.Estado = 'Pernambuco' AND E.Numero = '7' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcife'),
	tp_nt_ref_fones (
		(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000007')
	),
	TO_DATE('04/05/2010', 'dd/mm/yyyy'),
	'Segurança', 
	3000,
	(SELECT REF(I) FROM INTERNO I WHERE I.CPF = '999.105.334-99' )
);



INSERT INTO tp_interno VALUES (
	'999.105.334-99',
	'Media',
	'7',
	'Solteiro',
	'Masculino',
	TO_DATE('08/06/1967', 'dd/mm/yyyy'),
	(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Samuel' AND N.Sobrenome = 'Paz'),
	(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '7' AND E.Estado = 'Pernambuco' AND E.Numero = '7' AND E.Logradouro = 'Menino' AND E.Bairro = 'Boa' AND E.Cidade = 'Hellcife'),
	tp_nt_ref_fones (
		(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000007')
	),
	TO_DATE('01/07/2014', 'dd/mm/yyyy'),
	'Faxineiro', 
	1000,
	(SELECT REF(I) FROM INTERNO I WHERE I.CPF = '103.105.334-62' )
);
