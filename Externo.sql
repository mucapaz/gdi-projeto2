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
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Samuel' AND N.Sobrenome = 'Paz'),
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
		(SELECT REF(N) FROM tb_nome_funcionario N WHERE N.Primeiro_nome = 'Tomer' AND N.Sobrenome = 'Lima'),
		(SELECT REF(E) FROM tb_endereco E WHERE E.CEP = '10' AND E.Estado = 'Paraiba' AND E.Numero = '10' AND E.Logradouro = 'Danado' AND E.Bairro = 'Rosa' AND E.Cidade = 'Hellcife'),
		tp_nt_ref_fones (
			(SELECT REF(T) FROM tb_telefone T WHERE T.Numero = '00000000')
		),
		'Baixo',
		'ParcialB3',
		(SELECT REF(L) FROM tb_loja L WHERE L.CNPJ = '86.814.375/0001-00')		
	)
);