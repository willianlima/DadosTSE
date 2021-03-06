DELETE FROM AG_ANO_SEXO_PARTIDO_ESTADO_OCUPACAO_CARGO;

INSERT INTO [dbo].AG_ANO_SEXO_PARTIDO_ESTADO_OCUPACAO_CARGO
           ([Ano]
           ,[CandidatoEscolaridadeID]
           ,[PartidoColigacaoID]
           ,[LocalidadeID]
           ,[OcupacaoID]
           ,[CargoPoliticoID]
		   ,QtdCandidatos
           ,[VlrTotalDeclarado]
           ,[QtdTotalDeclarado])
SELECT ANO, 
	   [TPCandidatoEscolaridadeSexo].ID  as TPCandidatoEscolaridadeSexoID, 
	   TFDadoEleitoral.[PartidoColigacaoID],
	   TDLocalidadeEstado.ID as TDLocalidadeEstadoID, 
	   TFDadoEleitoral.OcupacaoID,
	   TFDadoEleitoral.CargoPoliticoID,
	   COUNT([TDCandidato].ID),
	   sum(TFDadoEleitoral.[VlrTotalDeclarado]) as [VlrTotalDeclarado],
	   sum(TFDadoEleitoral.[QtdTotalDeclarado]) as [QtdTotalDeclarado]
FROM TFDadoEleitoral
INNER JOIN TDLocalidade ON TFDadoEleitoral.LocalidadeID = TDLocalidade.ID
INNER JOIN TDLocalidade as TDLocalidadeEstado ON TDLocalidade.SiglaEstado = TDLocalidadeEstado.SiglaEstado
	and TDLocalidadeEstado.Municipio = 'NULL'

INNER JOIN [TPCandidatoEscolaridade] ON TFDadoEleitoral.CandidatoEscolaridadeID= [TPCandidatoEscolaridade].ID
INNER JOIN [TDCandidato] ON [TPCandidatoEscolaridade].CandidatoID= [TDCandidato].ID
INNER JOIN TDCandidato AS TDCandidatoSexo ON TDCandidatoSexo.SEXO = TDCandidato.Sexo 
	and TDCandidatoSexo.CPF = 'NULL' 
	and TDCandidatoSexo.Nome = 'NULL'

LEFT JOIN [TPCandidatoEscolaridade] as [TPCandidatoEscolaridadeSexo] 
	ON [TPCandidatoEscolaridade].EscolaridadeID = [TPCandidatoEscolaridadeSexo].EscolaridadeID 
		AND TDCandidatoSexo.ID = [TPCandidatoEscolaridadeSexo].CandidatoID

GROUP BY ANO, 
	   [TPCandidatoEscolaridadeSexo].ID, 
	   TFDadoEleitoral.[PartidoColigacaoID],
	   TDLocalidadeEstado.ID, 
	   TFDadoEleitoral.OcupacaoID,
	   TFDadoEleitoral.CargoPoliticoID