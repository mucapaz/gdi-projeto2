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

