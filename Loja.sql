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
