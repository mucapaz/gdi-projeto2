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