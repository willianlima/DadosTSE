UPDATE ImportacaoCandidato									
									
 SET 
	COD_SITUACAO_CANDIDATURA	=	NUMERO_PARTIDO			,				
	DES_SITUACAO_CANDIDATURA	=	SIGLA_PARTIDO				,			
	NUMERO_PARTIDO	=	NOME_PARTIDO							,
	SIGLA_PARTIDO	=	CODIGO_LEGENDA							,
	NOME_PARTIDO	=	SIGLA_LEGENDA							,
	CODIGO_LEGENDA	=	COMPOSICAO_LEGENDA							,
	SIGLA_LEGENDA	=	NOME_LEGENDA						,	
	COMPOSICAO_LEGENDA	=	CODIGO_OCUPACAO						,	
	NOME_LEGENDA	=	DESCRICAO_OCUPACAO							,
	CODIGO_OCUPACAO	=	DATA_NASCIMENTO						,	
	DESCRICAO_OCUPACAO	=	NUM_TITULO_ELEITORAL_CANDIDATO						,	
	DATA_NASCIMENTO	=	IDADE_DATA_ELEICAO			,				
	NUM_TITULO_ELEITORAL_CANDIDATO	=	CODIGO_SEXO		,					
	IDADE_DATA_ELEICAO	=	DESCRICAO_SEXO							,
	CODIGO_SEXO	=	COD_GRAU_INSTRUCAO							,
	DESCRICAO_SEXO	=	DESCRICAO_GRAU_INSTRUCAO						,	
	COD_GRAU_INSTRUCAO	=	CODIGO_ESTADO_CIVIL			,				
	DESCRICAO_GRAU_INSTRUCAO	=	DESCRICAO_ESTADO_CIVIL			,				
	CODIGO_ESTADO_CIVIL	=	CODIGO_COR_RACA				,			
	DESCRICAO_ESTADO_CIVIL	=	DESCRICAO_COR_RACA					,		
	CODIGO_COR_RACA	=	CODIGO_NACIONALIDADE						,	
	DESCRICAO_COR_RACA	=	DESCRICAO_NACIONALIDADE				,			
	CODIGO_NACIONALIDADE	=	SIGLA_UF_NASCIMENTO			,				
	DESCRICAO_NACIONALIDADE	=	CODIGO_MUNICIPIO_NASCIMENTO				,			
	SIGLA_UF_NASCIMENTO	=	NOME_MUNICIPIO_NASCIMENTO			,				
	CODIGO_MUNICIPIO_NASCIMENTO	=	DESPESA_MAX_CAMPANHA	,						
	NOME_MUNICIPIO_NASCIMENTO	=	COD_SIT_TOT_TURNO		,					
	DESPESA_MAX_CAMPANHA	=	DESC_SIT_TOT_TURNO				,			
	COD_SIT_TOT_TURNO	=	NM_EMAIL							
									
 WHERE ID IN (		
 --FEMININO							
 1887280			,
					
 --MASCULINO, 		,
1888858				,
1960699				,
1960712				,
1960718				,
1960720				,
1960729				,
1960736				,
2030909				,
2020652				,
1950187				,
1950197				,
1807154				,
1904483				)