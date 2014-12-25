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