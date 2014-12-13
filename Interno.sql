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