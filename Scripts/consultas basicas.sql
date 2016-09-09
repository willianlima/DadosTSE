 

SELECT Candidato.NOME_CANDIDATO, Candidato.SIGLA_PARTIDO, Tabela.Valor
  FROM ImportacaoCandidato	AS Candidato WITH(NOLOCK)				
  JOIN (
			
			SELECT C.SEQUENCIAL_CANDIDATO					AS Sequencia,
				   SUM(CAST(b.VALOR_BEM AS NUMERIC(14,2)))	AS Valor

			  FROM ImportacaoCandidato				AS C	    WITH(NOLOCK)				
			  JOIN dbo.ImportacaoBensCandidato		AS B		WITH(NOLOCK)		
				ON C.SEQUENCIAL_CANDIDATO = B.SQ_CANDIDATO 
			 WHERE C.SIGLA_UF = 'SP'
			   AND C.NOME_MUNICIPIO_NASCIMENTO = 'SOROCABA'
			 GROUP BY C.SEQUENCIAL_CANDIDATO

	   ) AS Tabela
	ON Candidato.SEQUENCIAL_CANDIDATO = Tabela.Sequencia
 ORDER BY Valor DESC
		

/*
	SELECT COUNT(ID) AS Qtd FROM ImportacaoBensCandidato	WITH(NOLOCK)
	SELECT COUNT(ID) AS Qtd FROM ImportacaoCandidato		WITH(NOLOCK)
	SELECT COUNT(ID) AS Qtd FROM ImportacaoLegenda			WITH(NOLOCK)
	SELECT COUNT(ID) AS Qtd FROM ImportacaoVaga				WITH(NOLOCK)
	SELECT COUNT(ID) AS Qtd FROM ImportacaoArquivo 			WITH(NOLOCK)


*/