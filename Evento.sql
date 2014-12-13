	INSERT INTO tb_evento VALUES (
	tp_evento(
		223456,
		'Chegada do inverno',
		'as folhas nao caem',
		TO_DATE('12/03/2014', 'dd/mm/yyyy'),
		TO_DATE('13/03/2014', 'dd/mm/yyyy'),		
		'Privado',
		tp_nt_ref_atracao(
			SELECT REF(A) FROM ATRACAO A
			WHERE A.NOME = 'Banda Polentinha do Arrocha'
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
			SELECT REF(A) FROM ATRACAO A
			WHERE A.NOME = 'Palhaço Chocolate'
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
			SELECT REF(A) FROM ATRACAO A
			WHERE A.NOME = 'Victor e Leo'
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
			SELECT REF(A) FROM ATRACAO A
			WHERE A.NOME = 'DJ Samuel'
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
			SELECT REF(A) FROM ATRACAO A
			WHERE A.NOME = 'Shevchenko e Elloco'
		) 
	)
);
