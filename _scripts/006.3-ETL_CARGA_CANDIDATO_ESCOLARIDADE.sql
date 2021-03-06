DELETE FROM TPCandidatoEscolaridade;
GO

DBCC CHECKIDENT ('[TPCandidatoEscolaridade]', RESEED, 0);
GO

INSERT INTO TPCandidatoEscolaridade
SELECT TDCandidato.ID,
	   TDEscolaridade.ID
  FROM ImportacaoCandidato
  JOIN TDCandidato 
    ON TDCandidato.CPF = ImportacaoCandidato.CPF_CANDIDATO
  JOIN TDEscolaridade 
    ON TDEscolaridade.Descricao = ImportacaoCandidato.DESCRICAO_GRAU_INSTRUCAO
 GROUP BY  TDCandidato.ID, TDEscolaridade.ID
 ORDER BY TDCandidato.ID