CREATE TABLE [dbo].[AG_ANO_CANDIDATO_ESTADO_OCUPACAO](
	[Ano] [int] NOT NULL,
	[CandidatoEscolaridadeID] [int] NOT NULL,
	[LocalidadeID] [int] NOT NULL,
	[OcupacaoID] [int] NOT NULL,
	[VlrTotalDeclarado] [numeric](16, 2) NOT NULL,
	[QtdTotalDeclarado] [int] NOT NULL,
 CONSTRAINT [PK_AG_ANO_CANDIDATO_ESTADO_OCUPACAO] PRIMARY KEY CLUSTERED 
(
	[Ano] ASC,
	[CandidatoEscolaridadeID] ASC,
	[LocalidadeID] ASC,
	[OcupacaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AG_ANO_CANDIDATO_ESTADO_OCUPACAO]  WITH CHECK ADD  CONSTRAINT [FK_AG_ANO_CANDIDATO_ESTADO_OCUPACAO_TDLocalidade] FOREIGN KEY([LocalidadeID])
REFERENCES [dbo].[TDLocalidade] ([ID])
GO

ALTER TABLE [dbo].[AG_ANO_CANDIDATO_ESTADO_OCUPACAO] CHECK CONSTRAINT [FK_AG_ANO_CANDIDATO_ESTADO_OCUPACAO_TDLocalidade]
GO

ALTER TABLE [dbo].[AG_ANO_CANDIDATO_ESTADO_OCUPACAO]  WITH CHECK ADD  CONSTRAINT [FK_AG_ANO_CANDIDATO_ESTADO_OCUPACAO_TDOcupacao] FOREIGN KEY([OcupacaoID])
REFERENCES [dbo].[TDOcupacao] ([ID])
GO

ALTER TABLE [dbo].[AG_ANO_CANDIDATO_ESTADO_OCUPACAO] CHECK CONSTRAINT [FK_AG_ANO_CANDIDATO_ESTADO_OCUPACAO_TDOcupacao]
GO

ALTER TABLE [dbo].[AG_ANO_CANDIDATO_ESTADO_OCUPACAO]  WITH CHECK ADD  CONSTRAINT [FK_AG_ANO_CANDIDATO_ESTADO_OCUPACAO_TPCandidatoEscolaridade] FOREIGN KEY([CandidatoEscolaridadeID])
REFERENCES [dbo].[TPCandidatoEscolaridade] ([ID])
GO

ALTER TABLE [dbo].[AG_ANO_CANDIDATO_ESTADO_OCUPACAO] CHECK CONSTRAINT [FK_AG_ANO_CANDIDATO_ESTADO_OCUPACAO_TPCandidatoEscolaridade]
GO

